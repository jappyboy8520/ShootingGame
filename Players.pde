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
    isLeft = false;
    switchJump = false;
    isJumping = false;
    isMoving = false;
    isFiring = false;
    hp = 100;
    weaponNumber = -1;
  }
  
  void drawPlayer(){
    
    if(isFiring){
      if(isLeft){
        
        firingL.display(x-offsetX, y-offsetY, 80, 50);
        
        // only show the animation once
        if(firingL.frame == firingL.imageCount-1){
          firingL.coolDownReset();
          isFiring = false;
        } 
      } 
      
      else{
        
        firingR.display(x-offsetX, y-offsetY, 80, 50);
        
        // only show the animation once
        if(firingR.frame == firingR.imageCount-1){
          firingR.coolDownReset();
          isFiring = false;
        }
      } 
      
    }
    
    else if(isMoving && !isJumping){
      if(isLeft) movingL.display(x-offsetX, y-offsetY, 80, 50);
      else movingR.display(x-offsetX, y-offsetY, 80, 50);
    }
    
    else if (isJumping){
      if(isLeft) image(jumpingL, x-offsetX, y-offsetY, 80, 50);
      else image(jumpingR, x-offsetX, y-offsetY, 80, 50);
    }
    
    else{
      if(isLeft) image(standingL, x-offsetX, y-offsetY, 80, 50);
      else image(standingR, x-offsetX, y-offsetY, 80, 50);
    }
    
    
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
    isLeft = true;
    x -= generalMoveSpeed;
    isMoving = true;
  }
  
  void moveRight(){
    isLeft = false;
    x += generalMoveSpeed;
    isMoving = true;
  }
  
  void jump(){
    if(switchJump){
      isJumping = true;
      speedVert = -jumpSpeed;
      switchJump = false;
    }
  }
  
  void setWeapon(int number){
    weaponNumber = number;
  }
  
  int hp, weaponNumber;
  float speedVert, x, y, wei, hei;
  boolean switchJump, isLeft, isMoving, isJumping, isFiring;
  
  PImage jumpingL, jumpingR;
  PImage standingL, standingR;
  Animation movingL, movingR;
  Animation firingL, firingR;
}