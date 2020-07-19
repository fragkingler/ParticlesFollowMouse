// Imports for comparator in AgentController (Used to sort ArrayList by closest agent)
import java.util.Collections;
import java.util.Comparator;

Agent myAgent;
AgentController aController;
ArrayList<Agent> agents;


void setup() {
  size(1000, 1000);
  int agentAmount = 15; // set the amount of agents/balls
  agents = new ArrayList<Agent>();
  for (int i = 0; i < agentAmount; i++) { // Create as many agents as previously defined
    agents.add(new Agent(i));
  }
  aController = new AgentController(agentAmount); // Add new controller which handles the connection of agents and mouse (draws a polygon between the mouse and the 2 closest agents)
}

void draw() {
  background(0);
  for (Agent agent : agents) { // Iterate through every agent of class agents
    agent.seek(new PVector(mouseX, mouseY)); // Let them seek the mouse-cursor 
    agent.update(); // Update position and speed of each agent
    agent.edges(); // Check their position regarding the screen-boundaries and spawn them on the opposite site of the screen
    agent.show(); // Actual agent rendering/drawing
    aController.connect(agents); // Check the distance between agents and mouse-cursor; draw a polygon between the 2 nearest agents and the mouse-cursor
  }
}
