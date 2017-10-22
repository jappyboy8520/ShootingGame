float characterSpeedVert=0;
boolean characterLeft=false;
float p1X=50 ,p1Y=100;
float characterSize=20;

class Player{
  Player(){
    speedVert=0;
    x=y=100;
    size=20;
  }
  
  void drawPlayer(){
    fill(0);
    rect(x,y,size,size*2);
  }
  
  float speedVert,x,y,size;
}

void drawPlayer1(){
  fill(0);
  rect(p1X,p1Y,characterSize,characterSize*2);
}