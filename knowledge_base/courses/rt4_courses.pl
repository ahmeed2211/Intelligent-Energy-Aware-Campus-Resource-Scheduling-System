% course(name, session_duration_list, group, required_equipment).
% group rt4

:- multifile course/4.

course(theor_lang, [1], rt4, none).
course(fond_syst_rep, [1, 1], rt4, projector).
course(theor_info, [1], rt4, none).
course(rt4_eng, [1], rt4, none).
course(cloud_vis, [1], rt4, none).
course(traite_img, [1], rt4, projector).
course(deep_learni, [1], rt4, none).
course(business_intel, [1], rt4, projector).
course([deep_learni, business_intel], [1], rt4, lab).
course(rt4_grh, [1], rt4, none).
course(eval_perf, [1], rt4, none).
course(rt4_man_proj, [1], rt4, none).
course([eval_perf, traite_img], [1], rt4, lab).
course([cloud_vis, big_dat], [2], rt4, lab).
course(big_dat, [1], rt4, projector).
course([real_virt, crypto], [2], rt4, lab).