:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_cors)).

% Allow Cross-Origin Resource Sharing (CORS) from any frontend domain
:- set_setting(http:cors, [*]).

% Load the main scheduling logic
:- consult('main.pl').

% ---------------------------------------------------------
% Server Initialization
% ---------------------------------------------------------

% Starts the HTTP server on the given Port (e.g., server(8080).)
server(Port) :-
    http_server(http_dispatch, [port(Port)]),
    format("~nServer started on http://localhost:~w~n", [Port]),
    format("Try visiting: http://localhost:~w/api/schedule~n", [Port]).

% ---------------------------------------------------------
% API Routes
% ---------------------------------------------------------

% Register the GET /api/schedule endpoint
:- http_handler('/api/schedule', handle_schedule, []).
:- http_handler('/api/optimize/energy', handle_optimize_energy, []).
:- http_handler('/api/optimize/imbalance', handle_optimize_imbalance, []).
:- http_handler('/api/optimize/fairness', handle_optimize_fairness, []).

% ---------------------------------------------------------
% Request Handlers
% ---------------------------------------------------------

handle_schedule(Request) :-
    % Enable CORS for this specific route
    cors_enable(Request, [methods([get])]),
    
    % Attempt to solve the schedule
    ( solve(Schedule) ->
        % Sort the schedule for consistent output
        predsort(compare_sessions, Schedule, SortedSchedule),
        
        % Group sessions by student group
        group_schedule(SortedSchedule, GroupedSchedule),
        get_energy_info(Schedule, EnergyList),
        
        % Build the response Dict
        Response = _{
            status: "success",
            schedule: GroupedSchedule,
            energy: EnergyList
        },
        
        % Send the JSON response
        reply_json_dict(Response)
    ;   
        % Fallback if no schedule could be generated
        reply_json_dict(_{
            status: "error", 
            message: "No valid schedule found."
        })
    ).

handle_optimize_energy(Request) :- handle_optimize(Request, energy).
handle_optimize_imbalance(Request) :- handle_optimize(Request, imbalance).
handle_optimize_fairness(Request) :- handle_optimize(Request, fairness).

handle_optimize(Request, Criteria) :-
    % Enable CORS for this specific route
    cors_enable(Request, [methods([get])]),
    
    % Attempt to optimize the schedule
    ( optimize(Criteria, Schedule, BestScore) ->
        % Sort the schedule for consistent output
        predsort(compare_sessions, Schedule, SortedSchedule),
        
        % Group sessions by student group
        group_schedule(SortedSchedule, GroupedSchedule),
        get_energy_info(Schedule, EnergyList),
        
        % Build the response Dict
        Response = _{
            status: "success",
            criteria: Criteria,
            score: BestScore,
            schedule: GroupedSchedule,
            energy: EnergyList
        },
        
        % Send the JSON response
        reply_json_dict(Response)
    ;   
        % Fallback if no schedule could be generated
        reply_json_dict(_{
            status: "error", 
            message: "No valid schedule found for optimization."
        })
    ).

% ---------------------------------------------------------
% Data Transformation Helpers
% ---------------------------------------------------------

% Groups the flat schedule by student group
group_schedule(Schedule, GroupedScheduleDicts) :-
    % Find all unique groups present in the schedule
    findall(Group, member(session(_, Group, _, _, _), Schedule), AllGroups),
    sort(AllGroups, UniqueGroups),
    % Build the timestable for each group
    maplist(build_group_dict(Schedule), UniqueGroups, GroupedScheduleDicts).

% Builds a dict for a specific group containing their timestable
build_group_dict(Schedule, Group, _{ group: Group, timestable: TimesTable }) :-
    include(is_session_for_group(Group), Schedule, GroupSessions),
    maplist(session_to_times_dict, GroupSessions, TimesTable).

% Helper to filter sessions for a specific group
is_session_for_group(Group, session(_, Group, _, _, _)).

% Maps a session to a dict omitting the group (since its in the parent object)
session_to_times_dict(session(Course, _Group, K, Room, TimeSlot), _{
    course: Course,
    session_index: K,
    room: Room,
    timeslot: TimeSlot
}).

% Gathers energy data for all buildings based on the generated schedule
get_energy_info(Schedule, EnergyList) :-
    findall(B, building(B, _), Buildings),
    Days = [mon, tue, wed, thu, fri],
    maplist(building_energy_dict(Schedule, Days), Buildings, EnergyList).

% Maps building energy data to a SWI-Prolog Dict
building_energy_dict(Schedule, Days, Building, _{
    building: Building,
    weekly_usage: WeeklyTotal,
    weekly_limit: WeeklyThreshold
}) :-
    building_weekly_energy(Building, Days, Schedule, WeeklyTotal),
    building(Building, DailyThreshold),
    WeeklyThreshold is DailyThreshold * 5.
