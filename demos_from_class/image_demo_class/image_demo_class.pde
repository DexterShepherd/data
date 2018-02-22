Walker[] walkers = new Walker[10000];

PImage data;
void setup() {
  size(800, 800);

  data = loadImage("ajay.jpg");
  data.resize(width, height);
  for(int i = 0; i < walkers.length; i++ ) {
    walkers[i] = new Walker(random(width), random(height));
  }
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);
  
  stroke(0, 255, 0);
  
  for(Walker w : walkers) {
    w.update();
    w.display();
  }
}

class Walker {
  float x, y, stepSize, scale;
  Walker(float _x, float _y) {
    x = _x;
    y = _y;
    stepSize = TWO_PI;
    scale = 1;
  }
  
  void update() {
    float angle = (red(data.get(floor(x * scale),
                               floor(y * scale)
                               ))  / 255.0) * stepSize;
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
    point(x, y);
  }
}