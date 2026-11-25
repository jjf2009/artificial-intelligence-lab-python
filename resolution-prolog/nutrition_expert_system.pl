
start :-
    write('--- Nutritional Deficiency Expert System ---'), nl,
    read_symptoms(Symptoms),
    ( deficiency(Symptoms, Result) ->
        write('Possible deficiency: '), write(Result), nl
    ;
        write('No matching deficiency found.'), nl
    ).

read_symptoms(Symptoms) :-
    write('Tell me symptom 1: '), read(S1),
    write('Tell me symptom 2: '), read(S2),
    write('Tell me symptom 3: '), read(S3),
    write('Tell me symptom 4: '), read(S4),
    Symptoms = [S1, S2, S3, S4].

deficiency(Symptoms, iron_deficiency) :-
    member(tiredness, Symptoms),
    member(pale_skin, Symptoms),
    member(weakness, Symptoms).

deficiency(Symptoms, vitamin_c_deficiency) :-
    member(bleeding_gums, Symptoms),
    member(easy_bruising, Symptoms),
    member(slow_healing, Symptoms).

deficiency(Symptoms, vitamin_d_deficiency) :-
    member(weak_bones, Symptoms),
    member(muscle_pain, Symptoms),
    member(tiredness, Symptoms).

