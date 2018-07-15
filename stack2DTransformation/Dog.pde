
class Dog {
  float tailAngle = 0;
  float tailChange = 1;
  float tailLimit = 60;
  float mouseClick = 0;
  Dog() {
    
  }
  void head() {
    pushMatrix();
    translate(710, 650);
    fill(104, 53, 14);
    rect(30, 5, 15, 20, 30); //ear behind head
    fill(139,69,19);
    rect(0, 0, 40, 40, 50); // head
    fill(104, 53, 14);
    rect(-5, 5, 15, 20, 30); //ear infront head
    fill(0);
    ellipse(15, 15, 5, 5);
    fill(0);
    ellipse(30, 15, 5, 5);
    arc(20, 20, 10, 10, 0, PI);
    popMatrix();
  }
  void body() {
   pushMatrix();
   translate(720, 650);
   rotate(radians(90));
   fill(139,69,19);
   rect(0, 0, 40, 50, 20);
   popMatrix();
  }
  
  void tail() {
    pushMatrix();
    translate(675, 660);
    rotate(radians(90));
    rotate(radians(tailAngle));
    fill(139,69,19);
    rect(0, 0, 5, 25, 5);
    popMatrix();
  }
  
  void frontLegs() {
    pushMatrix();
    translate(680, 685);
    fill(139,69,19);
    rect(0, 0, 10, 15, 20);
    popMatrix();
  }
  
  void hindLegs() {
   pushMatrix();
   translate(700, 685);
   fill(139,69,19);
   rect(0, 0, 10, 15, 20);
   popMatrix();
  }
  
    void tailAngle() {
    
     tailAngle += tailChange;
     if (tailAngle > tailLimit || tailAngle < 0) {
         tailChange = -tailChange;
         tailAngle += tailChange;
      }
  }
    
    void increaseSpeed() {
        if ((mousePressed) && (mouseX >= 600) && (mouseX <= 800) && (mouseY >= 600) && (mouseY <= 800)) {
           mouseClick++;
           tailChange += 10;
           if (tailChange >= 100) {
              tailChange = 1; 
           }
        }
    }
    void display() {
     body();
     frontLegs();
     hindLegs();
     head();
     tail();
     tailAngle();
     increaseSpeed();
    }
}
  
  
  