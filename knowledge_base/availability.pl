% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(algo,      t11).
instructor_available(algo,      t12).
instructor_available(algo,      t13).
instructor_available(algo,      t14).
instructor_available(algo,      t15).

instructor_available(num_anal,  t11).
instructor_available(num_anal,  t12).
instructor_available(num_anal,  t13).
instructor_available(num_anal,  t14).
instructor_available(num_anal,  t15).

instructor_available(optim,     t11).
instructor_available(optim,     t12).
instructor_available(optim,     t13).
instructor_available(optim,     t14).
instructor_available(optim,     t15).

instructor_available(data_anal, t11).
instructor_available(data_anal, t12).
instructor_available(data_anal, t13).
instructor_available(data_anal, t14).
instructor_available(data_anal, t15).

% Group 2: available Tuesday only
instructor_available(prolog,    t21).
instructor_available(prolog,    t22).
instructor_available(prolog,    t23).
instructor_available(prolog,    t24).
instructor_available(prolog,    t25).

instructor_available(db,        t21).
instructor_available(db,        t22).
instructor_available(db,        t23).
instructor_available(db,        t24).
instructor_available(db,        t25).

% Group 3: available Wednesday only
instructor_available(marketing, t31).
instructor_available(marketing, t32).
instructor_available(marketing, t33).
instructor_available(marketing, t34).
instructor_available(marketing, t35).

instructor_available(dist_sys,  t31).
instructor_available(dist_sys,  t32).
instructor_available(dist_sys,  t33).
instructor_available(dist_sys,  t34).
instructor_available(dist_sys,  t35).

% Group 4: available Thursday only
instructor_available(fr,        t41).
instructor_available(fr,        t42).
instructor_available(fr,        t43).
instructor_available(fr,        t44).
instructor_available(fr,        t45).

instructor_available(eng,       t41).
instructor_available(eng,       t42).
instructor_available(eng,       t43).
instructor_available(eng,       t44).
instructor_available(eng,       t45).

instructor_available(co_design, t41).
instructor_available(co_design, t42).
instructor_available(co_design, t43).
instructor_available(co_design, t44).
instructor_available(co_design, t45).

instructor_available(complex,   t41).
instructor_available(complex,   t42).
instructor_available(complex,   t43).
instructor_available(complex,   t44).
instructor_available(complex,   t45).

% Group 5: available Friday only
instructor_available(web,       t51).
instructor_available(web,       t52).
instructor_available(web,       t53).
instructor_available(web,       t54).
instructor_available(web,       t55).

instructor_available(concept,   t51).
instructor_available(concept,   t52).
instructor_available(concept,   t53).
instructor_available(concept,   t54).
instructor_available(concept,   t55).