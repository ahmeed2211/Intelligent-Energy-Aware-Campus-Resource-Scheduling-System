% group_size(Group, Size)
group_size(gl3, 30).
group_size(mpi, 90).
group_size(imi3, 30).
group_size(iia3, 30).
group_size(rt3, 30).

% group_blackout(Group, TimeSlot)
% gl3 has wednesday afternoon free but can study on saturday
group_blackout(gl3, t34).
group_blackout(gl3, t35).

% imi3 has Wednesday afternoon free!
group_blackout(imi3, t34).
group_blackout(imi3, t35).

% mpi has wednesday afternoon and saturday free
group_blackout(mpi, t34).
group_blackout(mpi, t35).
group_blackout(mpi, t61).
group_blackout(mpi, t62).
group_blackout(mpi, t63).

% iia3 has wednesday afternoon and saturday free
group_blackout(iia3, t34).
group_blackout(iia3, t35).
group_blackout(iia3, t61).
group_blackout(iia3, t62).
group_blackout(iia3, t63).

% rt3 has wednesday afternoon and saturday free!
group_blackout(rt3, t34).
group_blackout(rt3, t35).
group_blackout(rt3, t61).
group_blackout(rt3, t62).
group_blackout(rt3, t63).

% ch3 has wednesday afternoon free
group_blackout(ch3, t34).
group_blackout(ch3, t35).

% bio3 has wednesday afternoon free and saturday free
group_blackout(bio3, t34).
group_blackout(bio3, t35).