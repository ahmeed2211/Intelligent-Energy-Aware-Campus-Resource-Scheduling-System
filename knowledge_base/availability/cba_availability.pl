:- multifile instructor_available/2.

% instructor_available(CourseId, TimeslotId)
% Each fact = instructor is available at that specific timeslot

% Group 1: available Monday only
instructor_available(cba_eng, t11).
instructor_available(cba_eng, t12).
instructor_available(cba_eng, t13).
instructor_available(cba_eng, t14).
instructor_available(cba_eng, t15).

instructor_available(atom_mol, t11).
instructor_available(atom_mol, t12).
instructor_available(atom_mol, t13).
instructor_available(atom_mol, t14).
instructor_available(atom_mol, t15).

instructor_available(chim_org, t11).
instructor_available(chim_org, t12).
instructor_available(chim_org, t13).
instructor_available(chim_org, t14).
instructor_available(chim_org, t15).

instructor_available(stats, t11).
instructor_available(stats, t12).
instructor_available(stats, t13).
instructor_available(stats, t14).
instructor_available(stats, t15).

% Group 2: available Tuesday only
instructor_available(chim_org, t21).
instructor_available(chim_org, t22).
instructor_available(chim_org, t23).
instructor_available(chim_org, t24).
instructor_available(chim_org, t25).

instructor_available(stats, tZ1).
instructor_available(stats, t22).
instructor_available(stats, t23).
instructor_available(stats, t24).
instructor_available(stats, t25).

instructor_available(atom_mol, t21).
instructor_available(atom_mol, t22).
instructor_available(atom_mol, t23).
instructor_available(atom_mol, t24).
instructor_available(atom_mol, t25).

instructor_available(react_nsp, t21).
instructor_available(react_nsp, t22).
instructor_available(react_nsp, t23).
instructor_available(react_nsp, t24).
instructor_available(react_nsp, t25).

% Group 3: available Wednesday only
instructor_available(bioch_struct, t31).
instructor_available(bioch_struct, t32).
instructor_available(bioch_struct, t33).
instructor_available(bioch_struct, t34).
instructor_available(bioch_struct, t35).

instructor_available(physi, t31).
instructor_available(physi, t32).
instructor_available(physi, t33).
instructor_available(physi, t34).
instructor_available(physi, t35).

instructor_available(react_nsp, t31).
instructor_available(react_nsp, t32).
instructor_available(react_nsp, t33).
instructor_available(react_nsp, t34).
instructor_available(react_nsp, t35).

% Group 4: available Thursday only
instructor_available(bioch_struct, t41).
instructor_available(bioch_struct, t42).
instructor_available(bioch_struct, t43).
instructor_available(bioch_struct, t44).
instructor_available(bioch_struct, t45).

instructor_available(stats, t41).
instructor_available(stats, t42).
instructor_available(stats, t43).
instructor_available(stats, t44).
instructor_available(stats, t45).

instructor_available(chim_org, t41).
instructor_available(chim_org, t42).
instructor_available(chim_org, t43).
instructor_available(chim_org, t44).
instructor_available(chim_org, t45).

instructor_available(bioch_struct, t41).
instructor_available(bioch_struct, t42).
instructor_available(bioch_struct, t43).
instructor_available(bioch_struct, t44).
instructor_available(bioch_struct, t45).

instructor_available(atom_mol, t41).
instructor_available(atom_mol, t42).
instructor_available(atom_mol, t43).
instructor_available(atom_mol, t44).
instructor_available(atom_mol, t45).

instructor_available(cba_droit, t41).
instructor_available(cba_droit, t42).
instructor_available(cba_droit, t43).
instructor_available(cba_droit, t44).
instructor_available(cba_droit, t45).

% Group 5: available Friday only
instructor_available(phys_flui, t51).
instructor_available(phys_flui, t52).
instructor_available(phys_flui, t53).
instructor_available(phys_flui, t54).
instructor_available(phys_flui, t55).

instructor_available(react_nsp, t51).
instructor_available(react_nsp, t52).
instructor_available(react_nsp, t53).
instructor_available(react_nsp, t54).
instructor_available(react_nsp, t55).

instructor_available(cba_fr, t51).
instructor_available(cba_fr, t52).
instructor_available(cba_fr, t53).
instructor_available(cba_fr, t54).
instructor_available(cba_fr, t55).

instructor_available(infor, t51).
instructor_available(infor, t52).
instructor_available(infor, t53).
instructor_available(infor, t54).
instructor_available(infor, t55).

instructor_available(physi, t51).
instructor_available(physi, t52).
instructor_available(physi, t53).
instructor_available(physi, t54).
instructor_available(physi, t55).