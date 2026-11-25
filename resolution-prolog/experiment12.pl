% Experiment 12: Interactive Expert Systems using Prolog
% Enter answers as yes. or no.

% Common predicate used by all expert systems
ask(Question) :-
    write(Question),
    write(' (yes/no): '),
    read(Answer),
    Answer == yes.

% 1. Disease expert system: three conditions for each disease
disease(flu) :-
    ask('Do you have fever'),
    ask('Do you have cough'),
    ask('Do you have body pain').

disease(common_cold) :-
    ask('Are you sneezing'),
    ask('Do you have a runny nose'),
    ask('Do you have cough').

disease(food_poisoning) :-
    ask('Are you vomiting'),
    ask('Do you have stomach pain'),
    ask('Do you have diarrhea').

start_disease_system :-
    write('--- Disease Expert System ---'), nl,
    ( once(disease(Disease)) ->
        write('Possible disease: '), write(Disease), nl
    ;
        write('No matching disease found.'), nl
    ).

% 2. First-aid expert system: three conditions for each injury
first_aid(minor_cut) :-
    ask('Is there a small cut'),
    ask('Is there minor bleeding'),
    ask('Is the person conscious').

first_aid(burn) :-
    ask('Is the skin burned'),
    ask('Is the burn painful'),
    ask('Is there no heavy bleeding').

first_aid(sprain) :-
    ask('Is there swelling near a joint'),
    ask('Is there pain while moving'),
    ask('Did the injury happen after twisting').

start_first_aid :-
    write('--- First-Aid Expert System ---'), nl,
    ( once(first_aid(Injury)) ->
        write('Possible injury: '), write(Injury), nl,
        write('Apply suitable first aid and seek professional help if needed.'), nl
    ;
        write('No matching injury found.'), nl
    ).

% 3. Nutritional-deficiency expert system: three conditions for each deficiency
deficiency(iron_deficiency) :-
    ask('Do you feel tired frequently'),
    ask('Do you have pale skin'),
    ask('Do you feel weak').

deficiency(vitamin_c_deficiency) :-
    ask('Do your gums bleed'),
    ask('Do you bruise easily'),
    ask('Do wounds heal slowly').

deficiency(vitamin_d_deficiency) :-
    ask('Do you have weak bones'),
    ask('Do you have muscle pain'),
    ask('Do you feel tired frequently').

start_deficiency_system :-
    write('--- Nutritional Deficiency Expert System ---'), nl,
    ( once(deficiency(Result)) ->
        write('Possible deficiency: '), write(Result), nl
    ;
        write('No matching deficiency found.'), nl
    ).

% 4. Exercise expert system: three conditions for each recommendation
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

start_exercise_system :-
    write('--- Exercise Expert System ---'), nl,
    ( once(exercise(Goal, Exercise)) ->
        write('Fitness goal: '), write(Goal), nl,
        write('Recommended exercise: '), write(Exercise), nl
    ;
        write('No matching exercise found.'), nl
    ).

% 5. Eye-condition expert system: three conditions for each condition
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

start_eye_system :-
    write('--- Eye Condition Expert System ---'), nl,
    ( once(eye_condition(Result)) ->
        write('Possible eye condition: '), write(Result), nl
    ;
        write('No matching eye condition found.'), nl
    ).

% Main menu
start :-
    nl,
    write('1. Disease diagnosis'), nl,
    write('2. First-aid recommendation'), nl,
    write('3. Nutritional deficiency'), nl,
    write('4. Exercise recommendation'), nl,
    write('5. Eye condition'), nl,
    write('Choose an option (1-5): '),
    read(Choice),
    start_choice(Choice).

start_choice(1) :- start_disease_system.
start_choice(2) :- start_first_aid.
start_choice(3) :- start_deficiency_system.
start_choice(4) :- start_exercise_system.
start_choice(5) :- start_eye_system.
start_choice(_) :- write('Invalid option.'), nl.

% Run with:
% ?- [experiment12].
% ?- start.
