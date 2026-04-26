% return true if TS1 and TS2 are in the same day
same_day(TS1, TS2):-
    timeslot(TS1, Day, _),
    timeslot(TS2, Day, _).

adjacent_timeslots(TS1, TS2) :-
    timeslot(TS1, Day, P1),
    timeslot(TS2, Day, P2),
    Diff is P1 - P2,
    (Diff =:= 1 ; Diff =:= -1).

room_in_building(Room, Building):-
    room(Room, _, _, Building, _).

course_group(Course, Group):-
    course(Course, _, Group, _).
course_equipment(Course, Equipment):-
    course(Course, _, _, Equipment).

room_capacity(Room, Capacity):-
    room(Room, Capacity, _, _, _).

room_energy_cost(Room, EnergyCost):-
    room(Room, _, _, _, EnergyCost).
% expand_course(+CourseId, -SessionList)
expand_course(Course, Sessions) :-
    course(Course, Durations, _, _),
    length(Durations, NumSessions),
    numlist(1, NumSessions, Indices),
    maplist(pair_with_duration(Course), Indices, Durations, Sessions).

% pair_with_duration(+Course, +Index, +Duration, -Pair)
pair_with_duration(Course, K, Duration, (Course, K, Duration)).

% expand_all_courses(-SessionList)
expand_all_courses(AllSessions) :-
    findall(Course, course(Course, _, _, _), Courses),
    maplist(expand_course, Courses, Nested),
    flatten(Nested, AllSessions).

% consecutive_timeslots(+Duration, -Timeslots)
consecutive_timeslots(Duration, Timeslots) :-
    timeslot(_, Day, P1),
    length(Timeslots, Duration),
    find_consecutive(Day, P1, Duration, Timeslots).

find_consecutive(_, _, 0, []).
find_consecutive(Day, P, N, [TS|Rest]) :-
    N > 0,
    timeslot(TS, Day, P),
    NextP is P + 1,
    NextN is N - 1,
    find_consecutive(Day, NextP, NextN, Rest).