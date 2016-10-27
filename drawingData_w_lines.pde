//this is emilys branch wooooooo
Table table;
float morning;
float afternoon;
float night;
int[] y=new int[18];
int[] x=new int[18];
float[] speedX= new float[18];
float[] speedY= new float[18];
int tableRowCount;
TableRow row;

//setup document
void setup() {
  size(1000, 650);
  smooth();

  table = loadTable("myfile.csv", "header");

  //test
  tableRowCount = table.getRowCount();
  int tableColumnCount = table.getColumnCount();

  //prints the row count below
  println("Total rows in table = " + tableRowCount);

  //prints the width and height of the table below
  int noOfRowsandColumns = int(sqrt(tableRowCount));

  float w = (width)/noOfRowsandColumns;
  float h = (height)/noOfRowsandColumns;

  // for (TableRow row : table.rows()) {
  for (int row=0; row<tableRowCount; row++) {
    //assign random x and y variables so dots show up in different locations
    x[row] = int(random(0, width));
    y[row] = int(random(0, height));
    speedX[row]=1;
    speedY[row]=1;
  }

  println("w: ", w);
  println("h: ", h);
}
void draw() {
  background(255);
  noStroke ();
  //calling out table values
  for (TableRow row : table.rows()) {
    //for (int i=0; i<tableRowCount; i++) {
    //assign random x and y variables so dots show up in different locations
    //x = random(0, width);
    //y = random(0, height);
    morning = row.getFloat("Morning");// Time spent in morning
    afternoon = row.getFloat("Afternoon"); // Time spent in afternoon
    night = row.getFloat("Night"); // Time spent at night
    //float productive = row.getFloat("Productive"); // Time spent at night


    for (int i=0; i<tableRowCount; i++) {

      //draw ellipse
      fill (#FF0000);
      ellipse (x[i], map(y[i], 0, height, 0, height/3), morning*7, morning*7);
      fill(#00FFFF);
      ellipse (x[i], map(y[i], 0, height, height/3, height/3*2), afternoon*7, afternoon*7);
      fill(#FFFF00);
      ellipse (x[i], y[i], night*7, night*7);
      //noLoop();
    }
  }
  move();
  bounce();


  //title
  fill(255, 120);
  rect(800, 630, 250, 20);
  fill(0);
  text("time spent on the computer", 800, 630);
}

//moving ball
void move() {
  for (int i=0; i<tableRowCount; i++) {
    x[i]+=speedX[i];
    y[i]+= speedY[i];
  }
}


//make ball bounce around page
//speed is equal to productivity level

void bounce() {
  //if the ball reaches the width of the page change the x value to be negative
  for (int i=0; i<tableRowCount; i++) {
    if (x[i]>width) {
      speedX[i]=speedX[i] * -1;
    }
    //if the ball reaches the other side of the page change x value to be positive
    if (x[i]<0) {
      speedX[i] = speedX[i] * -1;
    }
    //if y reaches the bottom of the page make y negative
    if (y[i]>height) {
      speedY[i]=speedY[i] *-1;
    }
    //if y reached top of page may y positive
    if (y[i]<0) {
      speedY[i]=speedY[i]*-1;
    }
  }
}