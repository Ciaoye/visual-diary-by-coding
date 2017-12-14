// visual diary by creative coding
// author Qiaoye Zou

import gifAnimation.*;
GifMaker exp;

ArrayList<PVector> brush = new ArrayList <PVector>();
PImage img;

void setup() {
    size(500, 500);
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

  smooth();
  background(255);
  img = loadImage("p.jpg");
  noStroke();
  frameRate(30);
}

void draw_() {
  background(0);
  tint(40);
  image(img, 0, 0);

  for (int i=0; i<brush.size (); i++) {
    PVector temp = brush.get(i);
    //float r =map( tan(radians(frameCount) + i)*20,0,100000,5,30);
    float r =sin(radians(frameCount) + i/5)*random(1, 6);
    fill(img.get(int(temp.x), int(temp.y)));
    ellipse(temp.x, temp.y, r, r);
  }
}

void mouseDragged() {
  brush.add(new PVector(mouseX, mouseY));
}