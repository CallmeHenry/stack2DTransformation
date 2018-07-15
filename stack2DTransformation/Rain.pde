
class Rain {
  
  float xpos, ypos, z, len, yspeed;
  
  
  Rain() {
    xpos = random(width);
    ypos = random(-1000, -500);
    z = random(0, 10);
    len = map(z, 0, 1, 1, 2);
    yspeed = map(z, 0, 20, 4, 10);
  }
  
  void fall() {
   
      ypos = ypos + yspeed;
      float gravity = map(z, 0, 20, 0, 0.2);
      yspeed = yspeed + gravity;
      
      if (ypos > height) {
         ypos = random(-1000, -500);
         yspeed = map(z, 0, 20, 10, 30);
      }
      
  }
  
  void display() {
     float thickness = map(z, 0, 20, 1, 2);
     fill(0, 0, 225, 90);
     rect(xpos, ypos, thickness, (ypos+len)/10);
  }
}