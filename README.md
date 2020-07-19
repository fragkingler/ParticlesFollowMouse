# ParticlesFollowMouse
 
This was an experiment I made in which I had balls (agents) follow my mouse cursor. This was initially created in a lecture by M.Theiselmann. My personal addition was to create a function that draws a a polygon between the mouse-cursor and the two nearest agents.
Biggest problem in this was to sort all agents in an ArrayList by their nearest position. I couldn't use a simple FloatList since I also had to keep the ID of the agent in order to know which agent actually has distance X to mouse-cursor. 
I finally managed to utilize the Java Collections and Comparator Libraries for this but finally I made it work and the performance is outstandingly good.