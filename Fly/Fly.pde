// visual diary by creative coding
// author Qiaoye Zou
// library by www.plethora-project.com

/**
 * Simple call for agent population with a flocking behavior based on Craig Reynolds
 * more info at www.plethora-project.com
 * requires toxiclibs and peasycam
 */

import processing.opengl.*;
import plethora.core.*;
import toxi.geom.*;
import peasy.*;

import gifAnimation.*;
GifMaker exp;

ArrayList <Ple_Agent> boids;

//using peasycam
PeasyCam cam;

float DIMX = 800;
float DIMY = 300;
float DIMZ = 200;
float power1 = 0;
float power2 = 0;
int pop = 300;
Vec3D target;

void setup() {
  setup_();
  exp = new GifMaker(this, "pic.gif");
  exp.setRepeat(0); 
  exp.setDelay(50);
}

void draw() {
  draw_();

  if (keyPressed) {
    if (key == 's') {
      save("picN.png");
    }

    if (key == 'l') {
      if (frameCount % 3 == 0) { 
        exp.addFrame();
      }
    }

    if (key == 'f') {
      exp.finish();
    }
  }
}


void setup_() {
  size(800, 300, OPENGL);
  smooth();
  cam = new PeasyCam(this, 300);
  colorMode(HSB);

  //initialize the arrayList
  boids = new ArrayList <Ple_Agent>();

  for (int i = 0; i < pop; i++) {

    //set the initial location as 0,0,0
    Vec3D v = new Vec3D ();
    //create the plethora agents!
    Ple_Agent pa = new Ple_Agent(this, v);

    //generate a random initial velocity
    Vec3D initialVelocity = new Vec3D (random(-1, 1), random(-1, 1), random(-1, 1));

    //set some initial values:
    //initial velocity
    pa.setVelocity(initialVelocity);
    //initialize the tail
    pa.initTail(5);

    //add the agents to the list
    boids.add(pa);
    frameRate(30);
  }
}

void draw_() {
  background(235);
  power1 = map(mouseX, 0+100, width-100, 0, 100);
  power2 = map(mouseX, width-100, 0+100, 0, 100);
  target = new Vec3D (0, 0, 0);
  stroke(0, 90);
  strokeWeight(1);
  noFill();
  rect(-DIMX/2, -DIMY/2, DIMX, DIMY);

  for (Ple_Agent pa : boids) {

    //call flock, cohesion, alignment, separation.
    //first define the population, then the distances for cohesion,alignment, 
    //separation and then the scales in same order. Try playing with the scales and distances!
    pa.flock(boids, 80, 40, 10, power2, 0.5, power1);

    //define the boundries of the space as bounce
    pa.bounceSpace(DIMX/2, DIMY/2, DIMY/2);

    //update the tail info every frame (1)
    pa.updateTail(1);

    //display the tail interpolating 2 sets of values:
    //R,G,B,ALPHA,SIZE - R,G,B,ALPHA,SIZE
    pa.displayTailPoints(0, 0, 0, 0, 1, 0, 0, 0, 255, 1);

    //set the max speed of movement:
    pa.setMaxspeed(3);
    //pa.setMaxforce(0.05);

    //update agents location based on past calculations
    pa.update();

    //make 2D in some Z plane
    pa.flatten(0);

    //Display the location of the agent with a point
    strokeWeight(0.5);
    stroke(random(255), random(255), random(255), 40);
    //stroke(0, 0, 0, 10);
    pa.displayPoint();
    pa.drawLinesInRange(boids, 20, 60);

    //Display the direction of the agent with a line
    strokeWeight(0.5);
    stroke(100, 10);
    pa.displayDir(pa.vel.magnitude()*3);

    if (mousePressed) {
      pa.seek(target, 300.0);
    }
    if (key =='s') {
      save("pic.tga");
    }
  }
}

