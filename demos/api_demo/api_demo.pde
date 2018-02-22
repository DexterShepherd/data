JSONArray data;

void setup() {
  String[] rawData = loadStrings("http://api.flutrack.org/?s=feverORcough");
  data = parseJSONArray(rawData[0]);
  
  size(800, 800);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  
  fill(255);
  stroke(255);
  rotate(random(TWO_PI));
  scale(random(0.1, 3));
  text(data.getJSONObject(floor(random(data.size()))).getString("tweet_text"), random(width), random(height));
}