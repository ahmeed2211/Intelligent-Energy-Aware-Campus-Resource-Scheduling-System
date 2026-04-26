:- multifile instructor_available/2.

% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(anal, t11).
instructor_available(anal, t12).
instructor_available(anal, t13).
instructor_available(anal, t14).
instructor_available(anal, t15).

instructor_available(sl, t11).
instructor_available(sl, t12).
instructor_available(sl, t13).
instructor_available(sl, t14).
instructor_available(sl, t15).

instructor_available(magneto, t11).
instructor_available(magneto, t12).
instructor_available(magneto, t13).
instructor_available(magneto, t14).
instructor_available(magneto, t15).

instructor_available(thermo, t11).
instructor_available(thermo, t12).
instructor_available(thermo, t13).
instructor_available(thermo, t14).
instructor_available(thermo, t15).

% Group 2: available Tuesday only
instructor_available(electro, t21).
instructor_available(electro, t22).
instructor_available(electro, t23).
instructor_available(electro, t24).
instructor_available(electro, t25).

instructor_available(info, t21).
instructor_available(info, t22).
instructor_available(info, t23).
instructor_available(info, t24).
instructor_available(info, t25).

instructor_available(anal, t21).
instructor_available(anal, t22).
instructor_available(anal, t23).
instructor_available(anal, t24).
instructor_available(anal, t25).

instructor_available(thermo, t21).
instructor_available(thermo, t22).
instructor_available(thermo, t23).
instructor_available(thermo, t24).
instructor_available(thermo, t25).

instructor_available(sl, t21).
instructor_available(sl, t22).
instructor_available(sl, t23).
instructor_available(sl, t24).
instructor_available(sl, t25).

% Group 3: available Wednesday only
instructor_available(alge, t31).
instructor_available(alge, t32).
instructor_available(alge, t33).
instructor_available(alge, t34).
instructor_available(alge, t35).

instructor_available(electro, t31).
instructor_available(electro, t32).
instructor_available(electro, t33).
instructor_available(electro, t34).
instructor_available(electro, t35).

instructor_available(info, t31).
instructor_available(info, t32).
instructor_available(info, t33).
instructor_available(info, t34).
instructor_available(info, t35).

% Group 4: available Thursday only
instructor_available(prog, t41).
instructor_available(prog, t42).
instructor_available(prog, t43).
instructor_available(prog, t44).
instructor_available(prog, t45).

instructor_available(thermo, t41).
instructor_available(thermo, t42).
instructor_available(thermo, t43).
instructor_available(thermo, t44).
instructor_available(thermo, t45).

instructor_available(electro, t41).
instructor_available(electro, t42).
instructor_available(electro, t43).
instructor_available(electro, t44).
instructor_available(electro, t45).

instructor_available(mpi_eng, t41).
instructor_available(mpi_eng, t42).
instructor_available(mpi_eng, t43).
instructor_available(mpi_eng, t44).
instructor_available(mpi_eng, t45).

% Group 5: available Friday only
instructor_available(alge, t51).
instructor_available(alge, t52).
instructor_available(alge, t53).
instructor_available(alge, t54).
instructor_available(alge, t55).

instructor_available(mpi_fr, t51).
instructor_available(mpi_fr, t52).
instructor_available(mpi_fr, t53).
instructor_available(mpi_fr, t54).
instructor_available(mpi_fr, t55).

instructor_available(eco, t51).
instructor_available(eco, t52).
instructor_available(eco, t53).
instructor_available(eco, t54).
instructor_available(eco, t55).

instructor_available(magneto, t51).
instructor_available(magneto, t52).
instructor_available(magneto, t53).
instructor_available(magneto, t54).
instructor_available(magneto, t55).