Table table;
int y = 50;
int x = 30;

void setup() {

  size(800, 800);
  background(255, 212, 29);
  table = loadTable("ids.csv", "header");
  text ("Date", x,y-15);
  text ("Homeless",x+550, y+10);
  fill (#ff0000);
  text ("coffee",x+650, y+10);
  int tableRowCount = table.getRowCount();

  for (TableRow row : table.rows()) {
    float homeless = map(row.getInt("Homeless"), 0, 20, 15, width-350);
    String date = row.getString("Date");
    fill(255);

    noStroke();
    text (date, x,y+10);
    rect(80, y, homeless, 8);
    y +=20;
    strokeWeight(5);
    stroke(#ff0000);
  }
  noFill();
  strokeWeight(2);

  beginShape();
  for (TableRow row : table.rows()) {
    float coffee = map(row.getInt("Coffee"), 0, 20, 15, width-350);
  
    vertex(100+coffee, y-735);
    y +=20;
  }
  endShape();
}