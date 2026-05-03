% ==========================================
% Optimization, Fairness & Multi-Criteria Evaluation
% Milestone 3 Logic
% ==========================================

% --- Metric 1: Total Energy ---
% schedule_total_energy(+Schedule, -TotalEnergy)
schedule_total_energy(Schedule, TotalEnergy) :-
    findall(B, building(B, _), Buildings),
    sum_weekly_energy(Buildings, Schedule, TotalEnergy).

sum_weekly_energy([], _, 0).
sum_weekly_energy([B|Rest], Schedule, Total) :-
    Days = [mon, tue, wed, thu, fri],
    building_weekly_energy(B, Days, Schedule, BTotal),
    sum_weekly_energy(Rest, Schedule, RestTotal),
    Total is BTotal + RestTotal.

% --- Metric 2: Daily Load Imbalance ---
% Imbalance = sum over days (Emax_day - Emin_day)
schedule_imbalance(Schedule, Imbalance) :-
    Days = [mon, tue, wed, thu, fri],
    sum_daily_imbalance(Days, Schedule, Imbalance).

sum_daily_imbalance([], _, 0).
sum_daily_imbalance([Day|Rest], Schedule, TotalImbalance) :-
    findall(B, building(B, _), Buildings),
    maplist(building_day_energy(Schedule, Day), Buildings, Energies),
    max_list(Energies, MaxE),
    min_list(Energies, MinE),
    Diff is MaxE - MinE,
    sum_daily_imbalance(Rest, Schedule, RestImbalance),
    TotalImbalance is Diff + RestImbalance.

building_day_energy(Schedule, Day, Building, Energy) :-
    building_daily_energy(Building, Day, Schedule, Energy).

% --- Metric 3: Fairness in Room Allocation (Variance) ---
% Var(R) = (1/m) * sum over rooms(Usage(r_j) - average)^2)
schedule_room_variance(Schedule, Variance) :-
    findall(R, room(R,_,_,_,_), Rooms),
    length(Rooms, M),
    M > 0,
    maplist(room_usage(Schedule), Rooms, Usages),
    sum_list(Usages, TotalUsage),
    Average is TotalUsage / M,
    sum_squared_diff(Usages, Average, SumSqDiff),
    Variance is SumSqDiff / M.

room_usage(Schedule, Room, Usage) :-
    Days = [mon, tue, wed, thu, fri],
    maplist(room_day_usage(Schedule, Room), Days, DailyUsages),
    sum_list(DailyUsages, Usage).

room_day_usage(Schedule, Room, Day, Usage) :-
    count_room_sessions(Room, Day, Schedule, Usage).

sum_squared_diff([], _, 0).
sum_squared_diff([U|Rest], Avg, Total) :-
    sum_squared_diff(Rest, Avg, RestTotal),
    Diff is U - Avg,
    Sq is Diff * Diff,
    Total is Sq + RestTotal.

% --- Comparison & Dispatcher ---
schedule_score(Schedule, energy, Score) :-
    schedule_total_energy(Schedule, Score).
schedule_score(Schedule, imbalance, Score) :-
    schedule_imbalance(Schedule, Score).
schedule_score(Schedule, fairness, Score) :-
    schedule_room_variance(Schedule, Score).

% declarative comparison
better_schedule(Criteria, S1, S2, Best) :-
    schedule_score(S1, Criteria, Score1),
    schedule_score(S2, Criteria, Score2),
    (Score1 =< Score2 -> Best = S1 ; Best = S2).

% --- Optimization Logic (Branch & Bound style) ---
:- use_module(library(solution_sequences)).
:- dynamic best_schedule/2. % best_schedule(Score, Schedule)

% optimize(+Criteria, -BestSchedule, -BestScore)
optimize(Criteria, BestSchedule, BestScore) :-
    % Reset dynamic predicates
    retractall(best_schedule(_, _)),
    % Initial large bound
    asserta(best_schedule(1000000000, [])),
    
    % Find schedules and update best so far
    % We use limit/2 to prevent full combinatorial explosion.
    % The generator already uses a Cheapest-First heuristic, so the first few thousand 
    % schedules are already highly energy-optimized. We evaluate up to 100 schedules.
    (   limit(10000, solve(Schedule)),
        schedule_score(Schedule, Criteria, Score),
        best_schedule(CurrentBestScore, _),
        (   Score < CurrentBestScore
        ->  retractall(best_schedule(_, _)),
            asserta(best_schedule(Score, Schedule))
        ;   true
        ),
        fail % force backtracking to find all valid schedules up to the limit
    ;   % Once all possibilities are exhausted, retrieve the best one
        best_schedule(BestScore, BestSchedule),
        BestSchedule \= []
    ).
