% Experiment 11: Basic Prolog Programs


% 1 
write('Hello World').

% 2 Facts
cat(tom).
lovestoeat(kunal,pasta).
ofColour(hair,black).
lovestoplaygames(nawaz).
search_for_food(tom)
lazy(pratisha).
lovesCricket(jack).
lovesCricket(bili).

% 3 Rules
dances(lili).
can_cook(priya).
can_cook(jaya).
can_cook(tiyasha).
isClosed(school).
free(ryan).
likes(priya,jaya) :- can_cook(jaya).
likes(priya,tiyasha) :- can_cook(tiyasha).
happy(lili) :- dances(lili).
hungry(tom) :- search_for_food(tom).
friends(jack, bili) :- lovesCricket(jack), lovesCricket(bili).
goToPlay(ryan) :- isClosed(school), free(ryan).



% 4 Relations
father(sudip, lili).
father(sudip, joy).
mother(mary,lili).
mother(mary,joy).
female(joy).
female(lili).
sister(X,Y):- father(Z,X), father(Z,Y),mother(V,X), mother(V,Y), female(X), female(Y).


% 5. Recursion
factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, Result1),
    Result is N * Result1.

% 6. Family tree
parent(ravi, amit).
parent(sita, amit).
parent(ravi, priya).
parent(sita, priya).
parent(amit, rahul).
parent(neha, rahul).
parent(amit, arjun).
parent(neha, arjun).

male(ravi).
male(amit).
male(rahul).
male(arjun).

female(sita).
female(priya).
female(neha).

child(X, Y) :-parent(Y, X).

father(X, Y) :-parent(X, Y),male(X).

mother(X, Y) :-parent(X, Y),female(X).

sibling(X, Y) :-parent(P, X),parent(P, Y).

grandfather(X, Y) :-parent(X, Z),parent(Z, Y),male(X).

grandmother(X, Y) :-parent(X, Z),parent(Z, Y),female(X).

ancestor(X, Y) :-parent(X, Y).
ancestor(X, Y) :-parent(X, Z),ancestor(Z, Y).

% Example queries:
% ?- hello.
% ?- student(X).
% ?- father(ravi, amit).
% ?- likes_same_subject(amit, rahul).
% ?- factorial(5, X).
% ?- sibling(amit, priya).
% ?- grandfather(ravi, rahul).
% ?- ancestor(ravi, rahul).
