class ball {
  float x;
  float y;
  float size;
  float xspeed;
  float yspeed;
  color mycolor;

  ball(float px, float py, float psize, float pxspeed, float pyspeed ,color pmycolor) {
    x = px;
    y = py;
    size = psize;
    xspeed = pxspeed;
    yspeed = pyspeed;
    mycolor = pmycolor;
  }

  void display() {
    stroke(mycolor);
    strokeWeight(size);
    point(x, y);
  }

  void move() {
    x = x + 2*xspeed;
    y = y + 2*yspeed;
     println(xspeed ,yspeed);
  }

  void checkEdge() {
    if (x>width || x<0) {
      xspeed *=-1;
    }
    if (y>height || y<0) {
      yspeed *=-1;
    }
  }
}