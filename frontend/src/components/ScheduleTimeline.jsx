import React, { useMemo } from 'react';
import { getEpgItemsForGroup, days } from '../data';
import * as S from './ScheduleTimeline.styles';
import { translater } from '../helpers/translater';

// ─── time config ────────────────────────────────────────────────
const SLOTS = [
  { key: '1', label: '08:00 – 9:30' },
  { key: '2', label: '09:45 – 11:15' },
  { key: '3', label: '11:30 – 13:00' },
  { key: '4', label: '14:00 – 15:30' },
  { key: '5', label: '15:45 – 17:15' },
];

const COURSE_COLORS = [
  'linear-gradient(135deg,#7c3aed,#4f46e5)',
  'linear-gradient(135deg,#0ea5e9,#0369a1)',
  'linear-gradient(135deg,#10b981,#047857)',
  'linear-gradient(135deg,#f59e0b,#b45309)',
  'linear-gradient(135deg,#ef4444,#b91c1c)',
  'linear-gradient(135deg,#ec4899,#9d174d)',
  'linear-gradient(135deg,#8b5cf6,#6d28d9)',
  'linear-gradient(135deg,#14b8a6,#0f766e)',
  'linear-gradient(135deg,#f97316,#c2410c)',
  'linear-gradient(135deg,#6366f1,#4338ca)',
];

const colorCache = {};
let colorIndex = 0;
function getCourseColor(courseName) {
  if (!colorCache[courseName]) {
    colorCache[courseName] = COURSE_COLORS[colorIndex % COURSE_COLORS.length];
    colorIndex++;
  }
  return colorCache[courseName];
}

export default function ScheduleTimeline({ data, groupId }) {
  const lookup = useMemo(() => {
    const items = getEpgItemsForGroup(data, groupId);
    const map = {}; 
    items.forEach(item => {
      const day = item.channelUuid; 
      const slot = item.slot;      
      if (!slot) return;
      if (!map[day]) map[day] = {};
      map[day][slot] = item;
    });
    return map;
  }, [data, groupId]);

  return (
    <S.Wrapper>
      <S.Table>
        <thead>
          <tr>
            <S.Th>Day</S.Th>
            {SLOTS.map(s => (
              <S.Th key={s.key}>{s.label}</S.Th>
            ))}
          </tr>
        </thead>
        <tbody>
          {days.map((day) => {
            const dayStr = day.id.toString();
            const dayData = lookup[dayStr] || {};
            const isSaturday = day.id === 6;
            const renderedSlots = new Set();

            return (
              <React.Fragment key={day.id}>
                <tr>
                  <S.DayCell>{day.name}</S.DayCell>
                  {SLOTS.map((slot, slotIdx) => {
                    if (renderedSlots.has(slot.key)) return null;

                    const item = dayData[slot.key];
                    if (isSaturday && parseInt(slot.key) > 3) {
                      return <S.SlotCell key={slot.key}><S.EmptySlot /></S.SlotCell>;
                    }

                    if (!item) {
                      return <S.SlotCell key={slot.key}><S.EmptySlot /></S.SlotCell>;
                    }

                    let colSpan = 1;
                    for (let i = slotIdx + 1; i < SLOTS.length; i++) {
                      const nextSlot = SLOTS[i];
                      const nextItem = dayData[nextSlot.key];
                      if (isSaturday && parseInt(nextSlot.key) > 3) break;

                      if (
                        nextItem &&
                        nextItem.title === item.title &&
                        nextItem.room === item.room &&
                        nextItem.sessionIndex === item.sessionIndex
                      ) {
                        colSpan++;
                        renderedSlots.add(nextSlot.key);
                      } else {
                        break;
                      }
                    }

                    const isCompact = item.courses.length > 2;
                    const useGrid = item.courses.length >= 3;

                    return (
                      <S.SlotCell key={slot.key} colSpan={colSpan}>
                        <S.UnifiedCourseCard 
                          $gradient={getCourseColor(item.courses[0].trim())}
                          $isCompact={isCompact}
                        >
                          {useGrid ? (
                            <S.CourseGrid>
                              {[0, 1, 2, 3].map((idx) => {
                                const course = item.courses[idx];
                                if (!course) return <S.GridItem key={idx} />;
                                
                                const room = item.rooms[idx] || item.rooms[0] || item.room;
                                const transTitle = translater[course.trim().toLowerCase()] || course.trim().toUpperCase();
                                
                                return (
                                  <S.GridItem key={idx}>
                                    <S.GridCourseTitle title={course}>
                                      {transTitle}
                                    </S.GridCourseTitle>
                                    <S.GridRoomBadge>
                                      {room.toUpperCase()}
                                    </S.GridRoomBadge>
                                  </S.GridItem>
                                );
                              })}
                            </S.CourseGrid>
                          ) : (
                            item.courses.map((course, idx) => {
                              const room = item.rooms[idx] || item.rooms[0] || item.room;
                              const transTitle = translater[course.trim().toLowerCase()] || course.trim().toUpperCase();
                              
                              return (
                                <React.Fragment key={idx}>
                                  <S.CourseRow $isCompact={isCompact}>
                                    <S.CourseTitle title={course} $isCompact={isCompact}>
                                      {transTitle}
                                      {item.sessionIndex > 1 && item.courses.length === 1 && (
                                        <S.SessionBadge style={{ marginLeft: '8px' }}>S{item.sessionIndex}</S.SessionBadge>
                                      )}
                                    </S.CourseTitle>
                                    <S.MultiRoomBadge>{room.toUpperCase()}</S.MultiRoomBadge>
                                  </S.CourseRow>
                                  {idx < item.courses.length - 1 && <S.MultiCourseSeparator />}
                                </React.Fragment>
                              );
                            })
                          )}
                        </S.UnifiedCourseCard>
                      </S.SlotCell>
                    );
                  })}
                </tr>
              </React.Fragment>
            );
          })}
        </tbody>
      </S.Table>
    </S.Wrapper>
  );
}
