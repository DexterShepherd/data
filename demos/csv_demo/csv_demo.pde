Table data;

int max, min;

void setup() {
  size(800, 800); 
  data = loadTable("2016-weather-data-seattle.csv", "header");
  println(data.getInt(0, "Mean_TemperatureC"));
  noStroke();
  fill(255);
  max = min = 10;
  
  for( TableRow t : data.rows() ) {
    int meanTemp = t.getInt("Mean_TemperatureC");
    if ( meanTemp < min ) {
      min = meanTemp;
    }
    
    if ( meanTemp > max ) {
      max = meanTemp; 
    }
  }
}

void draw() {
  for(int i = 0; i < 361; i += 1 ) {
    float x = map(i % 19, 0, 19, 0, width);
    float y = map(i / 19, 0, 360 / 19, 0, height);
    fill(map(data.getInt(floor((i + frameCount * 0.1) % data.getRowCount()), "Mean_TemperatureC"), min, max, 0, 255));
    rect(x, y, 50, 50);
  }
}