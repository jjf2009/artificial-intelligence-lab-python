% Experiment 12.2: Interactive First-Aid Expert System

ask(Question) :-
    write(Question), write(' (yes/no): '), read(Answer), Answer == yes.

first_aid(minor_cut) :-
    ask('Is there a small cut'),
    ask('Is there minor bleeding'),
    ask('Is the person conscious').

first_aid(burn) :-
    ask('Is the skin burned'),
    ask('Is the burn painful'),
    ask('Is there no heavy bleeding').

first_aid(sprain) :-
    ask('Is there swelling near a joint'),
    ask('Is there pain while moving'),
    ask('Did the injury happen after twisting').

start :-
    write('--- First-Aid Expert System ---'), nl,
    ( once(first_aid(Result)) ->
        write('Possible injury: '), write(Result), nl
    ;
        write('No matching injury found.'), nl
    ).
