import styled from 'styled-components';

export const Container = styled.div`
  display: flex;
  gap: 20px;
  margin-bottom: 30px;
  flex-wrap: wrap;
`;

export const Card = styled.div`
  background: #1e2535;
  border: 1px solid rgba(255,255,255,0.08);
  border-radius: 16px;
  padding: 24px;
  flex: 1;
  min-width: 250px;
  box-shadow: 0 8px 32px rgba(0,0,0,0.35);
  transition: transform 0.2s ease, box-shadow 0.2s ease;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 40px rgba(0,0,0,0.5);
    border-color: rgba(255,255,255,0.15);
  }
`;

export const Header = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
`;

export const Title = styled.h3`
  font-size: 1.1rem;
  font-weight: 600;
  color: #e2e8f0;
  text-transform: uppercase;
  letter-spacing: 0.05em;
`;

export const StatusBadge = styled.div`
  font-size: 0.75rem;
  padding: 4px 10px;
  border-radius: 12px;
  font-weight: 600;
  background: ${props => props.$status === 'danger' ? 'rgba(239, 68, 68, 0.2)' :
               props.$status === 'warning' ? 'rgba(245, 158, 11, 0.2)' : 'rgba(16, 185, 129, 0.2)'};
  color: ${props => props.$status === 'danger' ? 'var(--danger)' :
           props.$status === 'warning' ? 'var(--warning)' : 'var(--success)'};
`;

export const ProgressBarBg = styled.div`
  height: 8px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 4px;
  overflow: hidden;
  margin-bottom: 12px;
`;

export const ProgressBarFill = styled.div`
  height: 100%;
  width: ${props => props.$percentage}%;
  background: ${props => props.$status === 'danger' ? 'var(--danger)' :
               props.$status === 'warning' ? 'var(--warning)' : 'var(--success)'};
  border-radius: 4px;
  transition: width 1s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;

  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(90deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0.3) 50%, rgba(255,255,255,0) 100%);
    animation: shimmer 2s infinite;
  }

  @keyframes shimmer {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
  }
`;

export const StatsContainer = styled.div`
  display: flex;
  justify-content: space-between;
  font-size: 0.95rem;
  color: var(--text-secondary);
  margin-top: 16px;
`;

export const StatItem = styled.div`
  display: flex;
  flex-direction: column;
  gap: 4px;
`;

export const StatLabel = styled.span`
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  color: #94a3b8;
  opacity: 0.9;
`;

export const StatValue = styled.span`
  font-weight: 700;
  font-size: 1.25rem;
  color: ${props => props.$status === 'danger' ? '#f87171' :
           props.$status === 'warning' ? '#fbbf24' : '#34d399'};
  text-shadow: 0 0 10px ${props => props.$status === 'danger' ? 'rgba(239,68,68,0.5)' :
                         props.$status === 'warning' ? 'rgba(245,158,11,0.5)' : 'rgba(16,185,129,0.5)'};
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
