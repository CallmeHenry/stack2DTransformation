/* INSTRUCTIONS

  Key interactions:
  
    'a' to walk left
      - Walking to the left outside of the door object opens the door and decreases the human's x-axis to make it look like he's stepping down from the house's foundation.
      - and the same works vice versa, except the door closes and the human steps back onto the foundation.
      
    - 'd' to walk right
      - Walking to the right outside of the door object opens the door and decreases the human's x-axis to make it look like he's stepping down from the house's foundation; 
      - and the same works vice versa, except the door closes and the human steps back onto the foundation.
    
    '1' to call in a bird
      - The bird is an animation sprite that follows your cursor.
      
    '2' to plant a tree
      - The tree is created depending on your cursor's x-axis; 
      - the height of the tree is dependent on your cursor's y-axis;
      - the width of the tree trunk is random;
      - and the height, width, and number of layers of the "leaves" are random.
      - This uses an ArrayList.
      
    '3' to make it snow
      - The snow is spawned in at a negative y-axis value, so that it looks more natural rather than having 70 snow objects spawn in at the same y-axis;
      - once it reaches the bottom of the screen, it is moved to the top again;
      - and the speed of it falling is random.
      - This uses an array.
      
    '4' to make it rain
      - Works similar to the snow except it uses map functions
     
    '5' to make a blizzard
      - Similar to rain except different shapes
    
    '6' to remove objects from 1 - 5 keys
      - Removes everything
      
      
  Mouse interaction:
  
    - Mouse click the dog to change his tail wag speed.
    
    - The bird follows your cursor.
    
    - Generated trees are determined by your cursor position, including where the tree is placed (x-axis of cursor) and how tall the tree is (y-axis of cursor).

*/

Human human_1;
Dog dog_1;
House house_1;
Bird bird_1;
Snow[] snow;
ArrayList<Tree> trees = new ArrayList<Tree>();
Rain[] rain = new Rain[500];
Blizzard[] blizzard = new Blizzard[500];

boolean snowFlag;
boolean treeFlag;
boolean rainFlag;
boolean blizzardFlag;
boolean birdFlag;

float xpos = 20;
float ypos = 350;
int i = 0;

birdButton birdButton;
scrollBar hs;
Handle[] handles;
helpButton helpButton;
rainButton rainButton;
snowButton snowButton;
blizzardButton blizzardButton;
otherButton otherButton;

void setup() {
  size(1280, 720);
  stroke(100,100);
  strokeWeight(2);
    
  human_1 = new Human();
  dog_1 = new Dog();
  house_1 = new House();
  
  bird_1 = new Bird("frame-", 4);


  getSnow();
  getRain();
  getBlizzard();
  
  birdButton = new birdButton();
  hs = new scrollBar(0, 10, width, 10, 10);
  
  

  handles = new Handle[3];
  for (int i = 0; i < handles.length; i++) {
    handles[i] = new Handle(0, 110+i*20, 100, 10, handles); //starting xpos, ypos, line xpos, size, object array.  
  }
  
  helpButton = new helpButton();
  rainButton = new rainButton();
  snowButton = new snowButton();
  blizzardButton = new blizzardButton();
  otherButton = new otherButton();
}


void draw() {
 background(90, 184, 255);

  if (treeFlag == true) {
     for (int i = trees.size()-1; i >= 0; i--) {
     trees.get(i).display(); 
    } 
  }

 house_1.display();
 human_1.display();
 dog_1.display();
 
 grass();
 house_1.window(); //want window in front of human
  
 Weather();
 
 checkFlags();
 
 GUI();
 
 
 }
 
 void grass() {
  pushMatrix();
  translate(0, 710);
  fill(0, 209, 0);
  rect(0, 0, 1280, 100);
  popMatrix();
 }
 
 void Weather() {
    if (key == '3') {
       snowFlag = true;
    }
    
    if (key == '2') {
      treeFlag = true;
      trees.add(new Tree(mouseX, mouseY)); 
      keyReleased();
    }
    
    if (key == '4') {
       rainFlag = true;
    }
    
    if (key == '5') {
       blizzardFlag = true; 
    }
    
    if (key == '1') {
       birdFlag = true; 
    }

    else if (key == '6') {  //remove weather functions
       snowFlag = false;
       treeFlag = false;
       rainFlag = false;
       blizzardFlag = false;
       birdFlag = false;
    }
    
 }
 

 
 void generateSnow() {
  fill(255);
  for (int i = 0; i < snow.length; i++) {
     snow[i].move();
     snow[i].display();
  }
 }
 
 void generateRain() {
  for (int i = 0; i < rain.length; i++) {
     rain[i].fall();
     rain[i].display();
  }
 }
 
 void generateBlizzard() {
    fill(255, 255, 255, 50);
    rect(0, 0, width, height);
   for (int i = 0; i < blizzard.length; i++) {
     blizzard[i].fall();
     blizzard[i].display();
  } 
 }
 
 void generateBird() {
    bird_1.draw();
 }
 
 void checkFlags() {
     if (snowFlag == true) {
    generateSnow();
  }
  
  if (rainFlag == true) {
     generateRain(); 
  }

  if (blizzardFlag == true) {
     generateBlizzard();
  }
  
  if (birdFlag == true) {
    generateBird();  
  }
 }
 
 
 void getSnow() {
  int numSnow = 90;
  int dia = width/numSnow;
  
  snow = new Snow[numSnow];
  for (int i = 0; i < snow.length; i++) {
     float x = dia/2 + i*dia;
     float rate = random(0.3, 2.0);
     snow[i] = new Snow(x, -250, dia, rate);
  }
 }
 
 void getRain() {
  for (int i = 0; i < rain.length; i++) {
     rain[i] = new Rain(); 
  }
 }
 
 void getBlizzard() {
  for (int i = 0; i < blizzard.length; i++) {
     blizzard[i] = new Blizzard();
  }
 }
 
 void keyReleased() {
    key = 's'; 
 }
 
 void GUI() {
    birdButton.draw();
    helpButton.draw();
    rainButton.draw();
    snowButton.draw();
    blizzardButton.draw();
    otherButton.draw();
    hs.display();
    
      for (int i = 0; i < handles.length; i++) {
     
    handles[i].update();
    handles[i].display(i);
  }
  

}

 
 