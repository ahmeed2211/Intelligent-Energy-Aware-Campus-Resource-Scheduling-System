% course(name, session_duration_list, group, required_equipment).
% group bio3

:- multifile course/4.

course(biostatistique, [1], bio3, projector).
course([biostatistique, pharmacologie], [1], bio3, lab).
course(bio3_fr, [1], bio3, projector).
course(biotechnologie_env, [1], bio3, projector).
course(biotechnologie_molecuaires, [1], bio3, projector).
course([genie_genetique, immunologie_technologie_immunologique, technologie_microbienne, genie_biocatalyse], [2], bio3, lab).
course(bio3_eng, [1], bio3, projector).
course([genie_biocatalyse, biotechnologie_molecuaires], [2], bio3, lab).
course(genie_genetique, [1], bio3, projector).
course(bio3_arabe, [1], bio3, projector).
course(immunologie_technologie_immunologique, [1], bio3, projector).
course(genie_biocatalyse, [1], bio3, projector).
course(technologie_microbienne, [1], bio3, projector).
course(pharmacologie, [1], bio3, projector).
course(biotechnologie_env, [1], bio3, lab).
course(bio3_marketing, [1], bio3, none).
course(biosecurite, [1], bio3, none).
course(resistance_materiaux, [1], bio3, projector).