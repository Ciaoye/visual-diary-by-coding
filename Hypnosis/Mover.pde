class Mover {

  PVector location;
  PVector velocity;
  PVector acc;
  float topspeed = 3;
  float mass;

  float angle = 0;
  float aVelocity =0;
  float aAcceleration = 0.005;

  Mover(PVector location_, PVector velocity_, PVector acc_) {
    location = location_;
    velocity = velocity_;
    mass = random(20, 50);
    acc = acc_;
  }

  void update() {
    velocity.add(acc);
    location.add(velocity); 

    aVelocity +=aAcceleration;
    angle +=aVelocity;
    aAcceleration = 0;

    acc.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(mass/10);
    fill(255-mass*5);
    
    rectMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(location.x,location.y,mass,mass);
    popMatrix();
    
  }

  void checkEdge() {
    if (location.x>=width || location.x<=0) {
      velocity.x = velocity.x*-1;
    }
    if (location.y>=height || location.y<=0) {
      velocity.y = velocity.y*-1;
    }
  }
}

