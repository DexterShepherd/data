JSONArray data;

//float minLat;
//float maxLat;
//float minLon;
//float maxLon;

JSONObject tweet;
void setup() {
  String[] rawData = loadStrings("http://api.flutrack.org/?s=fever");
  data = parseJSONArray(rawData[0]);
  size(800, 800);
}

void draw() {
  for(int i = 0; i < data.size(); i += 1) {
    tweet = data.getJSONObject(i);
    
    float x = map(tweet.getFloat("latitude"), -90, 90, 0, width);
    float y = map(tweet.getFloat("longitude"), -180, 180, 0, height);
    
    ellipse(x, y, 10, 10);

  }
}