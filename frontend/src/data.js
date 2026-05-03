// Static configuration
export const days = [
  { id: 1, name: 'Monday' },
  { id: 2, name: 'Tuesday' },
  { id: 3, name: 'Wednesday' },
  { id: 4, name: 'Thursday' },
  { id: 5, name: 'Friday' },
  { id: 6, name: 'Saturday' },
];

/**
 * Extracts student groups from the schedule data.
 */
export const getGroups = (data) => {
  if (!data || !data.schedule) return [];
  return data.schedule.map(s => ({
    id: s.group,
    name: s.group.toUpperCase()
  }));
};

/**
 * Returns all scheduled items for a specific group from the provided data.
 * Each item has: { id, channelUuid (day number string), title, room, sessionIndex, slot }
 */
export const getEpgItemsForGroup = (data, groupId) => {
  const items = [];
  if (!data || !data.schedule) return items;
  
  const groupSchedule = data.schedule.find(s => s.group === groupId);
  if (!groupSchedule) return items;

  groupSchedule.timestable.forEach((entry) => {
    const match = entry.timeslot.match(/t(\d)(\d)/);
    if (match) {
      const day = match[1];   // "1".."6"
      const slot = match[2];  // "1".."5"
      const courseName = Array.isArray(entry.course)
        ? entry.course.join(', ')
        : entry.course;
      const roomName = Array.isArray(entry.room)
        ? entry.room.join(', ')
        : entry.room;

      items.push({
        id: `${entry.timeslot}_${groupId}_${entry.session_index}`,
        channelUuid: day,
        slot,
        title: courseName,
        room: roomName,
        courses: Array.isArray(entry.course) ? entry.course : [entry.course],
        rooms: Array.isArray(entry.room) ? entry.room : [entry.room],
        sessionIndex: entry.session_index,
      });
    }
  });

  return items;
};

/**
 * Returns energy consumption data from the provided data.
 */
export const getEnergyData = (data) => {
  if (!data || !data.energy) return [];
  return data.energy;
};
