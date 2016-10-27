//this is emilys branch wooooooo

Table table;
float morning;
float afternoon;
float night;
float x, y;
float speedX=1;
float speedY=1;

//setup document
void setup() {
  size(1000, 650);
  smooth();

  table = loadTable("myfile.csv", "header");

  //test
  int tableRowCount = table.getRowCount();
  int tableColumnCount = table.getColumnCount();

  //prints the row count below
  println("Total rows in table = " + tableRowCount);

  //prints the width and height of the table below
  int noOfRowsandColumns = int(sqrt(tableRowCount));

  float w = (width)/noOfRowsandColumns;
  float h = (height)/noOfRowsandColumns;

  println("w: ", w);
  println("h: ", h);
}
void draw() {
  background(255);
  noStroke ();

  //calling out table values
  for (TableRow row : table.rows()) {
    //assign random x and y variables so dots show up in different locations
    x = random(0, width);
    y = random(0, height);
    morning = row.getFloat("Morning");// Time spent in morning
    afternoon = row.getFloat("Afternoon"); // Time spent in afternoon
    night = row.getFloat("Night"); // Time spent at night
    //float productive = row.getFloat("Productive"); // Time spent at night


    //draw ellipse

    fill (#FF0000);
    ellipse (x, map(y, 0, height, 0, height/3), morning*7, morning*7);
    fill(#00FFFF);
    ellipse (x, map(y, 0, height, height/3, height/3*2), afternoon*7, afternoon*7);
    fill(#FFFF00);
    ellipse (x, y, night*7, night*7);
    move();
    bounce();
    noLoop();
  }


  //title
  fill(255, 120);
  rect(0, 0, 250, 20);
  fill(0);
  text("time spent on the computer", 800, 630);
}

//moving ball
void move() {
  x+=speedX;
  y+= speedY;
}


//make ball bounce around page
//speed is equal to productivity level

void bounce() {
  //if the ball reaches the width of the page change the x value to be negative
  if (x>width) {
    speedX=speedX * -1;
  }
  //if the ball reaches the other side of the page change x value to be positive
  if (x<0) {
    speedX = speedX * -1;
  }
  //if y reaches the bottom of the page make y negative
  if (y>height) {
    speedY=speedY *-1;
  }
  //if y reached top of page may y positive
  if (y<0) {
    speedY=speedY*-1;
  }

  //how fast the ball moves
}