// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

PVector posA, posB, posC;
float speed1;
float speed2;
float speed3;

void setup() {
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
    if (key == 'f') {
      exp.finish();
    }
  }
}

void setup_() {
  size(700, 700);
  background(0);
  speed1 = 0;
  speed2 = 0;
  speed3 = 0;
  posA = new PVector();
  posB = new PVector();
  posC = new PVector();
  frameRate(10);
  colorMode(HSB);
}

void draw_() {
  //background(0);
  float r1 = 100 ;
  posA.x = r1 * cos(radians(speed1));
  posA.y = r1 * sin(radians(speed1));
  speed1 +=0.1;

  float r2 = 160;
  posB.x = r2 * cos(radians(speed2));
  posB.y = r2 * sin(radians(speed2));
  speed2 +=0.2;

  float r3 = 240;
  posC.x = r3 * cos(radians(speed3));
  posC.y = r3 * sin(radians(speed3));
  speed3 +=0.3;

  translate(width/2, height/2);
  stroke(frameCount/10, frameCount/10, 100, 10);
  noFill();
  triangle(posA.x, posA.y, posB.x, posB.y, posC.x, posC.y);
}

