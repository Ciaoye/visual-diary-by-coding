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

float DIMX = 400;
float DIMY = 400;
float DIMZ = 400;

int pop = 300;

Vec3D target1 = new Vec3D ();
Vec3D target2 = new Vec3D ();
Vec3D target3 = new Vec3D ();
Vec3D target4 = new Vec3D ();
Vec3D target5 = new Vec3D ();
Vec3D target6 = new Vec3D ();
Vec3D target7 = new Vec3D ();
Vec3D target8 = new Vec3D ();
Vec3D target9 = new Vec3D ();
float r = 200;
//float theta = 0;
float x1, x2, x3, x4, x5, x6, x7, x8, x9;
float y1, y2, y3, y4, y5, y6, y7, y8, y9;

float theta1, theta2, theta3, theta4, theta5, theta6, theta7, theta8, theta9;
float a;
float b;
float c;
float power = 10;
float t =0;



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
  size(400, 400, OPENGL);
  smooth();
  cam = new PeasyCam(this, 400);
  //colorMode(HSB);

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
  }
}

void draw_() {
  background(235);

  stroke(0, 90);
  strokeWeight(1);
  noFill();
  rect(-DIMX/2, -DIMY/2, DIMX, DIMY);

  x1 = r*cos(radians(theta1));
  y1 = r*sin(radians(theta1));
  target1.x = x1;
  target1.y = y1;
  //  stroke(255, 0, 0, 100);
  //  ellipse(target1.x, target1.y, 10, 10);
  theta1+=1;

  x2 = r*cos(radians(theta2 + 180));
  y2 = r*sin(radians(theta2 + 180));
  target2.x = x2;
  target2.y = y2;
  //  stroke(255, 0, 0, 100);
  //  ellipse(target2.x, target2.y, 10, 10);
  theta2+=1;

  if (mousePressed) {
    a= 1;
    b =0.5;
    c = 100;
    t = 0.05;
    power = 0;
  } else {
    a = 1;
    b = 0.5;
    c = 10;
    t = 0.01;
    power = 10;
  }
  println(power);

  for (Ple_Agent pa : boids) {

    //call flock, cohesion, alignment, separation.
    //first define the population, then the distances for cohesion,alignment, 
    //separation and then the scales in same order. Try playing with the scales and distances!
    pa.flock(boids, 50, 40, 10, a, b, c);

    //define the boundries of the space as bounce
    pa.bounceSpace(DIMX/2, DIMY/2, DIMY/2);

    //update the tail info every frame (1)
    pa.updateTail(1);

    //display the tail interpolating 2 sets of values:
    //R,G,B,ALPHA,SIZE - R,G,B,ALPHA,SIZE
    //pa.displayTailPoints(0, 0, 0, 0,  1,   0, 0, 0, 255, 1);

    //set the max speed of movement:
    pa.setMaxspeed(3);
    //pa.setMaxforce(0.05);

    //update agents location based on past calculations
    pa.update();

    //make 2D in some Z plane
    pa.flatten(0);

    pa.seek(target1, power);
    pa.seek(target2, power);

    //Display the location of the agent with a point
    strokeWeight(2);
    stroke(0);
    pa.displayPoint();



    //Display the direction of the agent with a line
    strokeWeight(1);
    //stroke(100, 90);
    stroke(noise(a)*100, noise(255-a)*100, noise(a)*100, 10);
    a+=t;
    //pa.displayDir(pa.vel.magnitude()*3);
    pa.drawLinesInRange(boids, 50, 100);
  }
}

