:- consult('./knowledge_base/courses').
:- consult('./knowledge_base/rooms').
:- consult('./knowledge_base/buildings').
:- consult('./knowledge_base/timeslots').
:- consult('./knowledge_base/availability').
:- consult('./knowledge_base/group').

:- consult('./core/helpers').
:- consult('./core/constraints').
:- consult('./core/generator').

solve(Schedule) :-
    expand_all_courses(Sessions),
    schedule(Sessions, Schedule).

solve_all(Schedules) :-
   findall(S, solve(S), Schedules).

print_schedule([]).
print_schedule([session(Course, K, Room, TimeSlot)|Rest]) :-
    format("Course: ~w | Session: ~w | Room: ~w | TimeSlot: ~w~n", 
           [Course, K, Room, TimeSlot]),
    print_schedule(Rest).

run :-
    ( solve(Schedule)
    -> format("Schedule found:~n"),
       print_schedule(Schedule)
    ;  format("No valid schedule found.~n")
    ).