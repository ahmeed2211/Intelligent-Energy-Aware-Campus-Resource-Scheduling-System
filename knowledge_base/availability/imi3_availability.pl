:- multifile instructor_available/2.

% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(gmao, t11).
instructor_available(gmao, t12).
instructor_available(gmao, t13).
instructor_available(gmao, t14).
instructor_available(gmao, t15).

instructor_available(trait_sign, t11).
instructor_available(trait_sign, t12).
instructor_available(trait_sign, t13).
instructor_available(trait_sign, t14).
instructor_available(trait_sign, t15).

instructor_available(thermo_app, t11).
instructor_available(thermo_app, t12).
instructor_available(thermo_app, t13).
instructor_available(thermo_app, t14).
instructor_available(thermo_app, t15).

instructor_available(instru_opti, t11).
instructor_available(instru_opti, t12).
instructor_available(instru_opti, t13).
instructor_available(instru_opti, t14).
instructor_available(instru_opti, t15).

instructor_available(maintenance, t11).
instructor_available(maintenance, t12).
instructor_available(maintenance, t13).
instructor_available(maintenance, t14).
instructor_available(maintenance, t15).

% Group 2: available Tuesday only
instructor_available(meca_fluide, t21).
instructor_available(meca_fluide, t22).
instructor_available(meca_fluide, t23).
instructor_available(meca_fluide, t24).
instructor_available(meca_fluide, t25).

instructor_available(maintenance, t21).
instructor_available(maintenance, t22).
instructor_available(maintenance, t23).
instructor_available(maintenance, t24).
instructor_available(maintenance, t25).

instructor_available(thermo_indus, t21).
instructor_available(thermo_indus, t22).
instructor_available(thermo_indus, t23).
instructor_available(thermo_indus, t24).
instructor_available(thermo_indus, t25).

instructor_available(resaux_info, t21).
instructor_available(resaux_info, t22).
instructor_available(resaux_info, t23).
instructor_available(resaux_info, t24).
instructor_available(resaux_info, t25).

instructor_available(instru_opti, t21).
instructor_available(instru_opti, t22).
instructor_available(instru_opti, t23).
instructor_available(instru_opti, t24).
instructor_available(instru_opti, t25).

instructor_available(thermo_app, t21).
instructor_available(thermo_app, t22).
instructor_available(thermo_app, t23).
instructor_available(thermo_app, t24).
instructor_available(thermo_app, t25).

instructor_available(imi3_eng, t21).
instructor_available(imi3_eng, t22).
instructor_available(imi3_eng, t23).
instructor_available(imi3_eng, t24).
instructor_available(imi3_eng, t25).

instructor_available(gpao, t21).
instructor_available(gpao, t22).
instructor_available(gpao, t23).
instructor_available(gpao, t24).
instructor_available(gpao, t25).

% Group 3: available Wednesday only
instructor_available(gpao, t31).
instructor_available(gpao, t32).
instructor_available(gpao, t33).
instructor_available(gpao, t34).
instructor_available(gpao, t35).

instructor_available(dsp, t31).
instructor_available(dsp, t32).
instructor_available(dsp, t33).
instructor_available(dsp, t34).
instructor_available(dsp, t35).

instructor_available(thermo_indus, t31).
instructor_available(thermo_indus, t32).
instructor_available(thermo_indus, t33).
instructor_available(thermo_indus, t34).
instructor_available(thermo_indus, t35).

instructor_available(meca_fluide, t31).
instructor_available(meca_fluide, t32).
instructor_available(meca_fluide, t33).
instructor_available(meca_fluide, t34).
instructor_available(meca_fluide, t35).

instructor_available(imi3_eng, t31).
instructor_available(imi3_eng, t32).
instructor_available(imi3_eng, t33).
instructor_available(imi3_eng, t34).
instructor_available(imi3_eng, t35).

instructor_available(arab, t31).
instructor_available(arab, t32).
instructor_available(arab, t33).
instructor_available(arab, t34).
instructor_available(arab, t35).

instructor_available(trait_sign, t31).
instructor_available(trait_sign, t32).
instructor_available(trait_sign, t33).
instructor_available(trait_sign, t34).
instructor_available(trait_sign, t35).

instructor_available(gmao, t31).
instructor_available(gmao, t32).
instructor_available(gmao, t33).
instructor_available(gmao, t34).
instructor_available(gmao, t35).

% Group 4: available Thursday only
instructor_available(dsp, t41).
instructor_available(dsp, t42).
instructor_available(dsp, t43).
instructor_available(dsp, t44).
instructor_available(dsp, t45).

instructor_available(gpao, t41).
instructor_available(gpao, t42).
instructor_available(gpao, t43).
instructor_available(gpao, t44).
instructor_available(gpao, t45).

instructor_available(arab, t41).
instructor_available(arab, t42).
instructor_available(arab, t43).
instructor_available(arab, t44).
instructor_available(arab, t45).

instructor_available(imi3_fr, t41).
instructor_available(imi3_fr, t42).
instructor_available(imi3_fr, t43).
instructor_available(imi3_fr, t44).
instructor_available(imi3_fr, t45).

instructor_available(market, t41).
instructor_available(market, t42).
instructor_available(market, t43).
instructor_available(market, t44).
instructor_available(market, t45).

instructor_available(thermo_indus, t41).
instructor_available(thermo_indus, t42).
instructor_available(thermo_indus, t43).
instructor_available(thermo_indus, t44).
instructor_available(thermo_indus, t45).

instructor_available(meca_fluide, t41).
instructor_available(meca_fluide, t42).
instructor_available(meca_fluide, t43).
instructor_available(meca_fluide, t44).
instructor_available(meca_fluide, t45).

% Group 5: available Friday only
instructor_available(resaux_info, t51).
instructor_available(resaux_info, t52).
instructor_available(resaux_info, t53).
instructor_available(resaux_info, t54).
instructor_available(resaux_info, t55).

instructor_available(trait_sign, t51).
instructor_available(trait_sign, t52).
instructor_available(trait_sign, t53).
instructor_available(trait_sign, t54).
instructor_available(trait_sign, t55).

instructor_available(dsp, t51).
instructor_available(dsp, t52).
instructor_available(dsp, t53).
instructor_available(dsp, t54).
instructor_available(dsp, t55).

instructor_available(gmao, t51).
instructor_available(gmao, t52).
instructor_available(gmao, t53).
instructor_available(gmao, t54).
instructor_available(gmao, t55).

instructor_available(imi3_fr, t51).
instructor_available(imi3_fr, t52).
instructor_available(imi3_fr, t53).
instructor_available(imi3_fr, t54).
instructor_available(imi3_fr, t55).

instructor_available(market, t51).
instructor_available(market, t52).
instructor_available(market, t53).
instructor_available(market, t54).
instructor_available(market, t55).

% Group 6: available Saturday only
instructor_available(gmao, t61).
instructor_available(gmao, t62).
instructor_available(gmao, t63).

instructor_available(trait_sign, t61).
instructor_available(trait_sign, t62).
instructor_available(trait_sign, t63).