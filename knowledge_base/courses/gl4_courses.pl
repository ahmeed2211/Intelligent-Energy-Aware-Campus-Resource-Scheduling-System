% course(name, session_duration_list, group, required_equipment).
% group gl4

:- multifile course/4.

course(devops, [1], gl4, none).
course(traitement_images, [1], gl4, none).
course(grh, [1], gl4, projector).
course(deep_learning, [1], gl4, none).
course([deep_learning, ihm], [2], gl4, lab).
course([compilation, traitement_images], [2], gl4, lab).
course(compilation, [1], gl4, projector).
course(management_projet, [1], gl4, none).
course(test_logiciel, [1], gl4, none).
course(big_data, [1], gl4, projector).
course(gl4_eng, [1], gl4, none).
course([compilation, big_data], [1], gl4, lab).
course(architectures_logiciel, [1], gl4, none).
course([devops, architectures_logiciel], [1], gl4, lab).
course(protocoles_de_securite, [1, 1], gl4, lab).