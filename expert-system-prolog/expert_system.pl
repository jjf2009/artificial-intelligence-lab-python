% AI Lab - Experiment 9: Expert System using Prolog
% A small backward-chaining animal-identification expert system.
% Run with SWI-Prolog:   swipl expert_system.pl   then  ?- identify.

:- dynamic known/2.

% ---- Rule base: an animal is identified from its characteristics ----------
animal(cheetah)  :- mammal, carnivore, has(tawny_colour), has(dark_spots).
animal(tiger)    :- mammal, carnivore, has(tawny_colour), has(black_stripes).
animal(giraffe)  :- ungulate, has(long_neck), has(dark_spots).
animal(zebra)    :- ungulate, has(black_stripes).
animal(ostrich)  :- bird, \+ flies, has(long_neck), has(black_and_white_colour).
animal(penguin)  :- bird, \+ flies, swims, has(black_and_white_colour).

% ---- Intermediate conclusions --------------------------------------------
mammal    :- has(hair) ; gives(milk).
bird      :- has(feathers) ; (flies, lays_eggs).
carnivore :- eats(meat) ; (has(pointed_teeth), has(claws)).
ungulate  :- mammal, (has(hooves) ; chews_cud).

% ---- Ask the user about primitive facts, remember the answers ------------
has(X)    :- ask(has, X).
eats(X)   :- ask(eats, X).
gives(X)  :- ask(gives, X).
lays_eggs :- ask(property, lays_eggs).
flies     :- ask(property, flies).
swims     :- ask(property, swims).
chews_cud :- ask(property, chews_cud).

ask(Kind, Value) :- known(yes, Kind-Value), !.
ask(Kind, Value) :- known(no,  Kind-Value), !, fail.
ask(Kind, Value) :-
    format("Does the animal have/do '~w (~w)'? (yes/no) ", [Value, Kind]),
    read(Reply),
    assertz(known(Reply, Kind-Value)),
    Reply == yes.

% ---- Entry point ----------------------------------------------------------
identify :-
    retractall(known(_, _)),
    ( animal(A) -> format("The animal is a ~w.~n", [A])
    ; write("Could not identify the animal from the given facts."), nl ).
