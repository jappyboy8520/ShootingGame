float generalSpeedVert=0;
float collisionSize=20;
PImage img ;

class Player{
  Player(){
    speedVert = 0;
    x = y = 100;
    size = collisionSize;
    left = false;
    switchJump = false;
  }
  
  void drawPlayer(){
    fill(0);
    img = loadImage("2-1.png");
    image(img, x, y, 50, 50);
  }
  
  float speedVert, x, y, size;
  boolean left, switchJump;
}