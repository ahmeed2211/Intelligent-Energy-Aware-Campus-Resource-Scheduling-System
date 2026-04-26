:- multifile course/4.
:- multifile instructor_available/2.

:- consult('knowledge_base/groups.pl').
:- consult('knowledge_base/buildings.pl').
:- consult('knowledge_base/rooms.pl').
:- consult('knowledge_base/timeslots.pl').

:- consult('knowledge_base/courses/gl3_courses.pl').
:- consult('knowledge_base/courses/mpi_courses.pl').

:- consult('knowledge_base/availability/gl3_availability.pl').
:- consult('knowledge_base/availability/mpi_availability.pl').

:- consult('core/helpers.pl').
:- consult('core/constraints.pl').
:- consult('core/generator.pl').

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