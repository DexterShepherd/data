Table data;
PImage kurt;

void setup() {
  data = loadTable("2016-weather-data-seattle.csv", "header");
  kurt = loadImage("kurt.png");
  size(800, 800);
  
  println(data.getInt(0, "Mean_TemperatureC"));
}

void draw() {
  background(255);
  for(int numKurts = 0; numKurts < data.getInt(frameCount % data.getRowCount(), "Mean_TemperatureC"); numKurts++ ) {
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(TWO_PI));
    
    image(kurt, 
          0, 0, 
          10 * data.getInt(frameCount, "Min_TemperatureC"), 
          10 * data.getInt(frameCount, "Max_TemperatureC")
     );
     popMatrix();
  }
}

void mouseClicked() {
  saveFrame(); 
}