PImage Happy;
PImage Tired;
PImage Alien;
Table getuptimeList;
int rows;
String[] happy;
int rowCount = 0;
String[][] TableData;
String[][] TimeData;
int ShowWhich=8;

void setup() {
  size(430, 430);
  Happy = loadImage("Smiling.png");
  Tired = loadImage("Tired.png");
  Alien = loadImage("Alien.png");

  getuptimeList = loadTable("Getuptime.csv");
  
  rowCount = getuptimeList.getRowCount();
  TableData = new String[rowCount][2];
  TimeData = new String[rowCount][2];
  for(int i=0;i<rowCount;i++){
    String s = getuptimeList.getString(i,0);
    TableData[i]=split(s, ' ');
    TimeData[i] = match(TableData[i][1],"(.*?)AM");
    println(int(TimeData[i][1]));  
  }
 
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
  
  
  textSize(24);
  text("GET UP TIME & EMOTION", 80, 30);
  
  textSize(12);
  text("(CLICK EMOJI)", 180, 440);
  
  if(ShowWhich<8){
    fill(abs(ShowWhich-4)*255/4,(18-ShowWhich)*255/10,abs(9-ShowWhich)*255/10);
    textSize(22);
    text(TableData[ShowWhich][0],10+ShowWhich*60,65);
    textSize(18);
    text(TableData[ShowWhich][1],10+ShowWhich*60,90);
    if(int(TimeData[ShowWhich][1])>0){
     rect(15+ShowWhich*60,100+(240-int(TimeData[ShowWhich][1])*20),40,int(TimeData[ShowWhich][1])*20);
    }else{
      rect(15+ShowWhich*60,100+(240-10.5*20),40,10.5*20);
    }
  }



}
  void mousePressed (){
  if (mouseX > 10 & mouseX <60 & mouseY >370 & mouseY < 420){
     ShowWhich=0;
   }else if(mouseX > 70 & mouseX <120 & mouseY >370 & mouseY < 420){
     ShowWhich=1;
   }else if(mouseX > 130 & mouseX <180 & mouseY >370 & mouseY < 420){
     ShowWhich=2;
   }else if(mouseX > 190 & mouseX <240 & mouseY >370 & mouseY < 420){
     ShowWhich=3;
   }else if(mouseX > 250 & mouseX <300 & mouseY >370 & mouseY < 420){
     ShowWhich=4;
   }else if(mouseX > 310 & mouseX <360 & mouseY >370 & mouseY < 420){
     ShowWhich=5;
   }else if(mouseX > 370 & mouseX <420 & mouseY >370 & mouseY < 420){
     ShowWhich=6;
   }else{
     ShowWhich=8;
   }
  
}
  
