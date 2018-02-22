JSONObject data;
JSONArray palettes;
JSONArray palette;

int numPoints = 100;


void setup() {
  data = loadJSONObject("palettes.json");
  
  palettes = data.getJSONArray("palettes");
  palette = palettes.getJSONArray(floor(random(palettes.size())));
  size(800, 800);
  
  noStroke();
}

void draw() {
  background(paletteCol(0));
  translate(width * 0.5, height * 0.5);
  
  for (int i = 0; i < numPoints; i += 1 ) {
    float angle = map(i, 0, numPoints, 0, TWO_PI);
    float x = sin(angle + frameCount * 0.01) * 100;
    float y = cos(angle) * 100;
    for(int j = 0; j < 10; j += 1) {
      float jAngle = map((mouseX * j), 0, width * 10, 0, TWO_PI);
      float s = sin(angle + frameCount * 0.01) * 10;
        fill(paletteCol(j % 5));
      ellipse(x + sin(jAngle + frameCount * 0.01) * 100, y + cos(jAngle + angle + frameCount * 0.01) * 100, s, s);
    }
  }
  
  
}

color paletteCol(int index) {
  int c = unhex(palette.getString(index).substring(1, 7));
  return color(red(c), green(c), blue(c)); 
}