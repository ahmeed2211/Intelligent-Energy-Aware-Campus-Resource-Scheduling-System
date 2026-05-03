% course(name, session_duration_list, group, required_equipment).
% group imi4

:- multifile course/4.

course(imi4_grh, [1], imi4, projector).
course(cem, [1], imi4, none).
course(meca_continus_solides, [1], imi4, none).
course([cem, cfao], [2], imi4, lab).
course(sc_mat, [1], imi4, none).
course(cfao, [1], imi4, projector).
course([meca_continus_solides, comm_machi], [2], imi4, lab).
course(imi4_man_proj, [1], imi4, none).
course(info_instrum, [1, 2], imi4, none).
course(imi4_eng, [1], imi4, none).
course([capt_int_com, micro_electro], [1], imi4, lab).
course([intell_art, temps_reel], [1], imi4, projector).
course([aerodynamique, micro_electro], [1], imi4, projector).
course([aerodynamique, micro_electro, micro_electro, temps_reel], [2], imi4, lab).
course([capt_int_com, intell_art], [2], imi4, lab).