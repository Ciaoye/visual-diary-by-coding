// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

float [] xpos = new float [100];
float [] ypos = new float [100];

float x;
float y;
float speedx;
float speedy;
float radius = 100;
float thetaAdd1= 0.00001;
float r;

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
    if (key == 'f') {
      exp.finish();
    }
  }
}

void setup_() {
  size(400, 400);
  smooth();
  background(255);
  noStroke();

  for (int i = 0; i>xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }

  x = 0;
  y = 0;
  r=0;
}

void draw_() {
  //background(255);

  for (int i = 0; i<xpos.length-1; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }

  xpos[xpos.length-1] = x;
  ypos[ypos.length-1] = y;

  x = r*cos(thetaAdd1);
  y = r*sin(thetaAdd1);
  r+=1;
  thetaAdd1+=10;

  pushMatrix();
  translate(width/2, height/2);

  for (int i = 0; i<xpos.length; i++) {
    fill(255- i*2);
    ellipse(xpos[i], ypos[i], i/2, i/2);
  }

  popMatrix();
}

