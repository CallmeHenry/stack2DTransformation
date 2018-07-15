
class helpButton {
 
  float size = 60;
  float imageWidth = size;
  float imageHeight = size;
  int imageX = 150;
  int imageY = 50;

  void draw() {
        fill(255);
        textSize(18);
        text("Hint", imageX-20, imageY+5);
        fill(255, 0, 0, 70);
        ellipseMode(CENTER);
        ellipse(imageX, imageY, size, size);

       update();
       
  }
  
  void update() {
     if (overImage(imageX, imageY, imageWidth, imageHeight)) {
        fill(255, 0, 0);
        ellipse(imageX,imageY, size, size);
        fill(255);
        textSize(18);
        text("Hint", imageX-20, imageY+5);
        
        if (mousePressed) {
           fill(255, 255, 255, 50);
           rect(imageX, imageY, 1000, 500);
           fill(0);
           textSize(18);
           text("Instructions", imageX + 20, imageY + 20);
           textSize(12);
           text("'a' and 'd' key to move the human left and right.Alternatively, use the grey slider above to move the human.", imageX + 20, imageY + 40);
           text("Walking outside of the door object opens the door and decreases the human's x-axis to make it look like he's stepping down from the house's foundation. \n \t Although, there is a bug that prevents the human from stepping back up when using the slider.", imageX + 20, imageY + 60);
           text("'1' key to call in a bird to follow your cursor. Alternatively, click the bird icon to call it in. It will follow your cursor.", imageX + 20, imageY + 100);
           text("'2' key to plant a tree. The tree is created depending on your cursor's x-axis; the height of the tree is dependent on your cursor's y-axis; \n \t the width of the tree trunk is random; and the height, width, and number of layers of the leaves are random.", imageX + 20, imageY + 120);
           text("'3' key to make it snow. Alternatively, click the 'Snow' button. Use the white 'Snow' slider to change the diameter of the snow.", imageX + 20, imageY + 160);
           text("'4' key to make it rain. Alternatively, click the 'Rain' button.Use the blue 'Rain' slider to change the size of the droplets.", imageX + 20, imageY + 180);
           text("'5' key to make a blizzard. Alternatively, click the 'Blizzard' button. Use the black 'Blizzard' slider to change the speed.", imageX + 20, imageY + 200);
           text("'6' key to remove everything.", imageX + 20, imageY + 220);
           text("Mouse click the dog to change his tail wag speed.", imageX + 20, imageY + 240);
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