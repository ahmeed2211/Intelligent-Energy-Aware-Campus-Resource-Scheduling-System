% room_capacity_ok(+CourseId, +RoomId)
room_capacity_ok(Course, Room) :-
    course_group(Course, Group),
    group_size(Group, Size),
    room_capacity(Room, Capacity),
    Capacity >= Size.

% equipment_ok(+CourseId, +RoomId)
equipment_ok(Course, Room) :-
    course(Course, _, _, _, none),   % course_needs_no_equipment
    room(Room, _, _, _, _).          % any_room_works
equipment_ok(Course, Room) :-
    course(Course, _, _, _, Equip),
    Equip \= none,
    room(Room, _, Equip, _, _).      % room_must_match_equipment_exactly

% instructor_availability_ok(+CourseId, +TimeSlotId)
instructor_availability_ok(Course, TimeSlot) :-
    instructor_available(Course, TimeSlot).

% no_room_conflict(+Room, +TimeSlot, +Assignments)
no_room_conflict(_,_,[]).
no_room_conflict(Room, TimeSlot, [session(_, _, Room, TimeSlot)|_]) :- !, fail.  % conflict_if_same_room_and_time_slot
no_room_conflict(Room, TimeSlot, [_|Rest]) :-
    no_room_conflict(Room, TimeSlot, Rest).

% no_group_conflict(+Course, +TimeSlot, +Assignments)
no_group_conflict(_,_,[]).
no_group_conflict(Course, TimeSlot, [session(C2, _, _, TimeSlot)|_]) :-
    course(Course, _, _, Group, _),
    course(C2, _, _, Group, _),
    Course \= C2, !, fail.  % conflict_if_same_group_and_time_slot
no_group_conflict(Course, TimeSlot, [_|Rest]) :-
    no_group_conflict(Course, TimeSlot, Rest).
