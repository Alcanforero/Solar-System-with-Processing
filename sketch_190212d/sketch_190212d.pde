import processing.sound.*;

PImage background;
PShape ship;
SoundFile music;
AstronomicalObject sun;
AstronomicalObject planet1, planet2, planet3, planet4, planet5, planet6, planet7, planet8;
AstronomicalObject moon;
boolean flag = true;

class AstronomicalObject {
  color ground, stroke;
  float size, position, speed;
  String name;
  
  AstronomicalObject(String name, float size, color ground, color stroke, float speed) {
    this.size = size;
    this.ground = ground;
    this.stroke = stroke;
    this.speed = speed;
    this.name=name;
    position = random(360);
  }
  
  void paint() {    
    fill(ground);
    stroke(stroke);
    sphere(size);
    fill(255);
    text(name, size+2, 0);
    move();
  }
  
  private void move() {
    position += speed;
    if (position >= 360) {
      position = 0;
    }
  }
  
  float getPosition() { return position; }
}

void setup() {
  size(1280, 721, P3D);
  imageMode(CENTER);
  background = loadImage("data\\images\\background.png");
  ship = loadShape("data\\models\\ship.obj");  
  music = new SoundFile(this, "data\\audio\\Fanfare_for_Space.wav");
  stroke(0);
  sun = new AstronomicalObject("Sun", 50, color(248,243,53), color(250,210,1), 1);
  planet1 = new AstronomicalObject("Mercury", 10, color(139,137,137), color(205,201,201), random(0.4, 0.7));  
  planet2 = new AstronomicalObject("Venus", 12, color(205,175,149), color(238,213,183), random(0.4, 0.7));
  planet3 = new AstronomicalObject("Hearth", 14, color(46,139,87), color(60,179,113), random(0.4, 0.7));
  moon = new AstronomicalObject("Moon", 3, color(238,233,233), color(255), random(0.4, 0.7));
  planet4 = new AstronomicalObject("Mars", 16, color(160,82,45), color(210,105,30), random(0.4, 0.7));
  planet5 = new AstronomicalObject("Jupiter", 18, color(205,133,63), color(210,180,140), random(0.4, 0.7));   
  planet6 = new AstronomicalObject("Saturn", 22, color(205,133,63), color(210,180,140), random(0.4, 0.7)); 
  planet7 = new AstronomicalObject("Uranus", 24, color(70,130,180), color(135,206,250), random(0.4, 0.7));  
  planet8 = new AstronomicalObject("Neptune", 26, color(65,105,225), color(100,149,237), random(0.4, 0.7));
  
  if (flag) {
    flag = false;
    thread("music");
  }
}

void draw() {
  background(background);  
  pushMatrix();
  translate(width/2, height*0.25, -100);
  
  pushMatrix();
  translate(0, 0, 500);
  rotateX(radians(170));
  scale(10);
  shape(ship, (mouseX-width/2)/10, -(mouseY-height*0.25)/10);
  popMatrix();
  
  rotateX(radians(-40));
  rotateY(radians(-10));
  rotateZ(radians(-10));  
  
  pushMatrix();  
  rotateY(radians(sun.getPosition()));
  sun.paint();
  popMatrix();  
  
  pushMatrix();  
  rotateY(radians(planet1.getPosition()));
  translate(-width*0.1,0,0);
  planet1.paint();
  popMatrix();

  pushMatrix();  
  rotateY(radians(planet2.getPosition()));
  translate(-width*0.14,0,0);
  planet2.paint();
  popMatrix();
  
  pushMatrix();  
  rotateY(radians(planet3.getPosition()));
  translate(-width*0.18,0,0);
  planet3.paint();
  rotateZ(radians(moon.getPosition()));
  translate(25,0,0);
  moon.paint();
  popMatrix();
  
  pushMatrix();  
  rotateY(radians(planet4.getPosition()));
  translate(-width*0.22,0,0);
  planet4.paint();
  popMatrix();
  
  pushMatrix();  
  rotateY(radians(planet5.getPosition()));
  translate(-width*0.26,0,0);  
  planet5.paint();
  popMatrix();
  
  pushMatrix();  
  rotateY(radians(planet6.getPosition()));
  translate(-width*0.3,0,0);
  planet6.paint();  
  popMatrix();
  
  pushMatrix();  
  rotateY(radians(planet7.getPosition()));
  translate(-width*0.34,0,0);
  planet7.paint();
  popMatrix();
  
  pushMatrix();  
  rotateY(radians(planet8.getPosition()));
  translate(-width*0.38,0,0);
  planet8.paint();
  popMatrix();
  popMatrix();
}

void music() {
  music.play();
}
