PImage Happy;
PImage Tired;
PImage Alien;
Table getuptimeList;
int rows;
String[] happy;
int rowCount = 0;

void setup() {
  size(430, 430);
  Happy = loadImage("Smiling.png");
  Tired = loadImage("Tired.png");
  Alien = loadImage("Alien.png");

  getuptimeList = loadTable("Getuptime.csv");
  
  rowCount = getuptimeList.getRowCount();
 
}

//Draw images
void draw() {
  Happy.resize(0, 50);
  image(Happy, 10, 370);
  
  Tired.resize(0, 50);
  image(Tired, 70, 370);
  
  Tired.resize(0, 50);
  image(Tired, 130, 370);
  
  Alien.resize(0, 50);
  image(Alien, 190, 370);
  
  Happy.resize(0, 50);
  image(Happy, 250, 370);
  
   Tired.resize(0, 50);
  image(Tired, 310, 370);
  
  Happy.resize(0, 50);
  image(Happy, 370, 370);
}
  void mousePressed (){
   if (mouseX > 10 && mouseX <70 && mouseY >10 && mouseY < 70);
   String happy = trim(getuptimeList.getString(rowCount, 0));
   text (happy,10,70);
  
}
  
