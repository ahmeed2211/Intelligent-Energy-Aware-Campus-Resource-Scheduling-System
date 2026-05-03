:- multifile instructor_available/2.

% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(imi4_grh, t11).
instructor_available(imi4_grh, t12).
instructor_available(imi4_grh, t13).
instructor_available(imi4_grh, t14).
instructor_available(imi4_grh, t15).

instructor_available(cem, t11).
instructor_available(cem, t12).
instructor_available(cem, t13).
instructor_available(cem, t14).
instructor_available(cem, t15).

instructor_available(meca_continus_solides, t11).
instructor_available(meca_continus_solides, t12).
instructor_available(meca_continus_solides, t13).
instructor_available(meca_continus_solides, t14).
instructor_available(meca_continus_solides, t15).

instructor_available(cfao, t11).
instructor_available(cfao, t12).
instructor_available(cfao, t13).
instructor_available(cfao, t14).
instructor_available(cfao, t15).

% Group 2: available Tuesday only
instructor_available(sc_mat, t21).
instructor_available(sc_mat, t22).
instructor_available(sc_mat, t23).
instructor_available(sc_mat, t24).
instructor_available(sc_mat, t25).

instructor_available(cfao, t21).
instructor_available(cfao, t22).
instructor_available(cfao, t23).
instructor_available(cfao, t24).
instructor_available(cfao, t25).

instructor_available(meca_continus_solides, t21).
instructor_available(meca_continus_solides, t22).
instructor_available(meca_continus_solides, t23).
instructor_available(meca_continus_solides, t24).
instructor_available(meca_continus_solides, t25).

instructor_available(comm_machi, t21).
instructor_available(comm_machi, t22).
instructor_available(comm_machi, t23).
instructor_available(comm_machi, t24).
instructor_available(comm_machi, t25).

% Group 3: available Wednesday only
instructor_available(imi4_man_proj, t31).
instructor_available(imi4_man_proj, t32).
instructor_available(imi4_man_proj, t33).
instructor_available(imi4_man_proj, t34).
instructor_available(imi4_man_proj, t35).

instructor_available(info_instrum, t31).
instructor_available(info_instrum, t32).
instructor_available(info_instrum, t33).
instructor_available(info_instrum, t34).
instructor_available(info_instrum, t35).

% Group 4: available Thursday only
instructor_available(imi4_eng, t41).
instructor_available(imi4_eng, t42).
instructor_available(imi4_eng, t43).
instructor_available(imi4_eng, t44).
instructor_available(imi4_eng, t45).

instructor_available(comm_machi, t41).
instructor_available(comm_machi, t42).
instructor_available(comm_machi, t43).
instructor_available(comm_machi, t44).
instructor_available(comm_machi, t45).

instructor_available(info_instrum, t41).
instructor_available(info_instrum, t42).
instructor_available(info_instrum, t43).
instructor_available(info_instrum, t44).
instructor_available(info_instrum, t45).

instructor_available(micro_electro, t41).
instructor_available(micro_electro, t42).
instructor_available(micro_electro, t43).
instructor_available(micro_electro, t44).
instructor_available(micro_electro, t45).

% Group 5: available Friday only
instructor_available(capt_int_com, t51).
instructor_available(capt_int_com, t52).
instructor_available(capt_int_com, t53).
instructor_available(capt_int_com, t54).
instructor_available(capt_int_com, t55).

instructor_available(intell_art, t51).
instructor_available(intell_art, t52).
instructor_available(intell_art, t53).
instructor_available(intell_art, t54).
instructor_available(intell_art, t55).

instructor_available(temps_reel, t51).
instructor_available(temps_reel, t52).
instructor_available(temps_reel, t53).
instructor_available(temps_reel, t54).
instructor_available(temps_reel, t55).

instructor_available(aerodynamique, t51).
instructor_available(aerodynamique, t52).
instructor_available(aerodynamique, t53).
instructor_available(aerodynamique, t54).
instructor_available(aerodynamique, t55).

instructor_available(micro_electro, t51).
instructor_available(micro_electro, t52).
instructor_available(micro_electro, t53).
instructor_available(micro_electro, t54).
instructor_available(micro_electro, t55).

% Group 6: available Saturday only
instructor_available(capt_int_com, t61).
instructor_available(capt_int_com, t62).
instructor_available(capt_int_com, t63).

instructor_available(intell_art, t61).
instructor_available(intell_art, t62).
instructor_available(intell_art, t63).