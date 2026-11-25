
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
    contains(tiredness, Symptoms),
    contains(pale_skin, Symptoms),
    contains(weakness, Symptoms).

deficiency(Symptoms, vitamin_c_deficiency) :-
    contains(bleeding_gums, Symptoms),
    contains(easy_bruising, Symptoms),
    contains(slow_healing, Symptoms).

deficiency(Symptoms, vitamin_d_deficiency) :-
    contains(weak_bones, Symptoms),
    contains(muscle_pain, Symptoms),
    contains(tiredness, Symptoms).

contains(Item, [Item|_]).
contains(Item, [_|Tail]) :- contains(Item, Tail).
