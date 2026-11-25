% Experiment 12.3: Interactive Nutritional-Deficiency Expert System

ask(Question) :-
    write(Question), write(' (yes/no): '), read(Answer), Answer == yes.

deficiency(iron_deficiency) :-
    ask('Do you feel tired frequently'),
    ask('Do you have pale skin'),
    ask('Do you feel weak').

deficiency(vitamin_c_deficiency) :-
    ask('Do your gums bleed'),
    ask('Do you bruise easily'),
    ask('Do wounds heal slowly').

deficiency(vitamin_d_deficiency) :-
    ask('Do you have weak bones'),
    ask('Do you have muscle pain'),
    ask('Do you feel tired frequently').

start :-
    write('--- Nutritional Deficiency Expert System ---'), nl,
    ( once(deficiency(Result)) ->
        write('Possible deficiency: '), write(Result), nl
    ;
        write('No matching deficiency found.'), nl
    ).
