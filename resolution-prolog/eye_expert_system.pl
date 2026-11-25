
start :-
    write('--- Eye Condition Expert System ---'), nl,
    read_symptoms(Symptoms),
    ( eye_condition(Symptoms, Result) ->
        write('Possible eye condition: '), write(Result), nl
    ;
        write('No matching eye condition found.'), nl
    ).

read_symptoms(Symptoms) :-
    write('Tell me symptom 1: '), read(S1),
    write('Tell me symptom 2: '), read(S2),
    write('Tell me symptom 3: '), read(S3),
    write('Tell me symptom 4: '), read(S4),
    Symptoms = [S1, S2, S3, S4].

eye_condition(Symptoms, allergy) :-
    contains(itchy_eyes, Symptoms),
    contains(watery_eyes, Symptoms),
    contains(eye_irritation, Symptoms).

eye_condition(Symptoms, eye_strain) :-
    contains(blurred_vision, Symptoms),
    contains(screen_pain, Symptoms),
    contains(headache, Symptoms).

eye_condition(Symptoms, conjunctivitis) :-
    contains(red_eyes, Symptoms),
    contains(eye_discharge, Symptoms),
    contains(swollen_eyelids, Symptoms).

contains(Item, [Item|_]).
contains(Item, [_|Tail]) :- contains(Item, Tail).
