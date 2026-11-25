
start :-
    write('--- Disease Expert System ---'), nl,
    write('Enter symptom 1: '), read(S1),
    write('Enter symptom 2: '), read(S2),
    write('Enter symptom 3: '), read(S3),
    write('Enter symptom 4: '), read(S4),
    Symptoms = [S1, S2, S3, S4],
    ( disease(Symptoms, Disease) ->
        write('Possible disease: '), write(Disease), nl
    ;
        write('No disease found.'), nl
    ).

disease(Symptoms, flu) :-
    contains(fever, Symptoms),
    contains(cough, Symptoms),
    contains(body_pain, Symptoms).

disease(Symptoms, common_cold) :-
    contains(sneezing, Symptoms),
    contains(runny_nose, Symptoms),
    contains(cough, Symptoms).

disease(Symptoms, food_poisoning) :-
    contains(vomiting, Symptoms),
    contains(stomach_pain, Symptoms),
    contains(diarrhea, Symptoms).

contains(Item, [Item|_]).
contains(Item, [_|Tail]) :-
    contains(Item, Tail).
