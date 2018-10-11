int particle_count = 2000;
color[] palette = { #441E13, #896C32, #161213, #A6AAB6, #CDDBDB };
ArrayList<Particle> particles = new ArrayList<Particle>(particle_count);
float time = 0.0;
float time_step = 0.001;
 
void setup() {
  size(800, 800);
  noFill();
  smooth(8);
  strokeWeight(1.2);
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
      if (distance < 2.0) attraction *= -1; //or repulsion
 
      attraction *= p.compareMood(o); // mood factor
      attraction *= 0.25; //cool down factor
 
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
 
  for (int i=0; i < particle_count; i++) {
    particles.add(new Particle(i));
  }
}

void mousePressed() {
  //init();
}
 
class Particle {
  float x, y;
  float dx, dy;
  int id;
  float age;
  color c = palette[(int)random(palette.length)];
  float mood;
   
  Particle(int i) {
    id = i;
    reset();
  }
  
  void reset() {
    //calculate random position
    x = random(width/2);
    y = random(height/2);
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
    mood = noise(x/10, y/10, time) * 10; 
  }
 }
