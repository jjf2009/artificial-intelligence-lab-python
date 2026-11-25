% Experiment 12.5: Interactive Eye-Condition Expert System

ask(Question) :-
    write(Question), write(' (yes/no): '), read(Answer), Answer == yes.

eye_condition(allergy) :-
    ask('Do you have itchy eyes'),
    ask('Do you have watery eyes'),
    ask('Do both eyes feel irritated').

eye_condition(eye_strain) :-
    ask('Do you have blurred vision'),
    ask('Do you have eye pain after screen use'),
    ask('Do you have a headache').

eye_condition(conjunctivitis) :-
    ask('Are your eyes red'),
    ask('Do you have eye discharge'),
    ask('Are your eyelids swollen').

start :-
    write('--- Eye Condition Expert System ---'), nl,
    ( once(eye_condition(Result)) ->
        write('Possible eye condition: '), write(Result), nl
    ;
        write('No matching eye condition found.'), nl
    ).
