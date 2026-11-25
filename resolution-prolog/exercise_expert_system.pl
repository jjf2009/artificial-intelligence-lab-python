
start :-
    write('--- Exercise Expert System ---'), nl,
    read_inputs(Inputs),
    ( exercise(Inputs, Goal, Result) ->
        write('Fitness goal: '), write(Goal), nl,
        write('Recommended exercise: '), write(Result), nl
    ;
        write('No matching exercise found.'), nl
    ).

read_inputs(Inputs) :-
    write('Tell me goal or ability 1: '), read(I1),
    write('Tell me goal or ability 2: '), read(I2),
    write('Tell me goal or ability 3: '), read(I3),
    write('Tell me goal or ability 4: '), read(I4),
    Inputs = [I1, I2, I3, I4].

exercise(Inputs, weight_loss, walking) :-
    member(weight_loss, Inputs),
    member(beginner, Inputs),
    member(can_walk, Inputs).

exercise(Inputs, muscle_gain, weight_training) :-
    member(muscle_gain, Inputs),
    member(intermediate, Inputs),
    member(can_lift_weights, Inputs).

exercise(Inputs, flexibility, yoga) :-
    member(flexibility, Inputs),
    member(gentle_movement, Inputs),
    member(low_impact, Inputs).

