class Tree {
 
 
  float treeWidth = random(20, 50);
  float treeHeight = random(100, 200);
  float leavesWidth = random(50, 100);
  
  float level = random(1, 5);
  float xpos, ypos;
  
   Tree(float x, float y) {
     this.xpos = x;
     this.ypos = y;
   }
   
  
  void display() {
      fill(139,69,19);
      rect(xpos, ypos, 10 +treeWidth, height);
      fill(0, 255, 0);
      triangle(xpos-treeWidth, ypos, xpos+(leavesWidth/2), ypos-treeHeight, xpos+leavesWidth, ypos);
      for (int i = 0; i < level; i++) {
          triangle(xpos-treeWidth, ypos-(treeWidth*i), xpos+(leavesWidth/2), ypos-treeHeight*i, xpos+leavesWidth, ypos-(treeWidth*i));

      }
  }
}