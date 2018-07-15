
class Human {
 
  float xpos = 0;
  float ypos = 0;
  float xspeed = 1;
  float armAngle = 0;
  float angleChange = 5;
  int angleLimit = 135;
  
  float angle = 0;
  float targetAngle = 0;
  float easing = 0.5f;

  
  Human() {

  }
  
  void head() {
    fill(255);
    ellipse(xpos+535, ypos+480, 50, 50);
  }
  
  void body() {
     fill(255);
     rect(xpos+510, ypos+500, 50, 100);
  }
  void leftArm() {

    pushMatrix();
    translate(xpos+510, ypos+510);

    rotate(radians(armAngle));
    rect(-12, 0, 12, 50);
    popMatrix();
  }
  
  void rightArm() {
    pushMatrix();
    translate(xpos+560, ypos+510);
    rotate(radians(-armAngle));
    rect(0, 0, 12, 50);
    popMatrix();
  }
  
  void armAngle() {
    
     armAngle += angleChange;
     if (armAngle > angleLimit || armAngle < 0) {
         angleChange = -angleChange;
         armAngle += angleChange;
      }
  }
  
  void targetAngle() {
     angle =  atan2(mouseY - height/2, mouseX - width/2);
     float dir = (angle - targetAngle) / TWO_PI;
     dir -= round(dir);
     dir *= TWO_PI;
     
     targetAngle += dir * easing;
  }
  void leftLeg() {

    
    if (key == 'a') {
      pushMatrix();
       translate(xpos+510, ypos+600);
      rotate(radians(armAngle));
       rect(0, 0, 12, 100);
       popMatrix();
    }
    else {
     pushMatrix();
   translate(xpos+510, ypos+600);
   rect(0, 0, 12, 100);
   popMatrix();
    }
  }
  
  void rightLeg() {
    
    if (key == 'd') {
      pushMatrix();
    translate(xpos+547, ypos+600);
      rotate(radians(-armAngle));
       rect(0, 0, 12, 100);
       popMatrix();
    }
    else {
        pushMatrix();
    translate(xpos+547, ypos+600);
    rect(0, 0, 12, 100);
    popMatrix();  
    }

  }
  
  void keyPressed() {
      if (key == 'd') {
      xpos += 2;
    }
    
    if (key == 'a') {
       xpos -= 2;
    } 
  }


  
   
  
  void keyReleased() {

    key = ' ';
  }
 

  void display() {
    
      body();
      head();
      leftArm();
      targetAngle();
      rightArm();
      armAngle();
      leftLeg();
      rightLeg();
      keyPressed();
    // mousePressed();
      
   
  }
  
}