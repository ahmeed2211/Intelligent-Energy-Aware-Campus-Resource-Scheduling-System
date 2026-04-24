# Intelligent-Energy-Aware-Campus-Resource-Scheduling-System
## Proposed Split for 4 People

The key principle: **minimize blocking dependencies**. Two people can work in parallel from day one if the knowledge base contract is agreed on first (spend 1 day together defining the data structures before splitting).

---

### 🔵 Person 1 — Knowledge Base & Data Architect

**Owns:** The foundation everything else builds on.

- Define all facts: `course/5`, `room/4`, `building/2`, `timeslot/2`, `instructor_available/2`, etc.
- Design the canonical representation of a `session assignment`
- Write helper predicates: `same_day/2`, `overlaps/2`, `room_in_building/2`, etc.
- Document the "contract" (what predicates exist, their signatures) so others can code against it

This person **must finish their core structure by end of week 1**, otherwise everyone is blocked. After that, they assist with testing and write the report's formal modeling section.

---

### 🔴 Person 2 — Constraint Engine (Milestone 1 core)

**Owns:** The recursive generator + hard constraint pruning.

- The main `schedule/2` generator predicate
schedule/2 : calls scheduleacc/3 
- Conflict checks: room-time, group-time, capacity, equipment, instructor
updated in constraints
- Constraint ordering strategy (the intellectually hard part of M1)
from cheapest and most selective to the most expensive
- Performance: ensuring early failure, avoiding combinatorial explosion
solve/1 returns one valid schedule, solveall/1 is (returns all valid schedule): leads to combinatorial explosion without optimization  
This is the **most algorithmically complex role**. Best given to whoever is most comfortable with Prolog's execution model and backtracking.

---

### 🟢 Person 3 — Energy & Arithmetic Layer (Milestone 2)

**Owns:** Everything numeric.

- Energy accumulator threading through the recursive generator (works closely with Person 2)
- `compute_energy/3`, `daily_energy/3`, `total_weekly_energy/2`
- Building threshold enforcement *during* generation
- Global metrics computation

This role requires understanding Person 2's generator to inject the accumulator correctly. The **handoff point** between Person 2 and 3 is the most critical integration moment in the project.

---

### 🟡 Person 4 — Optimization, Evaluation & Presentation

**Owns:** Milestone 3 + the demo.

- Schedule scoring predicates
- `best_schedule/2` using branch-and-bound or findall+sort
- Fairness metrics: load imbalance, room usage variance
- The PowerPoint and demo flow
- Driving the final integration (making sure M1 + M2 + M3 fit together cleanly)

This person can start designing the optimization interface early, then implement once valid schedules are being generated.

---

## Timeline View

```
Week 1   [ALL 4] — agree on data structures, Person 1 writes KB skeleton
Week 2   [P1 finishes KB] [P2 starts generator] [P3 designs energy model]
Week 3   [P2 + P3 integrate energy into generator] [P4 starts optimization design]
Week 4   [P4 implements optimization] [P1+P2 write M1 doc] [P3 writes M2 doc]
Week 5   [Full integration + testing] [P4 drives report + slides]
Week 6   [Buffer + defense prep — everyone can explain everything]
```

---

## One Critical Rule

The project document explicitly says **every student must explain the entire architecture**. So while responsibilities are split, you should each do a "teaching session" to the other 3 at the end of each milestone. Person 2 should be able to explain the energy accumulator; Person 3 should understand constraint pruning. Budget time for this — it saves you during the oral.
