:- consult('main.pl').

test_count :-
    findall(S, limit(2, solve(S)), L),
    length(L, N),
    write('Count: '), write(N), nl,
    halt.

:- initialization(test_count).
