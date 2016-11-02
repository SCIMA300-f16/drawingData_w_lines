Table table; 
void setup() { 
//set up the color n size of the sketch  
  size(1350, 700);
  background(255);
//read the data file and skip the header
  table = loadTable("data.csv", "header");
//set n and m as 0 for later use
  int n = 0;
  int m = 0;
//get the rows in the data file(limited number for loops)
  int tableRowCount = table.getRowCount();
//leave some space for numbers and specification
  int noOfRowsandColumns = int(sqrt(tableRowCount));
  float h = (height)/noOfRowsandColumns;
  float x = 30;
// beginShape is for connecting the dots(out side the loop will keep the connection)
  beginShape();
//use for loop to get information from data file
  for (TableRow row : table.rows()) {
    int day = row.getInt("dd");
    int steps = row.getInt("Steps")/600;
    float distance = row.getFloat("moved")/-30;
    int month = row.getInt("mm");
//call the method
    drawTable(day,distance,h,steps,x,month,n,m);
    x += 30;
    n += 600;
    m += 1000;
    }
// after loop we can finish the shape(connecting the dots)
  endShape();
//print some information on the table(title and specification)
  text("Moved distance and steps", width/2-50, 15);
  text("Rect: Steps  Dot:Distance", 1150, 15);
}

//the method for calculate
void drawTable(int day, float distance, float h, int steps, float x, int month, int n,int m){
//random numbers for random color  (starting with 50 could avoid black color)
  int random = int(random(50,255));
//base on red color
  fill(random, 0, 0);
//draw rect for steps
  rect(x+20,height-h/2,20,steps*-20);
//this is specification (set a limited for the steps)
  if (n<18000){
  text(n,12,height-h/2-x/1.5+30);
  }
//this is another specification(set a limited for the distance)
  if (m<12000){
  text(m,1310,height-h/2-x/0.6+60);
  }
//starting a new point will separate dots and rect
  pushMatrix();
  translate(20,height/2);
//date
  text(month+"/"+day,x-2,310);
//start the dots
  ellipse(x+10, distance+100, 5, 5);
//finish shift
  popMatrix();
//connect the dots
  noFill();
  vertex(x+30,distance+450);
}