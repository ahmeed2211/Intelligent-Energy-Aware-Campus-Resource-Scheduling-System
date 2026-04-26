campus-scheduling-system/
├── main.pl                 # Entry point of the application
├── README.md               # Project overview and team split guidelines
├── core/                   # Core scheduling and constraint logic
│   ├── generator.pl        # The scheduling algorithm
│   ├── constraints.pl      # Hard constraints to validate assignments
│   └── helpers.pl          # Utility functions for data retrieval and manipulation
├── knowledge_base/         # Facts defining the scheduling environment
│   ├── availability.pl     # Instructor availability per course
│   ├── buildings.pl        # Building data and energy thresholds
│   ├── courses.pl          # Courses, required sessions, groups, and equipment
│   ├── group.pl            # Student group definitions and sizes
│   ├── rooms.pl            # Room capacities, equipment, and building assignments
│   └── timeslots.pl        # Available timeslots throughout the week
├── docs/                   # Documentation and architectural contracts
│   ├── analytical_questions.md
│   ├── architecture.md
│   └── predicate_contract.md
└── tests/                  # Unit tests for facts, constraints, and helpers
    ├── test_constraints.pl
    ├── test_facts.pl
    └── test_helpers.pl
