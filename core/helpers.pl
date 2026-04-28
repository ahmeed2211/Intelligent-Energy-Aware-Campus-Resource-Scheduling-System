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
    course(Course, Durations, Group, _),
    length(Durations, NumSessions),
    numlist(1, NumSessions, Indices),
    maplist(pair_with_duration(Course, Group), Indices, Durations, Sessions).

% pair_with_duration(+Course, +Group, +Index, +Duration, -Pair)
pair_with_duration(Course, Group, K, Duration, (Course, Group, K, Duration)).

% expand_all_courses(-SessionList)
% Sessions are sorted by ascending instructor-availability count (Fail-First heuristic):
% most-constrained sessions are scheduled first so failures are detected early.
expand_all_courses(AllSessions) :-
    findall(Course, course(Course, _, _, _), Courses),
    maplist(expand_course, Courses, Nested),
    flatten(Nested, AllSessions0),
    sort_by_availability(AllSessions0, AllSessions).

% sort_by_availability(+Sessions, -Sorted)
sort_by_availability(Sessions, Sorted) :-
    maplist(session_availability_key, Sessions, Keyed),
    keysort(Keyed, SortedKeyed),
    pairs_values(SortedKeyed, Sorted).

% session_availability_key(+Session, -Key-Session)
session_availability_key(Session, N-Session) :-
    Session = (Course, _, _, _),
    availability_count(Course, N).

% availability_count(+CourseOrList, -N)
% For compound courses (lists), take the minimum count — approximates the intersection size.
availability_count(Course, N) :-
    is_list(Course), !,
    maplist(single_course_avail_count, Course, Counts),
    min_list(Counts, N).
availability_count(Course, N) :-
    findall(TS, instructor_available(Course, TS), TSList),
    length(TSList, N).

% single_course_avail_count(+Course, -N)
single_course_avail_count(C, N) :-
    findall(TS, instructor_available(C, TS), TSList),
    length(TSList, N).

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