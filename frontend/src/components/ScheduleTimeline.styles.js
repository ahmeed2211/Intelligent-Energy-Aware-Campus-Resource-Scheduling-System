import styled from 'styled-components';

export const Wrapper = styled.div`
  overflow-x: auto;
  border-radius: 16px;
  border: 1px solid rgba(255,255,255,0.08);
  box-shadow: var(--glass-shadow);
  margin-top: 20px;
  background: #111827;
`;

export const Table = styled.table`
  width: 100%;
  min-width: 700px;
  table-layout: fixed;
  border-collapse: collapse;
  background: #111827;
`;

export const Th = styled.th`
  padding: 14px 12px;
  background: rgba(139, 92, 246, 0.2);
  color: #94a3b8;
  font-size: 0.78rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  border-bottom: 1px solid rgba(255,255,255,0.08);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  width: 18%;

  &:first-child {
    background: rgba(139, 92, 246, 0.28);
    color: #e2e8f0;
    width: 10%;
  }
`;

export const DayCell = styled.td`
  padding: 10px 8px;
  vertical-align: middle;
  text-align: center;
  border-bottom: 1px solid rgba(255, 255, 255, 0.04);
  border-right: 1px solid rgba(255, 255, 255, 0.04);
  background: rgba(139, 92, 246, 0.1);
  font-size: 0.82rem;
  font-weight: 600;
  color: #e2e8f0;
  letter-spacing: 0.05em;
  overflow: hidden;
  white-space: nowrap;
`;

export const SlotCell = styled.td`
  padding: 5px 5px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.04);
  border-right: 1px solid rgba(255, 255, 255, 0.04);
  overflow: hidden;
  height: 1px;
  vertical-align: stretch;
`;

export const EmptySlot = styled.div`
  height: 100%;
  min-height: 68px;
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.02);
`;

export const SplitContainer = styled.div`
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 6px;
  background: rgba(255, 255, 255, 0.06);
  border-radius: 10px;
  padding: 6px;
  border: 1px solid rgba(255, 255, 255, 0.1);
`;

export const CourseCard = styled.div`
  background: ${props => props.$gradient};
  border-radius: 8px;
  padding: 8px 10px;
  color: white;
  min-height: 68px;
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
  border: 1px solid rgba(255, 255, 255, 0.15);
  transition: transform 0.15s ease, box-shadow 0.15s ease;
  cursor: default;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.35);
  }
`;

export const CourseTitle = styled.div`
  font-weight: 700;
  font-size: 0.82rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin-bottom: 4px;
`;

export const CourseMeta = styled.div`
  display: flex;
  gap: 6px;
  align-items: center;
  flex-wrap: wrap;
`;

export const RoomBadge = styled.span`
  font-size: 0.68rem;
  background: rgba(0, 0, 0, 0.35);
  border-radius: 4px;
  padding: 1px 5px;
  font-weight: 500;
`;

export const SessionBadge = styled.span`
  font-size: 0.68rem;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 4px;
  padding: 1px 5px;
  font-weight: 500;
`;
