% course(name, session_duration_list, group, required_equipment).
% group iia4

:- multifile course/4.

course(iia4_man_proj, [1], iia4, none).
course(comm_opti, [1, 2], iia4, projector).
course(imag_embar, [1], iia4, none).
course([imag_embar, mape], [2], iia4, none).
course(syst_non_lin, [1], iia4, projector).
course(mod_anal_eval, [1], iia4, none).
course(iia4_eng, [1], iia4, none).
course(concept_ordi, [1], iia4, none).
course(rli, [1, 2], iia4, none).
course(iia4_grh, [1], iia4, projector).
course([arch_prog_sys, mach_learn, data_sc], [1], iia4, lab).
course(inter_liot, [1], iia4, none).
course([inter_liot, data_sc], [2], iia4, lab).
course([arch_prog_sys, mach_learn], [2], iia4, lab).