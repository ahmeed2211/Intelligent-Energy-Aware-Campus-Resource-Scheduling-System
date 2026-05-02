# Project Architecture

This project follows a decoupled client-server architecture, with a **Prolog constraint engine** acting as the intelligence layer and a **React dashboard** acting as the presentation layer.

---

## 1. Backend Architecture (Logic Layer)

The backend is built in SWI-Prolog and is responsible for solving the scheduling problem.

- **`main.pl`**: The entry point that coordinates the loading of the knowledge base and triggering the solver.
- **`core/generator.pl`**: Implements a recursive backtracking algorithm with pruning. It generates potential schedules and checks them against constraints in real-time.
- **`core/constraints.pl`**: Defines the "rules of the world" (e.g., no two groups can be in the same room at the same time).
- **`core/energy.pl`**: Tracks the cumulative energy cost of assignments and fails if a building's daily threshold is exceeded.
- **`server.pl`**: Wraps the solver in an HTTP server, exposing a JSON endpoint (`/api/schedule`).

---

## 2. Frontend Architecture (Presentation Layer)

The frontend is a modern React application optimized for institutional data visualization.

- **Asynchronous Data Flow**: `App.jsx` uses `useEffect` and `Axios` to fetch the schedule. It manages the `loading` and `error` states to ensure a smooth user experience.
- **Modular Component Design**:
    - **`ScheduleTimeline.jsx`**: A high-performance table-based grid that handles horizontal merging for multi-slot sessions.
    - **`EnergyDashboard.jsx`**: Visualizes building energy consumption vs. limits using high-contrast data cards.
- **Styling System**: We use a modular CSS-in-JS approach with **Styled-Components**. Each component has a matching `.styles.js` file (e.g., `App.styles.js`) to keep the logic and design concerns separate.
- **`data.js`**: A pure utility layer that transforms the raw API response into the specific formats needed by the dashboard components.

---

## 3. File Structure

```text
campus-scheduling-system/
├── server.pl               # SWI-Prolog HTTP API Server
├── main.pl                 # Backend Entry Point
├── core/                   # Prolog Logic
│   ├── generator.pl        # Constraint Solver
│   ├── constraints.pl      # Validation Rules
│   └── energy.pl           # Energy Monitoring
├── knowledge_base/         # Facts (Courses, Rooms, Availability)
├── frontend/               # React Dashboard
│   ├── src/
│   │   ├── components/     # UI Components
│   │   ├── helpers/        # Translater & Utilities
│   │   ├── App.jsx         # Root Component (Data Fetching)
│   │   └── data.js         # Data Transformation Layer
│   └── package.json        # Dependencies (Axios, Styled-Components)
└── docs/                   # Documentation
```
