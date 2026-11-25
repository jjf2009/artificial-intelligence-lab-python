
start :-
    write('--- First-Aid Expert System ---'), nl,
    read_observations(Observations),
    ( first_aid(Observations, Injury) ->
        write('Possible injury: '), write(Injury), nl,
        write('Apply suitable first aid and seek professional help if needed.'), nl
    ;
        write('No matching injury found.'), nl
    ).

read_observations(Observations) :-
    write('Tell me observation 1: '), read(O1),
    write('Tell me observation 2: '), read(O2),
    write('Tell me observation 3: '), read(O3),
    write('Tell me observation 4: '), read(O4),
    Observations = [O1, O2, O3, O4].

first_aid(Symptoms, minor_cut) :-
    member(small_cut, Symptoms),
    member(minor_bleeding, Symptoms),
    member(conscious, Symptoms).

first_aid(Symptoms, burn) :-
    member(burned_skin, Symptoms),
    member(pain, Symptoms),
    member(no_heavy_bleeding, Symptoms).

first_aid(Symptoms, sprain) :-
    member(swelling, Symptoms),
    member(joint_pain, Symptoms),
    member(twisting_injury, Symptoms).

