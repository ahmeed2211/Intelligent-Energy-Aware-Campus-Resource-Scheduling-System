import { useState, useEffect } from 'react';
import axios from 'axios';
import EnergyDashboard from './components/EnergyDashboard';
import ScheduleTimeline from './components/ScheduleTimeline';
import { ErrorBoundary } from './components/ErrorBoundary';
import { getGroups } from './data';
import * as S from './App.styles';

function App() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [activeGroup, setActiveGroup] = useState('');

  useEffect(() => {
    setLoading(true);
    setError(null);

    axios.get('http://localhost:8080/api/schedule')
      .then(response => {
        if (response.data.status === 'success') {
          setData(response.data);
          const groups = getGroups(response.data);
          if (groups.length > 0 && (!activeGroup || !groups.find(g => g.id === activeGroup))) {
            setActiveGroup(groups[0].id);
          }
        } else {
          setError(response.data.message || "Failed to load schedule.");
        }
        setLoading(false);
      })
      .catch(err => {
        console.error("Failed to fetch schedule:", err);
        setError("Could not connect to the scheduling server. Please ensure the Prolog API is running on port 8080.");
        setLoading(false);
      });
  }, []);

  return (
    <S.AppContainer>
      <S.MainHeader>
        <S.Title>Campus Resource Dashboard</S.Title>
        <S.Subtitle>Intelligent Energy-Aware Scheduling System</S.Subtitle>
      </S.MainHeader>

      {loading && (
        <S.Subtitle style={{ color: '#94a3b8', marginTop: '20px' }}>
          Loading schedule data...
        </S.Subtitle>
      )}

      {error && !loading && (
        <S.Subtitle style={{ color: '#ef4444', marginTop: '20px' }}>
          {error}
        </S.Subtitle>
      )}

      {!loading && !error && data && (
        <ErrorBoundary>
          <S.DashboardGrid>
            <EnergyDashboard data={data} />

            <div>
              <S.SectionTitle>Master Schedule</S.SectionTitle>
              <S.DaySelectorContainer>
                {getGroups(data).map(group => (
                  <S.DayTab
                    key={group.id}
                    $active={activeGroup === group.id}
                    onClick={() => setActiveGroup(group.id)}
                  >
                    {group.name}
                  </S.DayTab>
                ))}
              </S.DaySelectorContainer>

              <ScheduleTimeline data={data} groupId={activeGroup} />
            </div>
          </S.DashboardGrid>
        </ErrorBoundary>
      )}
    </S.AppContainer>
  );
}

export default App;
