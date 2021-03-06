
class blizzardButton {
 
  float size = 60;
  float imageWidth = size;
  float imageHeight = size;
  int imageX = 450;
  int imageY = 50;

  void draw() {
        fill(255);
        textSize(18);
        text("Blizzard", imageX-22, imageY+5);
        fill(0, 0, 255, 70);
        
        
        rect(imageX-size/2, imageY-size/2, size+25, size);
        
       update();
       
  }
  
  void update() {
     if (overImage(imageX, imageY, imageWidth, imageHeight)) {
        fill(0, 0, 255);
        
        
        rect(imageX-size/2,imageY-size/2, size+25, size);
        fill(255);
        textSize(18);
        text("Blizzard", imageX-22, imageY+5);
        
        if (mousePressed) {
           blizzardFlag = true;
      }
        
     }
     
    

  }
  
  boolean overImage(int x, int y, float imageWidth, float imageHeight) {
     if (mouseX >= x-size/2 && mouseX <= x+imageWidth/2 + 25 && mouseY >= y-size/2 && mouseY <= y+imageHeight/2) {
        return true; 
     }
     else {
        return false; 
     }
  }
  
 
}