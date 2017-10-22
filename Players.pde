float generalSpeedVert=0;
float collisionSize=20.0;
PImage playerImg ;

class Player{
  Player(){
    speedVert = 0;
    x = y = 100.0;
    size = collisionSize;
    left = false;
    switchJump = false;
    hp = 100;
    damage = 10;
  }
  
  void drawPlayer(){
    fill(0);
    playerImg = loadImage("2-1.png");
    
    //draw the hp bar
    fill(255);
    rect(x,y-8,40,4);
    fill(0,255,0);
    rect(x,y-8,40*hp/100,4);
    
    image(playerImg, x, y, 50, 50);
  }
  
  void setDamage(int damageP){
    damage = damageP;
  }
  
  int hp,damage;
  float speedVert, x, y, size;
  boolean left, switchJump;
  
}