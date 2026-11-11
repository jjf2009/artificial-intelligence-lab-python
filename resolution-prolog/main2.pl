% To identify possible diseases based on symptoms.

% Patient symptoms
has_symptom(amit, fever).
has_symptom(amit, cough).
has_symptom(amit, body_pain).

has_symptom(rahul, sneezing).
has_symptom(rahul, runny_nose).
has_symptom(rahul, cough).

has_symptom(john, vomiting).
has_symptom(john, stomach_pain).
has_symptom(john, diarrhea).

% Diagnosis rules
disease(X, flu) :-
has_symptom(X, fever),
has_symptom(X, cough),
has_symptom(X, body_pain).

disease(X, common_cold) :-
has_symptom(X, sneezing),
has_symptom(X, runny_nose),
has_symptom(X, cough).

disease(X, food_poisoning) :-
has_symptom(X, vomiting),
has_symptom(X, stomach_pain),
has_symptom(X, diarrhea).


% ----------------------------------------------------------------------
% 1. First-aid recommendations based on observed injuries
% ----------------------------------------------------------------------

% Example observations. Add more facts in the form injury(Person, Injury).
injury(neha, minor_cut).
injury(raj, minor_burn).
injury(samir, sprain).
injury(ali, nosebleed).

first_aid(Person, clean_and_cover_wound) :-
    injury(Person, minor_cut).

first_aid(Person, cool_running_water_and_cover_loose) :-
    injury(Person, minor_burn).

first_aid(Person, rest_ice_compression_and_elevation) :-
    injury(Person, sprain).

first_aid(Person, sit_upright_and_apply_pressure) :-
    injury(Person, nosebleed).

% Seek professional help when an injury may be serious.
emergency_help(Person) :-
    injury(Person, severe_bleeding).

emergency_help(Person) :-
    injury(Person, unconscious).

emergency_help(Person) :-
    injury(Person, suspected_fracture).


% ----------------------------------------------------------------------
% 2. Possible nutritional deficiencies based on symptoms
% ----------------------------------------------------------------------

% Example symptom observations. These use the existing has_symptom/2
% predicate, so new observations can be added in the same format.
has_symptom(meera, fatigue).
has_symptom(meera, pale_skin).
has_symptom(vikram, bleeding_gums).
has_symptom(vikram, slow_wound_healing).
has_symptom(zoe, bone_pain).
has_symptom(zoe, muscle_weakness).
has_symptom(omar, numbness).
has_symptom(omar, tingling).

nutritional_deficiency(Person, iron_deficiency) :-
    has_symptom(Person, fatigue),
    has_symptom(Person, pale_skin).

nutritional_deficiency(Person, vitamin_c_deficiency) :-
    has_symptom(Person, bleeding_gums),
    has_symptom(Person, slow_wound_healing).

nutritional_deficiency(Person, vitamin_d_deficiency) :-
    has_symptom(Person, bone_pain),
    has_symptom(Person, muscle_weakness).

nutritional_deficiency(Person, vitamin_b12_deficiency) :-
    has_symptom(Person, numbness),
    has_symptom(Person, tingling).


% ----------------------------------------------------------------------
% 3. Exercise recommendations based on goals and capabilities
% ----------------------------------------------------------------------

% Example profiles. Add facts as fitness_goal(Person, Goal) and
% capability(Person, Capability).
fitness_goal(asha, weight_loss).
capability(asha, beginner).

fitness_goal(ben, muscle_strength).
capability(ben, intermediate).

fitness_goal(cara, flexibility).
capability(cara, low_impact_only).

fitness_goal(dan, cardiovascular_fitness).
capability(dan, beginner).

exercise_recommendation(Person, brisk_walking) :-
    fitness_goal(Person, weight_loss),
    capability(Person, beginner).

exercise_recommendation(Person, bodyweight_training) :-
    fitness_goal(Person, muscle_strength),
    capability(Person, intermediate).

exercise_recommendation(Person, stretching_and_yoga) :-
    fitness_goal(Person, flexibility),
    capability(Person, low_impact_only).

exercise_recommendation(Person, cycling_or_swimming) :-
    fitness_goal(Person, cardiovascular_fitness),
    capability(Person, beginner).


% ----------------------------------------------------------------------
% 4. Possible eye conditions based on reported symptoms
% ----------------------------------------------------------------------

has_eye_symptom(lina, itchy_eyes).
has_eye_symptom(lina, watery_eyes).
has_eye_symptom(rohan, blurred_vision).
has_eye_symptom(rohan, eye_pain).
has_eye_symptom(tara, red_eye).
has_eye_symptom(tara, discharge).
has_eye_symptom(yusuf, difficulty_seeing_at_night).

possible_eye_condition(Person, allergic_conjunctivitis) :-
    has_eye_symptom(Person, itchy_eyes),
    has_eye_symptom(Person, watery_eyes).

possible_eye_condition(Person, eye_strain_or_refractive_error) :-
    has_eye_symptom(Person, blurred_vision),
    has_eye_symptom(Person, eye_pain).

possible_eye_condition(Person, conjunctivitis) :-
    has_eye_symptom(Person, red_eye),
    has_eye_symptom(Person, discharge).

possible_eye_condition(Person, possible_night_vision_problem) :-
    has_eye_symptom(Person, difficulty_seeing_at_night).


% Example queries:
% ?- first_aid(neha, Advice).
% ?- nutritional_deficiency(meera, Deficiency).
% ?- exercise_recommendation(asha, Exercise).
% ?- possible_eye_condition(lina, Condition).
