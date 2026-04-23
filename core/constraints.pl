
% room_time_ok(+RoomId)
room_time_ok(Room) :-
    assign(_, Room, Time1),
    assign(_, Room, Time2),
    Time1 \= Time2.  % no two courses can be assigned to the same room at the same time

% group_time_ok(+GroupId)
group_time_ok(Group) :-
    assign(Course1, _, Time1),
    assign(Course2, _, Time2),
    course(Course1, _, _, Group, _),
    course(Course2, _, _, Group, _),
    Course1 \= Course2,
    Time1 \= Time2.  % no two courses in the same group can be assigned to the same time slot

% room_capacity_ok(+CourseId, +RoomId)
room_capacity_ok(Course, Room) :-
    course(Course, _, _, Group, _),
    assign(Course, _, Room, _),
    room(Room, Capacity, _, _, _),
    group_size(Group, Size),
    Capacity >= Size.  % room must have enough capacity for the group

% equipment_ok(+CourseId, +RoomId)
equipment_ok(Course, Room) :-
    course(Course, _, _, _, none),   % course needs no equipment
    room(Room, _, _, _, _).          % any room works
equipment_ok(Course, Room) :-
    course(Course, _, _, _, Equip),
    Equip \= none,
    room(Room, _, Equip, _, _).      % room must match exactly

% instructor_availability_ok(+CourseId, +TimeSlotId)
instructor_availability_ok(Course, TimeSlot) :-
    course(Course, _, _, _, _),
    assign(Course, _, _, TimeSlot),
    instructor_available(Course, TimeSlot).  % instructor must be available at the assigned time slot


