class Balls {
  // global variables
  float x;
  float y;
  float w;
  float h;
  float speed;
  color c;
  float minlimit;
  float maxlimit;

  //constructor
  Balls(float tempX, float tempY, float tempW, float tempH, float tempS, color tempC, float tempL, float tempM) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speed = tempS;
    c = tempC;
    minlimit = tempL;
    maxlimit = tempM;
  }


  //functions
  void display() {
    fill(c);
    ellipse(x, y, w, h);
    
  }

  //speed of ball
  //speed is equal to productivity level
  void move() {
    x+=speed;
    y+=speed;
  }

  //make ball bounce around page
  void bounce() {
    //if the ball reaches the width of the page change the x value to be negative
    if (x>width) {
      speed=speed * -1;
    }
    //if the ball reaches the other side of the page change x value to be positive
    if (x<0) {
      speed = speed * -1;
    }
    //if y reaches the bottom of the page make y negative
    if (y>maxlimit) {
      speed=speed *-1;
    }
    //if y reached top of page may y positive
    if (y<minlimit) {
      speed=speed*-1;
    }
  }
}