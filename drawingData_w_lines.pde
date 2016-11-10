//this is emilys branch wooooooo
Balls[] myMorningBalls;
Balls[] myAfternoonBalls;
Balls[] myNightBalls;

Table table;
float morning;
float afternoon;
float night;
float newmorning;
float newafternoon;
float newnight;
float speed;
float mx, my, ax, ay, nx, ny;
int tableRowCount;
int i=0;


//setup document
void setup() {
  size(1000, 650);
  smooth();

  //load data file
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

  println("w: ", w);
  println("h: ", h);

  //class setup
  myMorningBalls = new Balls[tableRowCount];
  myAfternoonBalls = new Balls[tableRowCount];
  myNightBalls = new Balls[tableRowCount];


  for (TableRow row : table.rows()) {

    //assign random x and y variables so dots show up in different locations
    mx = random(0, width);
    my = random(0, height/3);

    ax = random(0, width);
    ay = random(height/3, height/3*2);

    nx = random(0, width);
    ny = random(height/3*2, height);

    //get each individual rows Morning, Afternoon, Night
    morning = row.getFloat("Morning");// Time spent in morning
    afternoon = row.getFloat("Afternoon"); // Time spent in afternoon
    night = row.getFloat("Night"); // Time spent at night
    float productive = row.getFloat("Productive"); // Productivity level affects speed more productive = faster ball

    //make ball size bigger
    newmorning = map(morning, 0, 4, 0, 50);
    newafternoon = map(afternoon, 0, 4, 0, 50);
    newnight = map(night, 0, 4, 0, 50);
    speed = map (row.getFloat("Productive"), 0, 10, 0, 3);

    //create balls for morning
    myMorningBalls[i] = new Balls (mx, my, newmorning, newmorning, speed, color(255, 255, 0), 0, height/3);
    //create balls for afternoon
    myAfternoonBalls[i] = new Balls (ax, ay, newafternoon, newafternoon, speed, color(0, 239, 255), height/3, height/3*2);
    //create balls for night
    myNightBalls[i] = new Balls (nx, ny, newnight, newnight, speed, color(255, 0, 0), height/3*2, height);
    i++;
  }
}


void draw() {
  background(255);
  noStroke ();
  //title

  String r = "time spent on the computer";
  fill(50);
  text(r, 700, 450, 200, 100); // Text wraps within text box
  //
  String s = "this data visualizes the amout of time I spend on the computer, and how productivly I spend that time. The diameter of the circles shows how much time was spent. The fastness of the ball is determined by my productivity level.";
  fill(50);
  
  text(s, 700, 500, 210, 200);  // Text wraps within text box
  //
  for (int j = 0; j<18; j++ ) {
    myMorningBalls[j].display();
    myMorningBalls[j].move();
    myMorningBalls[j].bounce();
    myAfternoonBalls[j].display();
    myAfternoonBalls[j].move();
    myAfternoonBalls[j].bounce();
    myNightBalls[j].display();
    myNightBalls[j].move();
    myNightBalls[j].bounce();
  }






  //labels
  fill(255, 120);
  rect(0, 0, 20, 20);
  fill(0);
  text("morning", 20, 20);

  fill(255, 120);
  rect(0, 0, 20, height/3);
  fill(0);
  text("afternoon", 20, height/3);

  fill(255, 120);
  rect(0, 0, 20, height/3*2);
  fill(0);
  text("night", 20, height/3*2);
}