

class House {
  
   void foundation() {
     pushMatrix();
     translate(1000, 700);
     rotate(radians(90));
     fill(102, 51, 0);
     rect(0, 0, 10, 800);
     popMatrix();
   }
   
   void leftWall() {
      pushMatrix();
      translate(200, 200);
      fill(255);
      rect(0, 0, 10, 500);
      popMatrix();
   }
  
   void rightWall() {
      pushMatrix();
      translate(990, 200);
      fill(255);
      rect(0, 0, 10, 500);
      popMatrix();
   }
   
   void roof() {
      pushMatrix();
      translate(500, 200);
      fill(255, 0, 0);
      triangle(-300, 0, 500, 0, 100, -175);
      popMatrix();
   }
   
   void indoorWall() {
      pushMatrix();
      translate(200, 200);
      fill(255, 153, 51);
      rect(0, 0, 800, 500);
      popMatrix();
   }
   
   void window() {
      pushMatrix();
      translate(600, 325);
      fill(204, 255, 255, 90);
      rect(0, 0, 200, 200);
      popMatrix();
   }
   
   void rightDoor() {
     
     if (human_1.xpos <= 400) {
      pushMatrix();
      translate(990, 440);
      fill(139,69,19);
      rect(0, 0, 10, 260);
      popMatrix();
     }
      else if (human_1.xpos >= 400) {
        pushMatrix();
        translate(990, 440);
        fill(139, 69, 19);
        rect(0, 0, 90, 260);
        popMatrix();
        if (human_1.xpos >= 480) {
         human_1.ypos = 20; 
         if (human_1.xpos <= 480) {
          human_1.ypos -= 20; 
         }
        }
        
      }

   }
   
   void leftDoor() {
      if (human_1.xpos >= -280) {
      pushMatrix();
      translate(200, 440);
      fill(139,69,19);
      rect(0, 0, 10, 260);
      popMatrix();
     }
      else if (human_1.xpos <= -280) {
        pushMatrix();
        translate(200, 440);
        fill(139, 69, 19);
        rect(0, 0, 90, 260);
        popMatrix();
        if (human_1.xpos <= -350) {
         human_1.ypos = 20; 
         if (human_1.xpos >= -350) {
          human_1.ypos -= 20; 
         }
        }
      }
  }
  

  void display() {
    indoorWall();
    foundation();
    leftWall();
    rightWall();
    roof();
    window();
    rightDoor();
    leftDoor();
  }
}