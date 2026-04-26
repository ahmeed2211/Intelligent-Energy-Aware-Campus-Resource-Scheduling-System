% group_size(Group, Size)
group_size(gl3, 30).
group_size(mpi, 90).
group_size(imi3, 30).

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