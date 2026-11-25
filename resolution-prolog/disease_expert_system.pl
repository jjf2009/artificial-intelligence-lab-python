% Experiment 12.1: Interactive Disease Expert System

ask(Question) :-write(Question), write(' (yes/no): '), read(Answer), Answer == yes.

disease(flu) :-
    ask('Do you have fever'),
    ask('Do you have cough'),
    ask('Do you have body pain').

disease(common_cold) :-
    ask('Are you sneezing'),
    ask('Do you have a runny nose'),
    ask('Do you have cough').

disease(food_poisoning) :-
    ask('Are you vomiting'),
    ask('Do you have stomach pain'),
    ask('Do you have diarrhea').

start :-
    write('--- Disease Expert System ---'), nl,
    ( once(disease(Result)) ->
        write('Possible disease: '), write(Result), nl
    ;
        write('No matching disease found.'), nl
    ).
