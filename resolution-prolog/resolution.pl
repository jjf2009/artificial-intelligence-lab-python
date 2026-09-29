% AI Lab - Experiment 10: Logical inference using Resolution in Prolog
% Prolog proves goals by SLD-resolution (a refutation procedure): to prove a
% goal it repeatedly resolves it against program clauses until it reaches the
% empty clause. This file gives a knowledge base whose queries exercise that.
% Run with SWI-Prolog:  swipl resolution.pl   then try the queries below.

% ---- Facts ----------------------------------------------------------------
man(socrates).
man(plato).
greek(socrates).

% ---- Rules (Horn clauses) -------------------------------------------------
mortal(X) :- man(X).                 % every man is mortal
philosopher(X) :- greek(X), man(X).  % a Greek man is a philosopher
fallible(X) :- philosopher(X).       % every philosopher is fallible

% Example queries (each is proved by resolution):
%   ?- mortal(socrates).        % true  - resolves mortal <- man <- fact
%   ?- philosopher(socrates).   % true
%   ?- fallible(X).             % X = socrates
%   ?- mortal(zeus).            % false - no clause resolves to the empty clause

% ---- A driver that runs the queries and prints the resolution outcome -----
demo :-
    check(mortal(socrates)),
    check(philosopher(socrates)),
    check(fallible(plato)),
    check(mortal(zeus)),
    ( fallible(Who) -> format("Derived: ~w is fallible.~n", [Who]) ; true ).

check(Goal) :-
    ( call(Goal) -> Result = proved ; Result = 'not proved' ),
    format("~w : ~w~n", [Goal, Result]).

:- initialization(demo).
