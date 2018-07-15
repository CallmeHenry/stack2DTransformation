
class birdButton {
 
  PImage source, sourceRed, sourceGreen, sourceBlue;
  int imageWidth = 85;
  int imageHeight = 58;
  int imageX = 20;
  int imageY = 20;

  void draw() {
      source = loadImage("frame-0.png");
      sourceRed = createImage(source.width, source.height, RGB);
      sourceGreen = createImage(source.width, source.height, RGB);
      sourceBlue = createImage(source.width, source.height, RGB);

       update(mouseX, mouseY);
       image(source, imageX, imageY);
  }
  
  void update(int x, int y) {
     if (overImage(imageX, imageY, imageWidth, imageHeight)) {
        negatePixels(); 
        if (mousePressed) {
           birdFlag = true;
           bird_1.draw(); 
        }
     }
  }
  
  boolean overImage(int x, int y, int imageWidth, int imageHeight) {
     if (mouseX >= x && mouseX <= x+imageWidth && mouseY >= y && mouseY <= y+imageHeight) {
        return true; 
     }
     else {
        return false; 
     }
  }
  
  void negatePixels() {
  loadPixels();
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++) {
      int imageLoc = x + y *source.width;
 //     int displayLoc = x + y *width;
      float r = red(source.pixels[imageLoc]);
      float g = green(source.pixels[imageLoc]);
      float b = blue(source.pixels[imageLoc]);
  //   pixels[displayLoc] = color(r, g, b);
      source.pixels[imageLoc] = color(r, g, b);
      sourceRed.pixels[imageLoc] = color(r, 0, 0);
      sourceGreen.pixels[imageLoc] = color(0, g, 0);
      sourceBlue.pixels[imageLoc] = color(0, 0, b);
      
      float rtotal = (255 - red(source.pixels[imageLoc]));
      float gtotal = (255 - green(source.pixels[imageLoc]));
      float btotal = (255 - blue(source.pixels[imageLoc]));
      source.pixels[imageLoc] = color(rtotal, gtotal, btotal);
      }
    } 
  updatePixels();
  }

 

}