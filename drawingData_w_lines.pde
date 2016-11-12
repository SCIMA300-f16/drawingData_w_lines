//Erin Zhang
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
    mypath[i] = new Travel(day, 10-negFrequency, negFrequency*5, signal, xPos, 50, duration*2);
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

  //title
  textSize(24);
  text("TRAVEL TIME AND RED SIGNALS IN SPETEMBER", 460, 450, 300, 180);
  //caption
  textSize(10);
  text("Erin Zhang", 460, 540);
  text("This graphic shows the relationship between travel duration and numbers of red signals I run into in September 2016. The red lines indicate the duration of the trip in a day; points of the zigzag lines refer to the numbers of the signals; length of the zigzag lines represent frequency. The smoother a line appears the better travel experience I had on that day.", 460, 560, 280, 300);
}