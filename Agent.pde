class Agent {
  int id;
  PVector position, velocity, acceleration;
  float maxSpeed, diameter;
  ArrayList<Agent> others;
  color c;

  // Constructor
  Agent(int id) {
    position = new PVector(random(0, width), random(0, height)); // Vector width random starting position of agent
    velocity = new PVector(0, 0); // Velocity Vector starting at 0 velocity
    acceleration = new PVector(0, 0); // Accelecation Vector starting at 0 acceleration
    maxSpeed = random(5,15); // Maximum speed of each agent. Randomly choosen for each agent.
    this.id = id; // ID of each agent
    diameter = random(30, 80); // Random diameter of each agent
    c = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255), (int)random(100, 255)); // Random color of each agent
  }

  // Update agent position by adding velocity and limiting the speed to maxspeed
  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
  }

  // Draw the agent
  void show() {
    noStroke();
    fill(c);
    circle(position.x, position.y, diameter);
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    //text(this.id, position.x, position.y);
  }

  // Let the agent chase the target that's delivered when calling this function
  void seek(PVector target) {
    
    // Set the direction (acceleration) of the agent towards mouse-cursor
    PVector direction = new PVector();
    direction = PVector.sub(target, position);
    direction.normalize();
    acceleration = direction;
    acceleration.mult((random(0.4,0.6)/diameter)*20); // Give the agent a random speed-"boost" according to it's size (smaller agents can get faster than bigger agents)
    stroke(255);
    //line(position.x, position.y, mouseX, mouseY);
  }

  // If Agent is at end of sceen, teleport it to the other end of the screen
  void edges() {
    // Check X-position against width
    if (position.x < 0) {
      position.x = width;
    }
    if (position.x > width) {
      position.x = 0;
    }
    // Check Y-position against height
    if (position.y < 0) {
      position.y = height;
    }
    if (position.y > height) {
      position.y = 0;
    }
  }
}
