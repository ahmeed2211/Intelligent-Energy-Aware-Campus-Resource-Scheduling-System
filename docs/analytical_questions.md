How does the ordering constraints affect search complexity?

What is the theoretical branching factor of the search tree?
-The branching factor is the number of valid (Room, TimeSlot) pairs that survive all constraints at each node before committing.

Under what modeling decisions does the system become incomplete or inefficient?
incompleteness: cases where a solution exists but the solver won't be able to find it 
inefficiency: cases where a solution exists but takes too long 