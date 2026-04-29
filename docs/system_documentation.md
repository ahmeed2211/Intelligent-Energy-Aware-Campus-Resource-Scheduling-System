# Campus Resource Scheduling System - Comprehensive Guide

## System Overview

The Intelligent Energy-Aware Campus Resource Scheduling System is a constraint satisfaction problem (CSP) solver built in Prolog. Its primary goal is to generate valid, conflict-free course schedules for multiple student groups across various rooms and timeslots, while laying the groundwork for energy-aware scheduling (e.g., minimizing energy costs by packing rooms efficiently or adhering to building energy thresholds).

The system uses a declarative approach where the domain (courses, rooms, timeslots, instructors) is defined as a series of Prolog facts (the Knowledge Base), and the logic is handled by a recursive generator paired with hard constraints.

## Scheduling Engine & Algorithm

The core scheduling logic resides in `core/generator.pl`. The system uses a recursive approach with chronological backtracking to find a valid assignment of sessions to rooms and timeslots.

### The Recursive Generator
1. **Input**: A flattened, sorted list of required `(Course, Group, SessionIndex, Duration)` tuples.
2. **Execution**: The `schedule/2` predicate calls `scheduleacc/3`, which recursively processes each session.
3. **Timeslot Binding**: It first searches for consecutive timeslots matching the session's duration.
4. **Room Binding**: Once timeslots are chosen, a valid room is assigned.
5. **Backtracking**: If at any point a constraint fails (e.g., a room conflict occurs later in the schedule), Prolog automatically backtracks, undoing the current assignment and trying the next available room or timeslot.

### Search Heuristics and Optimization
To prevent combinatorial explosion, the search tree is heavily pruned using two key heuristics:

1. **Fail-First (Variable Ordering)**: Implemented in `core/helpers.pl` via `expand_all_courses/1` and `sort_by_availability/2`. Sessions are sorted so that those with the fewest available instructor timeslots are scheduled *first*. By tackling the most constrained variables early, the solver avoids wasting time exploring deep paths that would inevitably fail.
2. **Cheapest-First (Value Ordering & Constraint Pruning)**: In `core/generator.pl` (`check_all_timeslots_no_room/4`), constraints are evaluated in order of computational cost:
   - *Free Fact Lookups*: `instructor_availability_ok/2` and `group_availability_ok/2` are checked first because they are instantaneous `O(1)` operations.
   - *Linear Scans*: `no_group_conflict/3` and `no_course_conflict/3` are checked next, scanning the `Partial` schedule in `O(N)` time.
   - *Expensive Scans*: `no_fatigue_conflict/3` (which includes arithmetic operations to check adjacency) is checked last.

## Core Constraints

The rules dictating a valid schedule are defined in `core/constraints.pl`.

### Domain Constraints (Hard Limits)
- `room_capacity_ok/2`: The selected room must have a capacity greater than or equal to the student group's size.
- `equipment_ok/2`: If a course requires specific equipment (e.g., a projector), the room must possess it.
- `instructor_availability_ok/2`: Instructors specify their exact available timeslots. The session must be scheduled within these slots.
- `group_availability_ok/2`: Respects predefined blackout periods for specific student groups.

### Conflict Constraints (Overlap Prevention)
- `no_room_conflict/3`: Ensures a room is never double-booked in the same timeslot.
- `no_group_conflict/3`: Prevents a student group from being assigned to two different sessions simultaneously.
- `no_course_conflict/3`: Ensures the exact same course session isn't mistakenly scheduled multiple times at the same moment.
- `no_lunch_cut/1`: Ensures multi-hour session blocks do not overlap the designated lunch break.

### Additional Constraints
- `no_fatigue_conflict/3`: Prevents the same course from being scheduled in adjacent timeslots on the same day unless it's part of a continuous block.

## Data Models & Knowledge Base

The system's facts are separated from the logic and stored in the `knowledge_base/` directory.

- **`rooms.pl`**: Defines rooms, their capacities, equipment, building location, and base energy cost.
- **`buildings.pl`**: Defines buildings and their energy thresholds.
- **`groups.pl`**: Defines student group populations.
- **`timeslots.pl`**: Defines the weekly grid of available periods.
- **`courses/`**: Contains group-specific definitions of courses, duration requirements, and equipment needs.
- **`availability/`**: Contains group-specific instructor availability mappings.

For exact argument signatures of these facts, refer to `docs/predicate_contract.md`.

## User Guide

### How to Run the System

1. Open a terminal and navigate to the root directory `campus-scheduling-system`.
2. Start the SWI-Prolog REPL:
   ```bash
   swipl main.pl
   ```
3. To generate and print the first valid schedule, run:
   ```prolog
   ?- run.
   ```
4. If you want to interact with the raw list of session assignments, you can use:
   ```prolog
   ?- solve(Schedule).
   ```

### How to Extend the System

**1. Adding a New Student Group**
- Edit `knowledge_base/groups.pl` and add the group size: `group_enrollment(newgroup, 40).`
- Create a new course file: `knowledge_base/courses/newgroup_courses.pl`.
- Create a new availability file: `knowledge_base/availability/newgroup_availability.pl`.
- Include these new files in `main.pl` via `:- consult(...)`.

**2. Adding a New Room**
- Edit `knowledge_base/rooms.pl`.
- Add a line following the predicate signature: `room(RoomId, Capacity, Equipment, BuildingId, EnergyCost).`

**3. Modifying Constraints**
- New constraints should be added to `core/constraints.pl`.
- Make sure to call the new constraint inside `core/generator.pl`, either in `check_all_timeslots_no_room/4` (if it doesn't rely on room assignment) or after the room is bound (like `check_room_conflicts/3`). Remember to order it by computational cost!
