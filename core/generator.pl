
schedule(Sessions, Assignments) :-
    scheduleacc(Sessions, [], Assignments).

scheduleacc([], Assignments, Assignments).  % base case: all courses assigned
scheduleacc([(Course,K)|Rest], Partial, Final) :-
    % select_a_room_and_time
    room(Room, _, _, _, _),
    timeslot(TimeSlot,_,_),
    % checking_constraints from cheapest and most selective to most expensive
    equipment_ok(Course, Room),
    room_capacity_ok(Course, Room),
    instructor_availability_ok(Course, TimeSlot),
    no_room_conflict(Room, TimeSlot, Partial),
    no_course_conflict(Course, TimeSlot, Partial),
    no_group_conflict(Course, TimeSlot, Partial),
    scheduleacc(Rest, [session(Course,K,Room,TimeSlot)|Partial], Final).


