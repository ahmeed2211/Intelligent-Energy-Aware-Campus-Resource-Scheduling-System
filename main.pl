:- multifile course/4.
:- multifile instructor_available/2.

:- consult('knowledge_base/groups.pl').
:- consult('knowledge_base/buildings.pl').
:- consult('knowledge_base/rooms.pl').
:- consult('knowledge_base/timeslots.pl').

:- consult('knowledge_base/courses/gl3_courses.pl').
:- consult('knowledge_base/courses/mpi_courses.pl').
:- consult('knowledge_base/courses/imi3_courses.pl').
:- consult('knowledge_base/courses/iia3_courses.pl').
:- consult('knowledge_base/courses/rt3_courses.pl').

:- consult('knowledge_base/availability/gl3_availability.pl').
:- consult('knowledge_base/availability/mpi_availability.pl').
:- consult('knowledge_base/availability/imi3_availability.pl').
:- consult('knowledge_base/availability/iia3_availability.pl').
:- consult('knowledge_base/availability/rt3_availability.pl').

:- consult('core/helpers.pl').
:- consult('core/constraints.pl').
:- consult('core/generator.pl').

solve(Schedule) :-
    expand_all_courses(Sessions),
    schedule(Sessions, Schedule).

solve_all(Schedules) :-
   findall(S, solve(S), Schedules).

compare_sessions(Delta, session(_, G1, _, _, T1), session(_, G2, _, _, T2)) :-
    ( G1 @< G2 -> Delta = '<'
    ; G1 @> G2 -> Delta = '>'
    ; T1 @< T2 -> Delta = '<'
    ; T1 @> T2 -> Delta = '>'
    ; Delta = '='
    ).

print_schedule([]).
print_schedule([session(Course, Group, K, Room, TimeSlot)|Rest]) :-
    format("Group: ~w | Course: ~w | Session: ~w | Room: ~w | TimeSlot: ~w~n", 
           [Group, Course, K, Room, TimeSlot]),
    print_schedule(Rest).

run :-
    ( solve(Schedule)
    -> format("Schedule found:~n"),
       predsort(compare_sessions, Schedule, SortedSchedule),
       print_schedule(SortedSchedule)
    ;  format("No valid schedule found.~n")
    ).