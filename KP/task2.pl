%3 задание

parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).


married(X, Y) :-
	mother(X, Z), father(Y, Z);
	father(X, Z), mother(Y, Z).

sister(X, Y) :-
	female(X),
	parent(Z, X),
	parent(Z, Y).


zolovka(X,Y) :-
	sister(X, Z),
	married(Z, Y),
	female(X),
	female(Y).

%4 задание

relative(father, X, Y):-
	father(Y,X).

relative(mother, X, Y):-
	mother(Y,X).

relative(child, X, Y):-
	mother(X, Y).

relative(child, X, Y):-
	father(X, Y).

relative(married, X, Y):-
	married(Y,X).

relative(brother, X, Y):-
	mother(mother, X),
	mother(mother, Y),
	father(father, X),
	father(father, Y),
	not(female(Y)),
	not(X = Y).

relative(sister, X, Y):-
	mother(mother, X),
	mother(mother, Y),
	father(father, X),
	father(father, Y),
	female(Y),
	not(X = Y).



relative(relative2-relative1, X, Y):-
	relative(relative1, X, Somebody),
	relative_close(relative2, Somebody, Y).


relative_close(father, X, Y):-
	father(Y,X).

relative_close(mother, X, Y):-
	mother(Y,X).

relative_close(child, X, Y):-
	mother(X, Y).

relative_close(child, X, Y):-
	father(X, Y).

relative_close(sibling, X, Y):-
	mother(mother, X),
	mother(mother, Y),
	father(father, X),
	father(father, Y),
	not(X = Y).












		
