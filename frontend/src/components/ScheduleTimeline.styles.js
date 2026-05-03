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

export const UnifiedCourseCard = styled.div`
  background: ${props => props.$gradient};
  border-radius: 10px;
  padding: ${props => props.$isCompact ? '6px 10px' : '10px'};
  color: white;
  min-height: 80px;
  max-height: 100px;
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: ${props => props.$isCompact ? 'flex-start' : 'center'};
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(255, 255, 255, 0.2);
  transition: transform 0.2s ease;
  cursor: default;
  overflow-y: auto;

  &::-webkit-scrollbar {
    width: 4px;
  }
  &::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.2);
    border-radius: 4px;
  }

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
  }
`;

export const UnifiedCourseTitle = styled.div`
  font-weight: 700;
  font-size: 0.85rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
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


export const CourseRow = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: ${props => props.$isCompact ? '2px 0' : '4px 0'};
  gap: 8px;
`;

export const CourseTitle = styled.div`
  font-weight: 600;
  font-size: ${props => props.$isCompact ? '0.72rem' : '0.82rem'};
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  flex: 1;
`;

export const MultiRoomBadge = styled.span`
  font-size: 0.7rem;
  background: rgba(0, 0, 0, 0.3);
  padding: 2px 6px;
  border-radius: 4px;
  font-family: monospace;
  font-weight: 700;
  white-space: nowrap;
`;

export const MultiCourseSeparator = styled.div`
  height: 1px;
  background: rgba(255, 255, 255, 0.2);
  margin: 4px 0;
  width: 100%;
`;

export const CourseGrid = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr;
  gap: 10px;
  width: 100%;
  flex: 1;
`;

export const GridItem = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 4px;
  padding: 4px;
  border-radius: 6px;
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.05);
`;

export const GridCourseTitle = styled.div`
  font-size: 0.72rem;
  font-weight: 700;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  line-height: 1.2;
`;

export const GridRoomBadge = styled.div`
  font-size: 0.62rem;
  font-weight: 600;
  background: rgba(0, 0, 0, 0.25);
  color: #cbd5e1;
  padding: 1px 5px;
  border-radius: 4px;
  width: fit-content;
  font-family: monospace;
`;
