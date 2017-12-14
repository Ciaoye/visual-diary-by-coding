// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

float r;
float theta = 0;
float a;

void setup() {
  setup_();
  exp = new GifMaker(this, "pic.gif");
  exp.setRepeat(0); 
  exp.setDelay(50);
}

void draw() {
  draw_();
  if (frameCount % 10 == 0) { 
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
  size(400, 400);
  background(0);
  smooth();
  r = 0;
  //  m = new Mover[num];
  //  for (int i = 0; i<m.length; i++) {
  //    location = new PVector(random(width), random(height));
  //    velocity = new PVector(0, 0);
  //    acceleration = new PVector(random(-1, 1), random(-1, 1));
  //    m[i]=new Mover(location, velocity, acceleration);
  //  }
}

void draw_() {
  //background(255);
  float x = r*cos(theta);
  float y = r*sin(theta);

  //noStroke();
  stroke(255,60);
  strokeWeight(1);
  fill(a);
  line(width/2,height/2,width/2+x,height/2+y);
  ellipse(width/2 + x, height/2 + y, 20, 20);

  r+= 0.15;
  a+=0.01;
  theta +=0.06;

  //  for (int i=0;i<m.length;i++) {
  //    m[i].update();
  //    m[i].display();
  //    m[i].checkEdge();
  //  }
}

