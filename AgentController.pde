class AgentController {
  ArrayList<FloatList> closest;
  float distance;
  ArrayList<Agent> agents;
  int id, agentId;
  
  // Constructor
  AgentController(int amount) {

    closest = new ArrayList<FloatList>(amount); // Create ArrayList of type FloatList that is the size of the amount of balls
  }
  
  // Connect mouse with the 2 nearest agents
  void connect(ArrayList agents) { // Has the agents as input
    this.agents = agents;
    
    for (int i = this.agents.size()-1; i >= 0; i--) { // Iterate through every agent
      distance = dist(mouseX, mouseY, this.agents.get(i).position.x, this.agents.get(i).position.y); // Get distances between mouse and agents
      agentId = this.agents.get(i).id; // Get ID of agent
      closest.add(closest.size(), new FloatList(distance, agentId)); // Add a FloatList containing the calculated distance and agentId at the current position (current length) of the ArrayList
    }
    
    Collections.sort(closest, Distance_Comparator); // Call comparator to sort closest by lowest distance to mouse. Meaning the ArrayList will be sorted from agent that's closest to mouse to agent that's furthest away from mouse

    int nearestId = (int)closest.get(0).get(1); // Get nearest agent
    int nearestId2 = (int)closest.get(1).get(1); // Get 2nd nearest agent
    fill(200, 20);
    
    // Draw triangle between mouse and the two nearest agents
    beginShape(TRIANGLES); 
    vertex(this.agents.get(nearestId).position.x, this.agents.get(nearestId).position.y);
    vertex(this.agents.get(nearestId2).position.x, this.agents.get(nearestId2).position.y);
    vertex(mouseX, mouseY);
    endShape();
    closest.clear(); // Clear all values in closest ArrayList for next frames-closest calculation
  }
}

// Comparator/sorting function
static final Comparator<FloatList> Distance_Comparator = new Comparator<FloatList>() {  // Comparator that compares FloatList
  @ Override final int compare(final FloatList a, final FloatList b) { // Override the existing compare function 
    int cmp;
    return
      (cmp = Float.compare(a.get(0), b.get(0))) != 0? cmp :      
      (cmp = Float.compare(a.get(1), b.get(1)));
  }
};
