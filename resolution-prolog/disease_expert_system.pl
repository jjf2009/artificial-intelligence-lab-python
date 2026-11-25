
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
    member(fever, Symptoms),
    member(cough, Symptoms),
    member(body_pain, Symptoms).

disease(Symptoms, common_cold) :-
    member(sneezing, Symptoms),
    member(runny_nose, Symptoms),
    member(cough, Symptoms).

disease(Symptoms, food_poisoning) :-
    member(vomiting, Symptoms),
    member(stomach_pain, Symptoms),
    member(diarrhea, Symptoms).

