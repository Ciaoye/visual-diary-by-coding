class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor(float mass_,PVector location_) {
    location = location_;
    mass = mass_;
    G = 0.4;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,mass/8,mass/2);
    
    force.normalize();
    float strength = (G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
    
  }


  void display() {
    stroke(0, 200, 0);
    strokeWeight(5);
    fill(255);
    ellipse(location.x,location.y,mass,mass);
  }
}

