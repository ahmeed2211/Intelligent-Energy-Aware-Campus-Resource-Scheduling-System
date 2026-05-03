:- consult('main.pl').

% Override consecutive_timeslots
:- redefine_system_predicate(consecutive_timeslots/2).
:- abolish(consecutive_timeslots/2).

consecutive_timeslots(Duration, Timeslots) :-
    findall((Day, P1), (timeslot(_, Day, P1), PEnd is P1 + Duration - 1, PEnd =< 5), AllStarts),
    random_permutation(AllStarts, ShuffledStarts),
    member((Day, P1), ShuffledStarts),
    length(Timeslots, Duration),
    find_consecutive(Day, P1, Duration, Timeslots).

test_random :-
    ( limit(1, (solve(S), write('Found random schedule'), nl, fail)) ; true ),
    halt.

:- initialization(test_random).
