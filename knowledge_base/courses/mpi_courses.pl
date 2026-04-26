% course(name, session_duration_list, group, required_equipment).
% group mpi

:- multifile course/4.

course(anal, [1, 1], mpi, none).
course(sl, [1, 2], mpi, lab).
course(magneto, [1, 1], mpi, lab).
course(thermo, [1, 1], mpi, projector).
course(electro, [1, 1], mpi, lab).
course(info, [1, 1], mpi, projector).
course(alge, [1, 1], mpi, none).
course(mpi_fr, [1], mpi, none).
course(eco, [1], mpi, none).
course(mpi_eng, [1], mpi, none).
course(prog, [1, 2], mpi, projector).