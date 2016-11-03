//EINGSBRANCH!!!!
//yay

Table food;
int row;
int rowCount = 0;
int a = 0;
int b = 10;

void setup() {
  size(900, 800);
  background(10);
  food = loadTable("two.csv");
  row = food.getRowCount();
  println(rowCount);
}

void draw() {
  fill(255);
  noStroke();
  if (rowCount<row) {
    String day = trim(food.getString(rowCount, 0));
    int rate = food.getInt(rowCount, 5);
    float remappedRate = map(float(rate), 0, 5, 100, 700);
    text(day, remappedRate+45, b+6);
    rect(a+40, b, remappedRate, 6);

    if (rowCount<row) {
      String what = trim(food.getString(rowCount, 6));
      int when = food.getInt(rowCount, 7);
      //float remappedWhen = map(float(when), 0, 5, 100, 700);
//display text
      textSize(10);
      text(what, 45, b+14);
//colorcode breakfast/lunch/dinner
      if (food.getInt(rowCount, 7) == 1) {
      fill(179,205,224);} 
      else if (food.getInt(rowCount, 7) == 2) {
      fill(100,151,177);}
      else if (food.getInt(rowCount, 7) == 3) {
      fill(12,69,125);}

   
  
//bar เอาไว้ใส่สีสวัน 'remappedrate ความยาวให้ต
      rect(a+40, b, remappedRate, 6);
    }
    
    

//void function {
//  statements
//}

    //  if (food.getString(rowCount, 5).equals("b")) {
    //    fill(0,244,110);
    //    noStroke();
    //    point(b,120);
    //    println("food");
    //  }
  }

  b+=16;
  rowCount++;
}