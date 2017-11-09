// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

int ballcount = 500;
int ballsize = 1;
int ballspeedx = 5;
int ballspeedy = 3;

float [] xpos = new float [ballcount];
float [] ypos = new float [ballcount];

float [] size = new float [ballcount];

float [] xspeed = new float [ballcount];
float [] yspeed = new float [ballcount];

color [] mycolor = new color [ballcount]; 


void setup() {
    size(400, 400);
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

  background(0);
  smooth();
  //noStroke();
  frameRate(30);

  for (int i = 0; i<ballcount; i++) 
  {
    xpos[i] = random(width);
    ypos[i] = random(0, height/10);



    size[i] = random(ballsize);

    xspeed[i] = random(-ballspeedx, ballspeedx);
    yspeed[i] = random(-ballspeedy, ballspeedy);
    mycolor[i] = color(random(255), random(255), random(255), random(170,255));
  }
}

void draw_() {
  for (int i = 0; i<ballcount; i++ ) {
    //stroke(20,255);
    strokeWeight(0.05);
    fill(mycolor[i]);
    ellipse(xpos[i], ypos[i], size[i], size[i]);

    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];


    if (xpos[i]>= width || xpos[i]<= 0) {
      xspeed[i] = -xspeed[i];
    }

    if (ypos[i]>= height || ypos[i]<= 0) {
      yspeed[i] = -yspeed[i];
    }
  }
}