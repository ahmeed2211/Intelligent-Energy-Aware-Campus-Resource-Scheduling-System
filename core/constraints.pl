% courses_overlap(+C1, +C2)
% Returns true if C1 and C2 represent the same course or if one is a list containing the other.
courses_overlap(C, C) :- !.
courses_overlap(C, List) :- is_list(List), !, memberchk(C, List).
courses_overlap(List, C) :- is_list(List), !, memberchk(C, List).
courses_overlap(List1, List2) :- is_list(List1), is_list(List2), !, (member(X, List1), memberchk(X, List2)).

% return true if the room capacity is ok for the course; the room must have enough capacity for the course
% room_capacity_ok(+CourseId, +RoomId)
room_capacity_ok(Course, Room) :-
    course_group(Course, Group),
    group_size(Group, Size),
    room_capacity(Room, Capacity),
    Capacity >= Size.

% return true if the room equipment is ok for the course; the room must have the same equipment as the course
% equipment_ok(+CourseId, +RoomId)
equipment_ok(Course, Room) :-
    course(Course, _, _, Equip), !,
    ( Equip == none -> true
    ; room(Room, _, Equip, _, _)
    ).

% return true if the instructor is available for the course; the same instructor cannot teach two different courses at the same time
% instructor_availability_ok(+CourseId, +TimeSlotId)
instructor_availability_ok([], _) :- !.
instructor_availability_ok([C|Cs], TimeSlot) :- !,
    instructor_available(C, TimeSlot),
    instructor_availability_ok(Cs, TimeSlot).
instructor_availability_ok(Course, TimeSlot) :-
    instructor_available(Course, TimeSlot).

% return true if there is no room conflict; the same room cannot be used for two different courses at the same time
% no_room_conflict(+Room, +TimeSlot, +Assignments)
no_room_conflict(_,_,[]).
no_room_conflict(Room, TimeSlot, [session(_, _, _, Room, TimeSlot)|_]) :- !, fail.
no_room_conflict(Room, TimeSlot, [_|Rest]) :-
    no_room_conflict(Room, TimeSlot, Rest).

% return true if there is no group conflict; the same group cannot be scheduled at the same time in two different rooms
% no_group_conflict(+Group, +TimeSlot, +Assignments)
no_group_conflict(_,_,[]).
no_group_conflict(Group, TimeSlot, [session(_, Group, _, _, TimeSlot)|_]) :- !, fail.
no_group_conflict(Group, TimeSlot, [_|Rest]) :-
    no_group_conflict(Group, TimeSlot, Rest).

% return true if there is no course conflict; the same course cannot be scheduled at the same time in two different rooms
% no_course_conflict(+Course, +TimeSlot, +Assignments)
no_course_conflict(_,_,[]).
no_course_conflict(Course, TimeSlot, [session(C2, _, _, _, TimeSlot)|_]) :-
    courses_overlap(Course, C2), !, fail.  % conflict_if_same_course_and_time_slot
no_course_conflict(Course, TimeSlot, [_|Rest]) :-
    no_course_conflict(Course, TimeSlot, Rest).

% EXTRA CONSTRAINTS

% return true if there is no fatigue conflict; the same course cannot be scheduled at two different timeslots that are adjacent
% no_fatigue_conflict(+Course, +TimeSlot, +Assignments)
no_fatigue_conflict(_,_,[]).
no_fatigue_conflict(Course, TimeSlot, [session(C2, _, _, _, AssignedTS)|_]) :-
    courses_overlap(Course, C2),
    adjacent_timeslots(TimeSlot, AssignedTS), !, fail.
no_fatigue_conflict(Course, TimeSlot, [_|Rest]) :-
    no_fatigue_conflict(Course, TimeSlot, Rest).

% return true if the courses group is available for the given timeslot
group_availability_ok(Course, TimeSlot) :-
    course_group(Course, Group),
    \+ group_blackout(Group, TimeSlot).

% return true if a session block does not cross the lunch break; a session doesn not spread over ti3 and ti4
% no_lunch_cut(+Timeslots)
no_lunch_cut(Timeslots) :-
    \+ ( member(TS1, Timeslots),
         member(TS2, Timeslots),
         timeslot(TS1, Day, 3),
         timeslot(TS2, Day, 4) ).