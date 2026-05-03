:- multifile instructor_available/2.

% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(theor_lang, t11).
instructor_available(theor_lang, t12).
instructor_available(theor_lang, t13).
instructor_available(theor_lang, t14).
instructor_available(theor_lang, t15).

instructor_available(fond_syst_rep, t11).
instructor_available(fond_syst_rep, t12).
instructor_available(fond_syst_rep, t13).
instructor_available(fond_syst_rep, t14).
instructor_available(fond_syst_rep, t15).

instructor_available(traite_img, t11).
instructor_available(traite_img, t12).
instructor_available(traite_img, t13).
instructor_available(traite_img, t14).
instructor_available(traite_img, t15).

instructor_available(theor_info, t11).
instructor_available(theor_info, t12).
instructor_available(theor_info, t13).
instructor_available(theor_info, t14).
instructor_available(theor_info, t15).

% Group 2: available Tuesday only
instructor_available(theor_info, t21).
instructor_available(theor_info, t22).
instructor_available(theor_info, t23).
instructor_available(theor_info, t24).
instructor_available(theor_info, t25).

instructor_available(rt4_eng, t21).
instructor_available(rt4_eng, t22).
instructor_available(rt4_eng, t23).
instructor_available(rt4_eng, t24).
instructor_available(rt4_eng, t25).

instructor_available(traite_img, t21).
instructor_available(traite_img, t22).
instructor_available(traite_img, t23).
instructor_available(traite_img, t24).
instructor_available(traite_img, t25).

instructor_available(deep_learni, t21).
instructor_available(deep_learni, t22).
instructor_available(deep_learni, t23).
instructor_available(deep_learni, t24).
instructor_available(deep_learni, t25).

instructor_available(eval_perf, t21).
instructor_available(eval_perf, t22).
instructor_available(eval_perf, t23).
instructor_available(eval_perf, t24).
instructor_available(eval_perf, t25).

% Group 3: available Wednesday only
instructor_available(deep_learni, t31).
instructor_available(deep_learni, t32).
instructor_available(deep_learni, t33).

instructor_available(business_intel, t31).
instructor_available(business_intel, t32).
instructor_available(business_intel, t33).

instructor_available(rt4_man_proj, t31).
instructor_available(rt4_man_proj, t32).
instructor_available(rt4_man_proj, t33).

% Group 4: available Thursday only
instructor_available(rt4_grh, t41).
instructor_available(rt4_grh, t42).
instructor_available(rt4_grh, t43).
instructor_available(rt4_grh, t44).
instructor_available(rt4_grh, t45).

instructor_available(rt4_man_proj, t41).
instructor_available(rt4_man_proj, t42).
instructor_available(rt4_man_proj, t43).
instructor_available(rt4_man_proj, t44).
instructor_available(rt4_man_proj, t45).

instructor_available(eval_perf, t41).
instructor_available(eval_perf, t42).
instructor_available(eval_perf, t43).
instructor_available(eval_perf, t44).
instructor_available(eval_perf, t45).

instructor_available(traite_img, t41).
instructor_available(traite_img, t42).
instructor_available(traite_img, t43).
instructor_available(traite_img, t44).
instructor_available(traite_img, t45).

instructor_available(big_dat, t41).
instructor_available(big_dat, t42).
instructor_available(big_dat, t43).
instructor_available(big_dat, t44).
instructor_available(big_dat, t45).

% Group 5: available Friday only
instructor_available(big_dat, t51).
instructor_available(big_dat, t52).
instructor_available(big_dat, t53).
instructor_available(big_dat, t54).
instructor_available(big_dat, t55).

instructor_available(cloud_vis, t51).
instructor_available(cloud_vis, t52).
instructor_available(cloud_vis, t53).
instructor_available(cloud_vis, t54).
instructor_available(cloud_vis, t55).

instructor_available(real_virt, t51).
instructor_available(real_virt, t52).
instructor_available(real_virt, t53).
instructor_available(real_virt, t54).
instructor_available(real_virt, t55).

instructor_available(crypto, t51).
instructor_available(crypto, t52).
instructor_available(crypto, t53).
instructor_available(crypto, t54).
instructor_available(crypto, t55).