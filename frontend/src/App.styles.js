import styled from 'styled-components';

export const AppContainer = styled.div`
  max-width: 1400px;
  margin: 0 auto;
  padding: 40px 20px;
  width: 100%;
  min-height: 100vh;
`;

export const MainHeader = styled.header`
  margin-bottom: 48px;
  padding-left: 16px;
  border-left: 3px solid #6d28d9;
`;

export const Title = styled.h1`
  font-family: 'DM Sans', sans-serif;
  font-size: 1.9rem;
  font-weight: 600;
  color: #f1f5f9;
  letter-spacing: -0.3px;
  margin-bottom: 6px;
  line-height: 1.2;
`;

export const Subtitle = styled.p`
  font-family: 'DM Mono', monospace;
  color: #475569;
  font-size: 0.8rem;
  letter-spacing: 0.04em;
  text-transform: uppercase;
`;

export const DashboardGrid = styled.div`
  display: flex;
  flex-direction: column;
  gap: 40px;
`;

export const DaySelectorContainer = styled.div`
  display: flex;
  gap: 12px;
  margin-bottom: 20px;
  overflow-x: auto;
  padding-bottom: 8px;

  &::-webkit-scrollbar {
    height: 4px;
  }
`;

export const DayTab = styled.button`
  background: ${props => props.$active ? '#7c3aed' : '#1e2535'};
  color: ${props => props.$active ? '#fff' : '#94a3b8'};
  border: 1px solid ${props => props.$active ? '#7c3aed' : 'rgba(255,255,255,0.08)'};
  padding: 10px 24px;
  border-radius: 8px;
  font-family: 'Inter', sans-serif;
  font-weight: 600;
  font-size: 0.95rem;
  cursor: pointer;
  transition: all 0.2s ease;
  white-space: nowrap;

  &:hover {
    background: ${props => props.$active ? '#6d28d9' : '#2a3347'};
    color: #fff;
    border-color: ${props => props.$active ? '#6d28d9' : 'rgba(255,255,255,0.15)'};
  }
`;

export const SectionTitle = styled.h2`
  font-family: 'DM Sans', sans-serif;
  font-size: 0.75rem;
  font-weight: 500;
  margin-bottom: 20px;
  color: #475569;
  text-transform: uppercase;
  letter-spacing: 0.1em;
`;
