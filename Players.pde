float generalSpeedVert=0;
float generalSize=20;

class Player{
  Player(){
    speedVert = 0;
    x = y = 100;
    size = generalSize;
    left = false;
    switchJump = false;
  }
  
  void drawPlayer(){
    fill(0);
    rect(x,y,size,size*2);
  }
  
  float speedVert,x,y,size;
  boolean left,switchJump;
}