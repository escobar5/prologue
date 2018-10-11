int cell_size = 10;
color[] palette = { #441E13, #896C32, #161213, #A6AAB6, #CDDBDB };
ArrayList<Particle> particles;
float time = 0.0;
float time_step = 0.001;
 
void setup() {
  size(800, 800);
  noFill();
  smooth(8);
  strokeWeight(1.2);
  particles = new ArrayList<Particle>(((width/2)/cell_size) * ((height/2)/cell_size));
  init();
}

void draw() {
  for (Particle p : particles) {  
    
    float attrX = 0.0;
    float attrY = 0.0;
    
    for (Particle o : particles) {
      
      if (p.id == o.id) continue;
      
      PVector v = new PVector(o.x - p.x, o.y - p.y);
      float distance = v.mag();
      float angle = v.heading();
 
      float attraction = 1/distance; //Calculate attraction
      if (distance<2.0) attraction *= -1; //or repulsion
 
      attraction *= p.compareMood(o); // mood factor
      attraction *= 0.5; //cool down factor
 
      attrX += attraction * cos(angle);
      attrY += attraction * sin(angle);
 
      p.dx = attrX;
      p.dy = attrY;
    }
    
    p.update();
    p.draw();
  }
 
  time += time_step;
}

 
void init() {
  background(5, 5, 20);
 
  for (int x=0; x<((width/2)/cell_size); x++) {
    for(int y=0; y<((height/2)/cell_size); y++) {
      particles.add(new Particle(x,y));
    }
  }
}

void mousePressed() {
  //init();
}
 
class Particle {
  float x, y;
  float col, row;
  float dx, dy;
  String id;
  float age;
  color c = palette[(int)random(palette.length)];
  float mood;
   
  Particle(int col, int row) {
    this.col = col;
    this.row = row;
    id = col + "_" + row;
    reset();
  }
  
  void reset() {
    x = col * cell_size;
    y = row * cell_size;
    age = (int)random(100, 2000); //random age
    setMood();
  }
 
  void draw() {
    stroke(c, time * 1000);
    point(x + (width/4), y + (height/4));
  }
 
  void update() {
    if(--age < 0) reset();
    else {
      x += dx;
      y += dy;
      setMood();
    }
  }
 
  float compareMood(Particle p) {
    return 1 - abs(p.mood - this.mood);
  }
  
  void setMood() {
    mood = noise(width/row, height/col, time) * 10; 
  }
 }
