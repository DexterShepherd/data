PImage data;

Walker[] walkers = new Walker[5000];

void setup() {
  size(800, 800);
  data = loadImage("texture.jpeg");
  data.resize(width, height);
  
  for(int i = 0; i < 5000; i += 1) {
    walkers[i] = new Walker(random(width), random(height)); 
  }
  background(255);
}

void draw() {
  fill(255, 15);
  rect(0, 0, width, height);
  fill(0);
  for(Walker w : walkers ) {
    w.update();
    w.display();
  }
}


class Walker {
  float x, y, scale, strength;
  Walker(float _x, float _y) {
    x = _x;
    y = _y;
    scale = 1;
    strength = TWO_PI;
  }
  
  void update() {
     //float angle = noise(x * scale, y * scale) * strength;
     float angle = imageNoise(int(x * scale), int(y * scale)) * strength;
     x += sin(angle);
     y += cos(angle);
     
     if (( x > width ) 
         || ( x < 0) 
         || ( y > height)
         || ( y < 0 )) {
           x = random(width);
           y = random(height);
         }
  }

  void display() {
    ellipse(x, y, 2, 2); 
  }
}

float imageNoise(int x, int y) {
  return red(data.get(x, y)) / 255.0;
}