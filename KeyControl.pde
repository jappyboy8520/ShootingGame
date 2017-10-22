boolean switchJump=false;
boolean isLeft, isRight, isUp, isDown, isFire; 

void keyPressed() {
  setMove(keyCode, true);
}
 
void keyReleased() {
  setMove(keyCode, false);
}

void keyControl(){
  if (isLeft){
    characterLeft=true;
    p1X-=10;
  }
  
  if (isRight){
    characterLeft=false;
    p1X+=10;
  }
  
  if (isDown) ;
  
  if (isUp){
    if(switchJump) jump();
  } 
  
  if (isFire){
    fire();
  }
  
}

boolean setMove(int keyP, boolean switchP) {
  switch (keyP) {
  case UP:
    return isUp = switchP;
 
  case DOWN:
    return isDown = switchP;
 
  case LEFT:
    return isLeft = switchP;
      
  case RIGHT:
    return isRight = switchP;
    
  case ' ':
    return isFire = switchP;
 
  default:
    return switchP;
  }
}

void jump(){
  characterSpeedVert=-20;
}

void fire(){
  if(characterLeft) bulletLeftCounter++;
  else bulletRightCounter++;
  
  if(bulletLeftCounter>=bulletLeftMount) bulletLeftCounter=0;
  if(bulletRightCounter>=bulletRightMount) bulletRightCounter=0;
  
  if(characterLeft){
    bulletLeft[bulletLeftCounter].setPosition();
    bulletLeft[bulletLeftCounter++].visible=true;
  }
  
  else{
    bulletRight[bulletRightCounter].setPosition();
    bulletRight[bulletRightCounter++].visible=true;
  }
}