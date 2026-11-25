% Experiment 12.4: Interactive Exercise Expert System

ask(Question) :-
    write(Question), write(' (yes/no): '), read(Answer), Answer == yes.

exercise(weight_loss, walking) :-
    ask('Is your goal weight loss'),
    ask('Are you a beginner'),
    ask('Can you walk comfortably').

exercise(muscle_gain, weight_training) :-
    ask('Is your goal muscle gain'),
    ask('Are you at an intermediate fitness level'),
    ask('Can you perform strength exercises').

exercise(flexibility, yoga) :-
    ask('Is your goal flexibility'),
    ask('Can you perform gentle movements'),
    ask('Do you want a low-impact exercise').

start :-
    write('--- Exercise Expert System ---'), nl,
    ( once(exercise(Goal, Result)) ->
        write('Fitness goal: '), write(Goal), nl,
        write('Recommended exercise: '), write(Result), nl
    ;
        write('No matching exercise found.'), nl
    ).
