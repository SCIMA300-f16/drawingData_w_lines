int xPos=60;
Table table;
Travel[] mypath;
int i = 0;

void setup() {
  pixelDensity(2);
  size(800, 800);

  //load data
  table = loadTable("mydata.csv", "header");
  int tableRowCount = table.getRowCount();
  mypath = new Travel[tableRowCount];

  for (TableRow row : table.rows()) {
    int signal = row.getInt("signal");
    int frequency = row.getInt("frequency");
    int duration = row.getInt("duration");
    String day = row.getString("DD");
    float negFrequency = map(frequency, 0, 1200, 0, 10);

    //make objects
    mypath[i] = new Travel(1, day, 10-negFrequency, negFrequency*5, signal, 
      xPos, 50, duration*2);
    i++;
    xPos+=34;
    println(frequency);
  }
}

void draw() {
  background(#232323);

  //draw objects
  for (int j = 0; j<=mypath.length-1; j++) {
    mypath[j].display();
  }

  //captions
  textSize(24);
  text("TRAVEL TIME AND RED SIGNALS IN SPETEMBER", 460, 600, 300, 300);
  textSize(9);
  text("Erin Zhang", 460, 700);

  noLoop();
}