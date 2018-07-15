
class otherButton {
 
  float size = 60;
  float imageWidth = size;
  float imageHeight = size;
  int imageX = 550;
  int imageY = 50;

  void draw() {
        fill(255);
        textSize(18);
        text("Other", imageX-25, imageY+5);
        fill(0, 255, 0, 70);
        ellipseMode(CENTER);
        ellipse(imageX, imageY, size, size);

       update();
       
  }
  
  void update() {
     if (overImage(imageX, imageY, imageWidth, imageHeight)) {
        fill(0, 255, 0);
        ellipse(imageX,imageY, size, size);
        fill(255);
        textSize(18);
        text("Other", imageX-25, imageY+5);
        
        if (mousePressed) {
           fill(255, 255, 255, 50);
           rect(imageX, imageY, 1000, 180);
           fill(0);
           textSize(18);
           text("Instructions for Tree, Remove, and Dog", imageX + 20, imageY + 20);
           textSize(12);
           text("For trees, press the '2' key to plant a tree. The tree is created depending on your cursor's x-axis; \n \t the height of the tree is dependent on your cursor's y-axis; \n \t the width of the tree trunk is random; and the height, width, and number of layers of the leaves are random.", imageX + 20, imageY + 40);
           text("Press the '6' key to remove everything.", imageX + 20, imageY + 100);
           text("Mouse click the dog to change his tail wag speed.", imageX + 20, imageY + 120);
           text("More features listed in the 'Help' button.", imageX + 20, imageY + 140);
        
      }
        
     }
     
    

  }
  
  boolean overImage(int x, int y, float imageWidth, float imageHeight) {
     if (mouseX >= x-size/2 && mouseX <= x+imageWidth/2 && mouseY >= y-size/2 && mouseY <= y+imageHeight/2) {
        return true; 
     }
     else {
        return false; 
     }
  }
  
 
}