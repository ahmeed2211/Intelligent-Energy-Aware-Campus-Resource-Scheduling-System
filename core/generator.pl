schedule(Sessions, Assignments) :-
    scheduleacc(Sessions, [], Assignments).

scheduleacc([], Assignments, Assignments).  % base case: all courses assigned
scheduleacc([(Course,Group,K,Duration)|Rest], Partial, Final) :-
    % 1. Bind timeslot FIRST — instructor availability is the most selective constraint
    consecutive_timeslots(Duration, Timeslots),
    no_lunch_cut(Timeslots),
    % 2. Check instructor + group constraints before touching rooms (cheap fact lookups first)
    check_all_timeslots_no_room(Course, Group, Timeslots, Partial),
    % 3. Bind room LAST — pick the cheapest valid rooms first!
    valid_rooms_for_course_sorted(Course, SortedRooms),
    member(Room, SortedRooms),
    check_room_conflicts(Room, Timeslots, Partial),
    add_sessions(Course, Group, K, Room, Timeslots, Partial, NewPartial),
    scheduleacc(Rest, NewPartial, Final).

% Helper to get all valid rooms for a course, sorted by energy cost (Cheapest-First Heuristic)
valid_rooms_for_course_sorted(Course, SortedRooms) :-
    findall(Room, (room(Room, _, _, _, _), equipment_ok(Course, Room), room_capacity_ok(Course, Room)), ValidRooms),
    maplist(room_energy_key, ValidRooms, KeyedRooms),
    keysort(KeyedRooms, SortedKeyedRooms),
    pairs_values(SortedKeyedRooms, SortedRooms).

room_energy_key(Room, Cost-Room) :-
    room_energy_cost(Room, Cost).

% Check per-timeslot constraints that dont require a room (cheapest to most expensive)
check_all_timeslots_no_room(_, _, [], _).
check_all_timeslots_no_room(Course, Group, [TS|Rest], Partial) :-
    instructor_availability_ok(Course, TS),   % free fact lookup  — prune first
    group_availability_ok(Course, TS),        % free fact lookup  — prune second
    no_group_conflict(Group, TS, Partial),    % O(n) scan         — most selective
    no_course_conflict(Course, TS, Partial),  % O(n) scan
    no_fatigue_conflict(Course, TS, Partial), % O(n) + arithmetic — most expensive, last
    check_all_timeslots_no_room(Course, Group, Rest, Partial).

% Check room-conflict only after a valid room has been bound
check_room_conflicts(_, [], _).
check_room_conflicts(Room, [TS|Rest], Partial) :-
    no_room_conflict(Room, TS, Partial),
    check_room_conflicts(Room, Rest, Partial).

add_sessions(_, _, _, _, [], Partial, Partial).
add_sessions(Course, Group, K, Room, [TS|Rest], Partial, [session(Course, Group, K, Room, TS)|NewPartial]) :-
    add_sessions(Course, Group, K, Room, Rest, Partial, NewPartial).
