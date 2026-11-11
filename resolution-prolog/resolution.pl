cat(tom).
lovestoeat(kunal,pasta).
ofColour(hair,black).
lovestoplaygames(nawaz).
lazy(pratisha).
dances(lili).
can_cook(priya).

can_cook(jaya).

can_cook(tiyasha).

likes(priya,jaya) :- can_cook(jaya).

likes(priya,tiyasha) :- can_cook(tiyasha).
parent(sudip, piyush).
parent(sudip, raj).
male(piyush).
male(raj).
brother(X,Y) :- parent(Z,X), parent(Z,Y),male(X), male(Y).
happy(lili) :- dances(lili).
hungry(tom) :- search_for_food(tom).
friends(jack, bili) :- lovesCricket(jack), lovesCricket(bili).
goToPlay(ryan) :- isClosed(school), free(ryan).



father(sudip, erika).

father(sudip, siya).

mother(mary,erika).

mother(mary,siya).

female(siya).

female(erika).

sister(X,Y):- father(Z,X), father(Z,Y),mother(V,X), mother(V,Y), female(X), female(Y).




