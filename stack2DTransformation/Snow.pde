class Snow {
  
   float x, y;
   float diameter;
   float speed;
   int direction = 1;
   
   Snow(float xpos, float ypos, float dia, float sp) {
    
       x = xpos;
       y = ypos;
       diameter = dia;
       speed = sp;
   }
  
    void move() {
        if (y > height) {
         y = -50; 
        }
       y += (speed * direction);
    }
    
    void display() {
      ellipse(x, y, diameter, diameter);
    }
}