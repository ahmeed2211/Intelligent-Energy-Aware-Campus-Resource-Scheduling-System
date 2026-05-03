% course(name, session_duration_list, group, required_equipment).
% group cba

:- multifile course/4.

course(cba_eng, [1], cba, none).
course(atom_mol, [1], cba, projector).
course(chim_org, [1, 1, 1], cba, lab).
course(stats, [1], cba, projector).
course([react_nsp, chim_org], [2], cba, lab).
course(bioch_struct, [1, 1, 2], cba, none).
course(physi, [1], cba, none).
course(react_nsp, [1, 1], cba, lab).
course(phys_flui, [1], cba, projector).
course(cba_fr, [1], cba, none).
course([infor, physi], [2], cba, lab).