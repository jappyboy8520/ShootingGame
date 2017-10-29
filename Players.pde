float generalSpeedVert=0;
float collisionSize=20.0;
float jumpSpeed = 6.0;

// Translate the players picture to the right sensor area
float offsetX = 30.0, offsetY = 6.0;


class Player{
  Player(){
    speedVert = 0;
    x = y = 100.0;
    wei = collisionSize;
    hei = collisionSize*2;
    left = false;
    switchJump = false;
    hp = 100;
    weaponNumber = -1;
  }
  
  void drawPlayer(){
    /*
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
    */
    
    if(left) image(playerStandingL, x-offsetX, y-offsetY, 80, 50);
    else image(playerStandingR, x-offsetX, y-offsetY, 80, 50);
    
    //draw the hp bar
    fill(255);
    rect(x,y-8,40,4);
    fill(0,255,0);
    rect(x,y-8,40*hp/100,4);
    
    //draw the remains bullet
    if(weaponNumber != -1){
      fill(0);
      text(weapons[weaponNumber].bullets + "/" + weapons[weaponNumber].maxBullets, x, y-10);
    }
  }
  
  void moveLeft(){
    left = true;
    x -= generalMoveSpeed;
    isMoving = true;
  }
  
  void moveRight(){
    left = false;
    x += generalMoveSpeed;
    isMoving = true;
  }
  
  void jump(){
    if(switchJump){
      isJumping = true;
      speedVert = -jumpSpeed;
    }
  }
  
  void setWeapon(int number){
    weaponNumber = number;
  }
  
  int hp, weaponNumber;
  float speedVert, x, y, wei, hei;
  boolean left, switchJump, isMoving, isJumping;
  
}