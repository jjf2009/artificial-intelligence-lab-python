
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
    member(itchy_eyes, Symptoms),
    member(watery_eyes, Symptoms),
    member(eye_irritation, Symptoms).

eye_condition(Symptoms, eye_strain) :-
    member(blurred_vision, Symptoms),
    member(screen_pain, Symptoms),
    member(headache, Symptoms).

eye_condition(Symptoms, conjunctivitis) :-
    member(red_eyes, Symptoms),
    member(eye_discharge, Symptoms),
    member(swollen_eyelids, Symptoms).

