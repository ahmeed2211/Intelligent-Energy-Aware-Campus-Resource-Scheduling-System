schedule(Sessions, Assignments) :-
    scheduleacc(Sessions, [], Assignments).

scheduleacc([], Assignments, Assignments).  % base case: all courses assigned
scheduleacc([(Course,Group,K,Duration)|Rest], Partial, Final) :-
    % select_a_room_and_time
    room(Room, _, _, _, _),
    consecutive_timeslots(Duration, Timeslots),
    no_lunch_cut(Timeslots),
    % checking_constraints from cheapest and most selective to most expensive
    equipment_ok(Course, Room),
    room_capacity_ok(Course, Room),
    check_all_timeslots(Course, Group, Room, Timeslots, Partial),
    add_sessions(Course, Group, K, Room, Timeslots, Partial, NewPartial),
    scheduleacc(Rest, NewPartial, Final).

check_all_timeslots(_, _, _, [], _).
check_all_timeslots(Course, Group, Room, [TS|Rest], Partial) :-
    instructor_availability_ok(Course, TS),
    no_room_conflict(Room, TS, Partial),
    no_course_conflict(Course, TS, Partial),
    no_group_conflict(Group, TS, Partial),
    no_fatigue_conflict(Course, TS, Partial),
    group_availability_ok(Course, TS),
    check_all_timeslots(Course, Group, Room, Rest, Partial).

add_sessions(_, _, _, _, [], Partial, Partial).
add_sessions(Course, Group, K, Room, [TS|Rest], Partial, [session(Course, Group, K, Room, TS)|NewPartial]) :-
    add_sessions(Course, Group, K, Room, Rest, Partial, NewPartial).
