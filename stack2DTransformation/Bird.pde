class Bird {

  PImage[] images;
  int imageCount;
  int frame;
 
 float xposBird;
 float yposBird = height * 0.25;

  Bird(String imagePrefix, int count) {
     imageCount = count;
     images = new PImage[imageCount];
     
     for (int i = 0; i < imageCount; i++) {
        String filename = imagePrefix + i + ".png";
        images[i] = loadImage(filename);
     }
  }

  
  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
    image(images[frame], xpos, ypos);
  }
  
  void draw() {
     float drag = 30.0;
     float dx = mouseX - xposBird;
     xposBird += dx/drag;
     float dy = mouseY - yposBird;
     yposBird += dy/drag; 
     bird_1.display(xposBird-bird_1.getWidth()/2, yposBird-bird_1.getHeight()/2);  
  }

  
  int getWidth() {
     return images[0].width; 
  }
  
  int getHeight() {
     return images[0].height; 
  }
}