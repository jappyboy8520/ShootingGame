float generalSpeedVert=0;
float collisionSize=20.0;



class Player{
  Player(){
    speedVert = 0;
    x = y = 100.0;
    size = collisionSize;
    left = false;
    switchJump = false;
    hp = 100;
  }
  
  void drawPlayer(){
    
    //while jumping
    if(isJumping){
      if(left){
        image(playerJumpingL, x, y, 50, 50);
      } 
      else{
        image(playerJumpingR, x, y, 50, 50);
      } 
    }
    
    //while walking
    else if(isMoving && !isJumping){
      if(left) playerMovingL.display(x, y, 50, 50);
      else playerMovingR.display(x, y, 50, 50);
    }

    //stand
    else{
      if(left) image(playerStandingL, x, y, 50, 50);
      else image(playerStandingR, x, y, 50, 50);
    }
    
    //draw the hp bar
    fill(255);
    rect(x,y-8,40,4);
    fill(0,255,0);
    rect(x,y-8,40*hp/100,4);
  }
  
  void setWeapon(int number){
    weaponNumber = number;
  }
  
  int hp, weaponNumber;
  float speedVert, x, y, size;
  boolean left, switchJump, isMoving, isJumping;
  
}