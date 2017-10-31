float generalMoveSpeed = 3.0;
boolean[] isLeft = new boolean[4],isRight = new boolean[4],
          isUp = new boolean[4], isDown = new boolean[4], isFire = new boolean[4];

void keyPressed() {
  playerButtonControl(keyCode, true);
}

void keyReleased() {
  playerButtonControl(keyCode, false);
}

boolean playerButtonControl(int keyP, boolean switchP) {
  switch (keyP) {
  //P1 control
  case 'W':
  case 'w':
    return isUp[0] = switchP;
 
  case 'S':
  case 's':
    return isDown[0] = switchP;
 
  case 'A':
  case 'a':
    if(!switchP) players[0].isMoving = false;
    return isLeft[0] = switchP;
      
  case 'D':
  case 'd':
    if(!switchP) players[0].isMoving = false;
    return isRight[0] = switchP;
    
  case ' ':
    return isFire[0] = switchP;
    
    
    
  //P2 control
  case UP:
    return isUp[1] = switchP;
 
  case DOWN:
    return isDown[1] = switchP;
 
  case LEFT:
  if(!switchP) players[1].isMoving = false;
    return isLeft[1] = switchP;
      
  case RIGHT:
  if(!switchP) players[1].isMoving = false;
    return isRight[1] = switchP;
    
  case '5':
    return isFire[1] = switchP;
    
 
  default:
    return switchP;
  }
}

void keyControl(){
  
  for(int i=0;i<playersAmount;i++){
    
    if (isLeft[i]){
      players[i].moveLeft();
    }
    
    if (isRight[i]){
      players[i].moveRight();
    }
    
    if (isDown[i]) ;
    
    if (isUp[i]){
      players[i].jump();
    } 
    
    if (isFire[i]){
      //check if the player take the weapon
      if(players[i].weaponNumber != -1){
        weapons[players[i].weaponNumber].fire(i);
      }
    }
  }
  
}

/*void jump(int playerIndex){
  players[playerIndex].isJumping = true;
  players[playerIndex].speedVert = -jumpSpeed;
}*/

//set the position of the bullet for firing
/*void fire(int playerIndex){
  //weaponNumber -1 equal to non weapon
  if(players[playerIndex].weaponNumber != -1){
    //check if it can shoot
    if(weapons[players[playerIndex].weaponNumber].switchFire && weapons[players[playerIndex].weaponNumber].bullets>0){
      //control the global bulletIndex 
      if(players[playerIndex].left) bulletLeftCounter++;
      else bulletRightCounter++;
      
      //over the max bulletAmount back to 0
      if(bulletLeftCounter>=bulletLeftAmount) bulletLeftCounter=0;
      if(bulletRightCounter>=bulletRightAmount) bulletRightCounter=0;
      
      //set the left bullet
      if(players[playerIndex].left){
        bulletsLeft[bulletLeftCounter].setPosition(playerIndex);
        bulletsLeft[bulletLeftCounter].visible=true;
      }
      
      //set the right bullet
      else{
        bulletsRight[bulletRightCounter].setPosition(playerIndex);
        bulletsRight[bulletRightCounter].visible=true;
      }
      
      //substract the bullet from the gun
      weapons[players[playerIndex].weaponNumber].bullets--;

    }
    //cooldown for shooting
    weapons[players[playerIndex].weaponNumber].coolDown();
  }
}*/