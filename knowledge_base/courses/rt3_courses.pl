% course(name, session_duration_list, group, required_equipment).
% group rt3

:- multifile course/4.

course(rt3_fr, [1], rt3, none).
course(stochastiques, [1], rt3, none).
course(securite_res, [1], rt3, projector).
course(inge_proto, [1], rt3, none).
course(rt3_ppp, [1], rt3, none).
course(rt3_marketing, [1], rt3, none).
course(res_radio, [1], rt3, none).
course(logique, [1], rt3, projector).
course(jee, [1], rt3, lab).
course(rt3_eng, [1], rt3, none).
course(rt3_data_anal, [1], rt3, none).
course([rt3_data_anal, jee], [1], rt3, lab).
course([admin_serv, securite_res], [2], rt3, lab).
course(admin_serv, [1], rt3, none).
course(anal_num, [1, 1], rt3, lab).
course(sign_sys, [1], rt3, none).
course(admin_bd, [1], rt3, projector).
course([sign_sys, admin_bd], [1], rt3, lab).