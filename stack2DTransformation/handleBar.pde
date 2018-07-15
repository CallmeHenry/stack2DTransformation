class Handle {
  
  int x, y;
  int boxx, boxy;
  int stretch;
  int size;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;
  Handle[] others;
  
  
  Handle(int ix, int iy, int il, int is, Handle[] o) {
    x = ix;
    y = iy;
    stretch = il;
    size = is;
    boxx = x+stretch - size/2;
    boxy = y - size/2;
    others = o;
   
  }
  
  void update() {
    boxx = x+stretch;
    boxy = y - size/2;
    
    for (int i=0; i<others.length; i++) {
      if (others[i].locked == true) {
        otherslocked = true;
        break;
      } else {
        otherslocked = false;
      }  
    }
    
    if (otherslocked == false) {
      overEvent();
      pressEvent();
    }
    
    if (press) {
      stretch = lock(mouseX, 0, width);
    }
  }
  
  void overEvent() {
    if (overRect(boxx, boxy, size, size)) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void pressEvent() {
    if (over && mousePressed || locked) {
      press = true;
      locked = true;
    } else {
      press = false;
    }
  }
  
  void releaseEvent() {
    locked = false;
  }
  
  void display(int index) {
    


   
    
    if (index == 0) {
      fill(0, 0, 255);  
      rect(x, y-10, x+stretch, 10); //line color
      fill(0, 0, 255);
      ellipse(boxx, boxy, size, size); //rectangle tip color
      fill(255);
 
      textSize(12);
      text("Rain size", 0, 110+(index*20));
      
      for (int iRain = 0; iRain < rain.length; iRain++) {    
        
        rain[iRain].z = boxx;    //adjusts the size of rain drops
      }
    }
    
    else if(index == 1) {
      
      fill(255);  
      rect(x, y-10, x+stretch, 10); //line color
      fill(255);
      ellipse(boxx, boxy, size, size); //rectangle tip color
      fill(0);
    
      textSize(12);
      text("Snow size", 0, 110+(index*20)); 
      
      for (int iSnow = 0; iSnow < snow.length; iSnow++) {    
        
        snow[iSnow].diameter = boxx/4;  //adjusts the size of snow drops
      }
    }
    else if(index == 2) {
    fill(0);  
    rect(x, y-10, x+stretch, 10); //line color
    fill(0);
    ellipse(boxx, boxy, size, size); //rectangle tip color
    fill(255);
    
      textSize(12);
      text("Blizzard strength", 0, 110+(index*20)); 
      
      for (int iBlizzard = 0; iBlizzard < blizzard.length; iBlizzard++) {    
        
        blizzard[iBlizzard].yspeed = boxx/4;  //adjust the strength of the blizzard
      }
    }
    if (over || press) {
      fill(0);
      line(boxx, boxy, boxx+size, boxy+size);
      line(boxx, boxy+size, boxx+size, boxy);
    }

  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

int lock(int val, int minv, int maxv) { 
  return  min(max(val, minv), maxv); 
} 

void mouseReleased()  {
  for (int i = 0; i < handles.length; i++) {
    handles[i].releaseEvent();
  }
}