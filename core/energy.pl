% ==========================================
% Energy Usage Calculation & Validation
% Milestone 2 Logic
% ==========================================

% count_room_sessions(+Room, +Day, +Schedule, -Count)
% Counts how many timeslots the Room is used on a specific Day in the Schedule
count_room_sessions(_, _, [], 0).
count_room_sessions(Room, Day, [session(_, _, _, Room, TimeSlot)|Rest], Count) :-
    timeslot(TimeSlot, Day, _), !,
    count_room_sessions(Room, Day, Rest, RestCount),
    Count is RestCount + 1.
count_room_sessions(Room, Day, [_|Rest], Count) :-
    count_room_sessions(Room, Day, Rest, Count).

% room_daily_energy(+Room, +Day, +Schedule, -TotalEnergy)
% Calculates the total energy used by a single room in one day based on the Schedule
room_daily_energy(Room, Day, Schedule, TotalEnergy) :-
    count_room_sessions(Room, Day, Schedule, SessionCount),
    room_energy_cost(Room, HourlyCost),
    TotalEnergy is SessionCount * HourlyCost.

% building_daily_energy(+Building, +Day, +Schedule, -TotalEnergy)
% Calculates the total energy used by all rooms in a building on a specific day
building_daily_energy(Building, Day, Schedule, TotalEnergy) :-
    findall(Room, room_in_building(Room, Building), Rooms),
    sum_rooms_daily_energy(Rooms, Day, Schedule, TotalEnergy).

% Helper to sum energy across a list of rooms
sum_rooms_daily_energy([], _, _, 0).
sum_rooms_daily_energy([Room|Rest], Day, Schedule, TotalSum) :-
    room_daily_energy(Room, Day, Schedule, RoomEnergy),
    sum_rooms_daily_energy(Rest, Day, Schedule, RestEnergy),
    TotalSum is RoomEnergy + RestEnergy.

% validate_building_energy(+Building, +Day, +Schedule)
% Validates that a building does not exceed its daily energy threshold on a specific day
validate_building_energy(Building, Day, Schedule) :-
    building(Building, Threshold),
    building_daily_energy(Building, Day, Schedule, TotalEnergy),
    ( TotalEnergy =< Threshold -> 
        true
    ; 
        format('WARNING: Building ~w exceeded daily threshold on ~w (Usage: ~w, Limit: ~w)~n', [Building, Day, TotalEnergy, Threshold]),
        fail
    ).

% validate_all_buildings_energy(+Schedule)
% Global validation across all buildings and all days in the standard workweek
validate_all_buildings_energy(Schedule) :-
    findall(B, building(B, _), Buildings),
    Days = [mon, tue, wed, thu, fri],
    validate_all_combinations(Buildings, Days, Schedule).

% Helper to validate all Building x Day combinations
validate_all_combinations([], _, _).
validate_all_combinations([Building|Rest], Days, Schedule) :-
    validate_building_days(Building, Days, Schedule),
    validate_all_combinations(Rest, Days, Schedule).

validate_building_days(_, [], _).
validate_building_days(Building, [Day|Rest], Schedule) :-
    validate_building_energy(Building, Day, Schedule),
    validate_building_days(Building, Rest, Schedule).
