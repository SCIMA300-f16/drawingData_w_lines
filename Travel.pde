class Travel {
  int numOfPoints, xPos, yPos, lineEnd;
  float x, y;
  String date;
  float lineIncrease;
  Travel(float lineIncrease_, String date_, float x_, float  y_, int numOfPoints_, int xPos_, int yPos_, int lineEnd_) {
    x = x_;
    y = y_;
    numOfPoints = numOfPoints_;
    xPos = xPos_;
    yPos = yPos_;
    lineEnd = lineEnd_;
    date = date_;
    lineIncrease = lineIncrease_;
  }

  void display() {
    textSize(10);
    text(date, xPos-6, yPos-11);
    stroke(255);
    strokeWeight(1.5);
    noFill();

    //signal line
    beginShape();
    for (int i = 0; i<numOfPoints; i++) {
      vertex(xPos+x, yPos+y*i);
      x *= -1;
    }
    endShape();

    if (x<0) {
      x *=-1;
    }

    //duration line
    if (lineEnd<yPos) {
      lineEnd = yPos;
    }
    stroke(255, 0, 0);
    strokeWeight(2);
    line(xPos, yPos, xPos, lineEnd);
  }
}