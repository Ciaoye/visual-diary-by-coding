// visual diary by creative coding
// author Qiaoye Zou
// code learn from "The Nature of Code"

import gifAnimation.*;
GifMaker exp;

float xmin; 
float ymin; 
float w; 
float h;
float s1;
float s2;
float s3;

void setup() {
    size(600, 600);
  setup_();
  //exp = new GifMaker(this, "pic.gif");
  //exp.setRepeat(0); 
  //exp.setDelay(50);
}

void draw() {
  draw_();
  if (frameCount % 2 == 0) { 
    //exp.addFrame();
  }
  if (keyPressed) {
    if (key == 's') {
      save("picN.png");
    }
    if (key == 'f') {
      //exp.finish();
    }
  }
}

void setup_() {
  colorMode(HSB);
  //stroke(255,0,0);
  //  xmin = random(5); 
  //  ymin = random(2);
  //  w = random(3); 
  //  h = random(1);
  xmin = -2.5; 
  ymin = -5;
  w = 5; 
  h = 30;
}

void draw_() {
  //xmin +=0.01;
  //ymin +=0.02;
  //w+=0.01;
  //h+=0.01;

  loadPixels();
  int maxiterations = 100;
  float xmax = xmin + w;
  float ymax = ymin + h;
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);

  float y = ymin;
  for (int j = 0; j < height; j++) {
    float x = xmin;
    for (int i = 0; i < width; i++) {
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a*random(1, 6);
        float bb = b * b*random(1, 3);
        float twoab = random(-20,20) *a * b;
        a = aa * bb - x;
        b = twoab - y;
        float nn=10;
        if (aa * bb > nn) {
          break; 
        }
        n++;
      }

      if (n == maxiterations) pixels[i+j*width] = color(0);
      else pixels[i+j*width] = color(n*10 % 255); 
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  save("picN.png");
  noLoop();
}