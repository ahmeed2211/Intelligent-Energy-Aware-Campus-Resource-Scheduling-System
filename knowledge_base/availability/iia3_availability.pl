:- multifile instructor_available/2.

% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(ro, t11).
instructor_available(ro, t12).
instructor_available(ro, t13).
instructor_available(ro, t14).
instructor_available(ro, t15).

instructor_available(auto_indus, t11).
instructor_available(auto_indus, t12).
instructor_available(auto_indus, t13).
instructor_available(auto_indus, t14).
instructor_available(auto_indus, t15).

instructor_available(concept_meca, t11).
instructor_available(concept_meca, t12).
instructor_available(concept_meca, t13).
instructor_available(concept_meca, t14).
instructor_available(concept_meca, t15).

instructor_available(cpp, t11).
instructor_available(cpp, t12).
instructor_available(cpp, t13).
instructor_available(cpp, t14).
instructor_available(cpp, t15).

% Group 2: available Tuesday only
instructor_available(iia3_eng, t21).
instructor_available(iia3_eng, t22).
instructor_available(iia3_eng, t23).
instructor_available(iia3_eng, t24).
instructor_available(iia3_eng, t25).

instructor_available(bdd, t21).
instructor_available(bdd, t22).
instructor_available(bdd, t23).
instructor_available(bdd, t24).
instructor_available(bdd, t25).

instructor_available(iia_marketing, t21).
instructor_available(iia_marketing, t22).
instructor_available(iia_marketing, t23).
instructor_available(iia_marketing, t24).
instructor_available(iia_marketing, t25).

instructor_available(auto_indus, t21).
instructor_available(auto_indus, t22).
instructor_available(auto_indus, t23).
instructor_available(auto_indus, t24).
instructor_available(auto_indus, t25).

% Group 3: available Wednesday only
instructor_available(management_qualite, t31).
instructor_available(management_qualite, t32).
instructor_available(management_qualite, t33).
instructor_available(management_qualite, t34).
instructor_available(management_qualite, t35).

instructor_available(tech_acqu_comm, t31).
instructor_available(tech_acqu_comm, t32).
instructor_available(tech_acqu_comm, t33).
instructor_available(tech_acqu_comm, t34).
instructor_available(tech_acqu_comm, t35).

instructor_available(reg_indus, t31).
instructor_available(reg_indus, t32).
instructor_available(reg_indus, t33).
instructor_available(reg_indus, t34).
instructor_available(reg_indus, t35).

% Group 4: available Thursday only
instructor_available(reg_indus, t41).
instructor_available(reg_indus, t42).
instructor_available(reg_indus, t43).
instructor_available(reg_indus, t44).
instructor_available(reg_indus, t45).

instructor_available(iia3_fr, t41).
instructor_available(iia3_fr, t42).
instructor_available(iia3_fr, t43).
instructor_available(iia3_fr, t44).
instructor_available(iia3_fr, t45).

instructor_available(arch_av_proc, t41).
instructor_available(arch_av_proc, t42).
instructor_available(arch_av_proc, t43).
instructor_available(arch_av_proc, t44).
instructor_available(arch_av_proc, t45).

instructor_available(concept_meca, t41).
instructor_available(concept_meca, t42).
instructor_available(concept_meca, t43).
instructor_available(concept_meca, t44).
instructor_available(concept_meca, t45).

% Group 5: available Friday only
instructor_available(mod_id_est, t51).
instructor_available(mod_id_est, t52).
instructor_available(mod_id_est, t53).
instructor_available(mod_id_est, t54).
instructor_available(mod_id_est, t55).

instructor_available(tech_acqu_comm, t51).
instructor_available(tech_acqu_comm, t52).
instructor_available(tech_acqu_comm, t53).
instructor_available(tech_acqu_comm, t54).
instructor_available(tech_acqu_comm, t55).

instructor_available(auto_indus, t51).
instructor_available(auto_indus, t52).
instructor_available(auto_indus, t53).
instructor_available(auto_indus, t54).
instructor_available(auto_indus, t55).

instructor_available(bdd, t51).
instructor_available(bdd, t52).
instructor_available(bdd, t53).
instructor_available(bdd, t54).
instructor_available(bdd, t55).