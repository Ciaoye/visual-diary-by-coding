// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

Mover [] ball;
int num = 100;
PVector location;
PVector velocity;

Attractor boss;
PVector bossLocation;
float bossMass;

void setup() {
  size(500, 500);
  setup_();
  exp = new GifMaker(this, "pic.gif");
  exp.setRepeat(0); 
  exp.setDelay(50);
}

void draw() {
  draw_();
  if (frameCount % 2 == 0) { 
    exp.addFrame();
  }
  if (keyPressed) {
    if (key == 's') {
      save("picN.png");
    }
    if(key == 'f'){
      exp.finish();
    }
  }
}

void setup_() {

  smooth();
  frameRate(30);
  ball = new Mover [num];

  for (int i=0; i<ball.length; i++) {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    ball[i] = new Mover(location, velocity);
  }
  bossMass = 500;
  bossLocation = new PVector(width/2, height/2);
  boss = new Attractor(bossMass, bossLocation);
}

void draw_() {
  background(0);

  //boss.display();

  for (int i =0; i<ball.length; i++) {
    for (int j=0; j<ball.length; j++) {
      if (i!=j) {
        PVector force = ball[j].attract(ball[i]);
        ball[i].applyForce(force);
      }
      ball[i].update();
      ball[i].display();
      ball[i].checkEdge();
    }
    //PVector force = boss.attract(ball[i]);
    //ball[i].applyForce(force);
    //ball[i].applyForce(gravity);
  }
}