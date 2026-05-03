:- multifile instructor_available/2.

% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(devops, t11).
instructor_available(devops, t12).
instructor_available(devops, t13).
instructor_available(devops, t14).
instructor_available(devops, t15).

instructor_available(traitement_images, t11).
instructor_available(traitement_images, t12).
instructor_available(traitement_images, t13).
instructor_available(traitement_images, t14).
instructor_available(traitement_images, t15).

instructor_available(grh, t11).
instructor_available(grh, t12).
instructor_available(grh, t13).
instructor_available(grh, t14).
instructor_available(grh, t15).

% Group 2: available Tuesday only
instructor_available(deep_learning, t21).
instructor_available(deep_learning, t22).
instructor_available(deep_learning, t23).
instructor_available(deep_learning, t24).
instructor_available(deep_learning, t25).

instructor_available(ihm, t21).
instructor_available(ihm, t22).
instructor_available(ihm, t23).
instructor_available(ihm, t24).
instructor_available(ihm, t25).

instructor_available(compilation, t21).
instructor_available(compilation, t22).
instructor_available(compilation, t23).
instructor_available(compilation, t24).
instructor_available(compilation, t25).

instructor_available(traitement_images, t21).
instructor_available(traitement_images, t22).
instructor_available(traitement_images, t23).
instructor_available(traitement_images, t24).
instructor_available(traitement_images, t25).

% Group 3: available Wednesday only
instructor_available(compilation, t31).
instructor_available(compilation, t32).
instructor_available(compilation, t33).
instructor_available(compilation, t34).
instructor_available(compilation, t35).

instructor_available(management_projet, t31).
instructor_available(management_projet, t32).
instructor_available(management_projet, t33).
instructor_available(management_projet, t34).
instructor_available(management_projet, t35).

% Group 4: available Thursday only
instructor_available(test_logiciel, t41).
instructor_available(test_logiciel, t42).
instructor_available(test_logiciel, t43).
instructor_available(test_logiciel, t44).
instructor_available(test_logiciel, t45).

instructor_available(gl4_eng, t41).
instructor_available(gl4_eng, t42).
instructor_available(gl4_eng, t43).
instructor_available(gl4_eng, t44).
instructor_available(gl4_eng, t45).

instructor_available(big_data, t41).
instructor_available(big_data, t42).
instructor_available(big_data, t43).
instructor_available(big_data, t44).
instructor_available(big_data, t45).

instructor_available(compilation, t41).
instructor_available(compilation, t42).
instructor_available(compilation, t43).
instructor_available(compilation, t44).
instructor_available(compilation, t45).

% Group 5: available Friday only
instructor_available(architectures_logiciel, t51).
instructor_available(architectures_logiciel, t52).
instructor_available(architectures_logiciel, t53).
instructor_available(architectures_logiciel, t54).
instructor_available(architectures_logiciel, t55).

instructor_available(devops, t51).
instructor_available(devops, t52).
instructor_available(devops, t53).
instructor_available(devops, t54).
instructor_available(devops, t55).

instructor_available(architectures_logiciel, t51).
instructor_available(architectures_logiciel, t52).
instructor_available(architectures_logiciel, t53).
instructor_available(architectures_logiciel, t54).
instructor_available(architectures_logiciel, t55).

instructor_available(protocoles_de_securite, t51).
instructor_available(protocoles_de_securite, t52).
instructor_available(protocoles_de_securite, t53).
instructor_available(protocoles_de_securite, t54).
instructor_available(protocoles_de_securite, t55).