% course(name, session_duration_list, group, required_equipment).
% group imi3

:- multifile course/4.

course(gmao, [1], imi3, none).
course(thermo_app, [1], imi3, projector).
course(instru_opti, [1], imi3, none).
course(maintenance, [1], imi3, none).
course(meca_fluide, [1], imi3, projector).
course(resaux_info, [1, 1], imi3, none).
course(thermo_indus, [1], imi3, projector).
course([gpao, dsp], [2], imi3, lab).
course([gmao, trait_sign], [2], imi3, lab).
course(imi3_eng, [1], imi3, none).
course(trait_sign, [1], imi3, none).
course(gpao, [1], imi3, none).
course(dsp, [1], imi3, none).
course(arab, [1], imi3, none).
course(imi3_fr, [1], imi3, none).
course(market, [1], imi3, none).
course([instru_opti, thermo_app], [2], imi3, lab).
course([meca_fluide, thermo_indus], [2], imi3, lab).