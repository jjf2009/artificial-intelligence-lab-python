
hello :-
    write('Hello World'), nl.

student(amit).
student(rahul).
student(priya).

likes(amit, programming).
likes(rahul, mathematics).
likes(priya, biology).
likes(amit, cricket).
likes(rahul, cricket).

parent(ravi, amit).
male(ravi).

father(X, Y) :-
    parent(X, Y),
    male(X).

likes_same_subject(X, Y) :-
    likes(X, Subject),
    likes(Y, Subject),
    X \= Y.

factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, Result1),
    Result is N * Result1.

family_parent(ravi, amit).
family_parent(sita, amit).
family_parent(ravi, priya).
family_parent(sita, priya).
family_parent(amit, rahul).
family_parent(neha, rahul).
family_parent(amit, arjun).
family_parent(neha, arjun).

family_male(ravi).
family_male(amit).
family_male(rahul).
family_male(arjun).

family_female(sita).
family_female(priya).
family_female(neha).

child(X, Y) :-
    family_parent(Y, X).

family_father(X, Y) :-
    family_parent(X, Y),
    family_male(X).

mother(X, Y) :-
    family_parent(X, Y),
    family_female(X).

sibling(X, Y) :-
    family_parent(P, X),
    family_parent(P, Y),
    X \= Y.

grandfather(X, Y) :-
    family_parent(X, Z),
    family_parent(Z, Y),
    family_male(X).

grandmother(X, Y) :-
    family_parent(X, Z),
    family_parent(Z, Y),
    family_female(X).

ancestor(X, Y) :-
    family_parent(X, Y).

ancestor(X, Y) :-
    family_parent(X, Z),
    ancestor(Z, Y).
