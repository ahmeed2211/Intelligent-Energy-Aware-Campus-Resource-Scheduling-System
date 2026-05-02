# Intelligent Energy-Aware Campus Resource Scheduling System

## Project Description
This project is an advanced campus resource management system designed to generate optimal academic schedules while staying within strict energy consumption limits. It combines a powerful **Prolog-based Constraint Satisfaction Engine** with a modern **React Dashboard** to provide a real-time, visual overview of campus resources.

The core of the system solves the complex problem of assigning courses, instructors, and rooms into time slots while respecting several categories of constraints:
- **Hard Constraints**: No room/group/instructor overlaps, equipment requirements, and capacity limits.
- **Energy Constraints**: Monitoring and limiting the total energy consumption per building per day.
- **Optimization**: Prioritizing schedules that minimize room waste and maintain instructor preferences.

---

## Tech Stack
- **Backend**: SWI-Prolog (Constraint Solver & HTTP API)
- **Frontend**: React, Vite, Styled-Components, Axios
- **Data Model**: Fact-based knowledge base in Prolog

---

## How to Run

### 1. Prerequisites
- **SWI-Prolog**: Ensure you have [SWI-Prolog](https://www.swi-prolog.org/) installed.
- **Node.js**: Ensure you have [Node.js](https://nodejs.org/) (v16+) and npm installed.

### 2. Running the Backend (Prolog API)
The backend generates the schedule and serves it via a JSON API on port `8080`.
1. Open the project root directory.
2. Open `server.pl` with SWI-Prolog.
3. If you are using the SWI-Prolog GUI, hit **Compile -> Make**.
4. The server will start listening at `http://localhost:8080`.

*Note: If you make changes to the `.pl` files, type `make.` in the Prolog console to reload the changes instantly.*

### 3. Running the Frontend (React Dashboard)
The frontend provides the visual interface to view schedules and energy metrics.
1. Navigate to the `frontend` directory:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm run dev
   ```
4. Open your browser to the URL shown in the terminal (usually `http://localhost:5173` or `http://localhost:5175`).

---

## Key Features
- **Interactive Timetable**: Group-based filtering to view schedules for GL3, IIA3, IMI3, MPI, and RT3.
- **Energy Monitoring**: Real-time stats on building energy usage vs. weekly limits.
- **Multi-slot Merging**: Visual support for sessions that span multiple consecutive time slots.
- **Dark Mode UI**: Professional, high-contrast institutional design.
- **Automated Translation**: Course codes are automatically translated into full academic titles.
