int generalMoveSpeed = 6;
boolean[] isLeft = new boolean[4],isRight = new boolean[4],
          isUp = new boolean[4], isDown = new boolean[4], isFire = new boolean[4];

SmallGun ss = new SmallGun();

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
    return isLeft[0] = switchP;
      
  case 'D':
  case 'd':
    return isRight[0] = switchP;
    
  case ' ':
    return isFire[0] = switchP;
    
    
    
  //P2 control
  case UP:
    return isUp[1] = switchP;
 
  case DOWN:
    return isDown[1] = switchP;
 
  case LEFT:
    return isLeft[1] = switchP;
      
  case RIGHT:
    return isRight[1] = switchP;
    
  case '5':
    return isFire[1] = switchP;
    
 
  default:
    return switchP;
  }
}

void keyControl(){
  
  for(int i=0;i<playersMount;i++){
    if (isLeft[i]){
      players[i].left = true;
      players[i].x -= generalMoveSpeed;
    }
    
    if (isRight[i]){
      players[i].left = false;
      players[i].x += generalMoveSpeed;
    }
    
    if (isDown[i]) ;
    
    if (isUp[i]){
      
      if(players[i].switchJump) jump(i);
      
    } 
    
    if (isFire[i]){
      if(ss.switchFire){
        fire(i);
      }
      ss.coolDown();
    }
  }
  
}



void jump(int playerIndex){
  players[playerIndex].speedVert = -20;
}

//set the position of the bullet for firing
void fire(int playerIndex){
  //control the global bulletIndex 
  if(players[playerIndex].left) bulletLeftCounter++;
  else bulletRightCounter++;
  
  //over the max bulletMount back to 0
  if(bulletLeftCounter>=bulletLeftMount) bulletLeftCounter=0;
  if(bulletRightCounter>=bulletRightMount) bulletRightCounter=0;
  
  //set the left bullet
  if(players[playerIndex].left){
    bulletLeft[bulletLeftCounter].setPosition(playerIndex);
    bulletLeft[bulletLeftCounter].visible=true;
  }
  
  //set the right bullet
  else{
    bulletRight[bulletRightCounter].setPosition(playerIndex);
    bulletRight[bulletRightCounter].visible=true;
  }
  
}