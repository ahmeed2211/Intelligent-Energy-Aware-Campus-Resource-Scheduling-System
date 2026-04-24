same_day(TS1, TS2):-
    timeslot(TS1, Day, _),
    timeslot(TS2, Day, _).

room_in_building(Room, Building):-
    room(Room, _, _, Building, _).

course_group(Course, Group):-
    course(Course, _, _, Group, _).
course_equipment(Course, Equipment):-
    course(Course, _, _, _, Equipment).

room_capacity(Room, Capacity):-
    room(Room, Capacity, _, _, _).

room_energy_cost(Room, EnergyCost):-
    room(Room, _, _, _, EnergyCost).
% expand_course(+CourseId, -SessionList)
expand_course(Course, Sessions) :-
    course(Course, NumSessions, _, _, _),
    numlist(1, NumSessions, Indices),
    maplist(pair_with(Course), Indices, Sessions).

% pair_with(+Course, +Index, -Pair)
pair_with(Course, K, (Course, K)).

% expand_all_courses(-SessionList)
expand_all_courses(AllSessions) :-
    findall(Course, course(Course, _, _, _, _), Courses),
    maplist(expand_course, Courses, Nested),
    flatten(Nested, AllSessions).