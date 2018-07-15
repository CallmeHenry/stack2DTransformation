
class Blizzard {
  
  float xposBlizzard, yposBlizzard, z, len, yspeed;
  
  
  Blizzard() {
    xposBlizzard = random(width);
    yposBlizzard = random(-1000, -500);
    z = random(20, 100);
    len = map(z, 0, 20, 10, 20);
    yspeed = map(z, 0, 20, 1, 20);
  }
  
  void fall() {
   
      yposBlizzard = yposBlizzard + yspeed;
      float gravity = map(z, 0, 20, 0, 0.02);
      yspeed = yspeed + gravity;
      
      if (yposBlizzard > height) {
         yposBlizzard = random(-1000, -500);
         yspeed = map(z, 0, 20, 1, 20);
      }
      
  }
  
  void display() {
    pushMatrix();
    rotate(radians(z));
    fill(255);
    ellipse(xposBlizzard, yposBlizzard, 5, 5);
  popMatrix();
  }
}