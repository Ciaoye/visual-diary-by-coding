class Mover {

  PVector location;
  PVector velocity;
  PVector acc;
  float topspeed = 3;
  float mass;
  float G;

  PVector mouse;
  PVector dir;

  Mover(PVector location_, PVector velocity_) {
    location = location_;
    velocity = velocity_;
    mass = random(20, 50);
    acc = new PVector(0, 0);
    G = 0.4;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, mass/8, mass/2);

    force.normalize();
    float strength = (G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void update() {

    //PVector mouse = new PVector(mouseX, mouseY);
    //PVector dir = PVector.sub(mouse, location);
    //acc = dir;
    //acc = PVector.random2D();
    //acc.mult(random(-2,2));
    velocity.add(acc);
    velocity.limit(topspeed);
    location.add(velocity);
    acc.mult(0);
  }

  void display() {
    stroke(255,0,0, mass*3);
    strokeWeight(mass/5);
    point(location.x, location.y);
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

