// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

int pointSize = 1000;
float pointSpeed = 10;

float [] flyX = new float [pointSize]; 
float [] flyY = new float [pointSize]; 
float [] flySpeed = new float [pointSize]; 
color [] pointColor = new color [pointSize]; 

float x;
float y;

void setup() {
  size(600, 600);
  setup_();
  exp = new GifMaker(this, "pic.gif");
  exp.setRepeat(0); 
  exp.setDelay(50);
}

void draw() {
  draw_();
  if (frameCount % 1 == 0) { 
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

  background(255);
  smooth();
  x = width/2;
  y = height/2;
  for (int i = 0; i<pointSize; i++ ) {
    flySpeed[i] = random(pointSpeed);
    pointColor[i] = color(random(255), random(255), random(255), 255);
    flyX[i] = width/2;
    flyY[i] = height/2;
  }
  noStroke();
  background(0);
}

void draw_() {

  for (int i = 0; i<pointSize; i++) {
    fill(pointColor[i]);
    //strokeWeight(random(5));
    //stroke();
    //noStroke();

    ellipse(flyX[i], flyY[i], random(2), random(2));
    int r = int(random(4));
    if (r == 3) {
      flyX[i]+=flySpeed[i];
      flyY[i]-=flySpeed[i];
    }
    if (r == 2) {
      flyX[i]+=flySpeed[i];
      flyY[i]+=flySpeed[i];
    }

    if (r == 1) {
      flyX[i]-=flySpeed[i];
      flyY[i]+=flySpeed[i];
    }

    if (r == 0) {
      flyX[i]-=flySpeed[i];
      flyY[i]-=flySpeed[i];
    }
  }
}