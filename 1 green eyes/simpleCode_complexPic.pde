// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

void setup() {
  size(600, 600);
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
  smooth();
  background(255);
  stroke(255, 100);
  //noStroke();
}

void draw_() {
  int w=mouseX/3;
  int h=mouseY/3;
  for (int i=0; i<width+60; i+=60) {
    for (int j=0; j<height+60; j+=60) {
      fill(random(255), random(255), 0, random(120));
      ellipse(i, j, w, h);
    }
  }
}