% course(Id, Sessions, Duration, Group, Equipment)
% Sessions = number of weekly sessions needed
% Duration = length in timeslots of each session
% Group = student group atom
% Equipment = required equipment type atom
course(c1, 2, 2, g1, projector).

% room(Id, Capacity, Equipment, Building, EnergyCost)
% EnergyCost = hourly energy cost for each room
room(r1, 40, projector, b1, 2).

% building(Id, EnergyThreshold)
% EnergyThreshold = daily energy threshold
building(b1, 200).

% timeslot(Id, Day, Periode)
% Day = mon | tue | wed | thu | fri
timeslot(t1, mon, 1).
timeslot(t2, mon, 2).
timeslot(t6, tue, 6).

% instructor_available(CourseId, TimeslotId)
instructor_available(c1, t1).
instructor_available(c1, t3).

% group_enrollment(GroupId, Size)
% Size = number of students in the group
group_enrollment(gl3,90).

% assign(CourseId, SessionIndex, RoomId, TimeslotId)
Schedule [
assign(c1, 1, r2, t3).
assign(c1, 2, r2, t3).
]
