% course(name, session_duration_list, group, required_equipment).
% group iia3

:- multifile course/4.

course(ro, [1], iia3, projector).
course(auto_indus, [1], iia3, none).
course(concept_meca, [1], iia3, none).
course([ro, cpp], [2], iia3, lab).
course(iia3_eng, [1], iia3, none).
course(bdd, [1], iia3, projector).
course(iia_marketing, [1], iia3, projector).
course([auto_indus, bdd], [2], iia3, lab).
course(management_qualite, [1], iia3, none).
course(tech_acqu_comm, [1], iia3, none).
course(reg_indus, [1], iia3, projector).
course(iia3_fr, [1], iia3, none).
course(arch_av_proc, [1], iia3, none).
course([concept_meca, arch_av_proc], [2], iia3, lab).
course(mod_id_est, [1], iia3, projector).
course([mod_id_est, tech_acqu_comm], [2], iia3, lab).