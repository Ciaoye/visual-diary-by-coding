// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

ball [] myball;
int num = 100;

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
  myball = new ball[num];

  for (int i=0; i<myball.length; i++) {
    myball[i]= new ball(random(width), random(height), 25, random(5, 10), random(5, 10),color((noise(i*0.001))*200,(noise(150+i*0.001))*200,(noise(1000+i*0.001)))*200);
  }
}

void draw_() {
  background(0);

  for (int i=0; i<myball.length; i++) {
    myball[i].move();
    myball[i].display();
    myball[i].checkEdge();
  }
}