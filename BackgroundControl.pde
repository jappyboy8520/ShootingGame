float airfriction = 0.005;
float gravity = 0.1;
int gameMode = 0;

//0 : Main menu, 1 : Gaming, 2 : game over
void gameScreenControl(){
  //0 : Main menu
  if(gameMode==0){
    background(200);
    if(mousePressed) gameMode=1;
  }
  
  //1 : Gaming
  if(gameMode==1){
    
    background(200);
    barriers[0].drawBarrier(100,450,100,100);
    
    barriers[1].drawBarrier(0,0,800,20);
    barriers[2].drawBarrier(0,0,20,600);
    barriers[3].drawBarrier(780,0,20,600);
    barriers[4].drawBarrier(0,580,800,20);
    
    
    players[0].drawPlayer();
    players[1].drawPlayer();
    applyGravity();
    keepInScreen();
    playerHitsBarrier();
    keyControl();
    
    weapons[0].showItem(500,550);
    weapons[1].showItem(300,550);
    
    for(int i=0;i<bulletLeftAmount;i++){
      if(bulletsLeft[i].visible){
        bulletsLeft[i].show();
        bulletsLeft[i].move();
      }
    }
    
    for(int i=0;i<bulletRightAmount;i++){
      if(bulletsRight[i].visible){
        bulletsRight[i].show();
        bulletsRight[i].move();
      }
    }
    
    for(int i=0;i<playersAmount;i++){
      players[i].switchJump = false;
    }
    
    checkGameOver();
    
    //end Gaming
  }
  
  //2: game over
  if(gameMode==2){
    background(200);
    if(mousePressed){
      setup();
      gameMode = 0;
    } 
  }
  
  if(gameMode==3){
    
  }
  
}

void gameOver(){
  gameMode = 2;
}

void checkGameOver(){
  for(int i=0;i<playersAmount;i++){
    if(players[i].hp <= 0) gameOver();
  }
}


void applyGravity() {
  for(int i=0;i<4;i++){
    players[i].speedVert += gravity;
    players[i].y += players[i].speedVert;
    players[i].speedVert -= players[i].speedVert * airfriction;
  }
  
}

void keepInScreen() {
  for(int i=0;i<playersAmount;i++){
    // player hits floor
    if (players[i].y+(players[i].hei) > height) { 
      makeBounceBottom(height, i);
    }
    
    // player hits ceiling
    if (players[i].y < 0) {
      makeBounceTop(0, i);
    }
    
    // player hits left bound of Screen
    if (players[i].x < 0){
      makeBounceLeft(0, i);
    }
    
    //player hits right bound of Screen
    if (players[i].x+(players[i].wei) > width){
      makeBounceRight(width, i);
    }
  }
}

//player collision
void playerHitsBarrier(){
  for(int i=0;i<50;i++){

    for(int j=0;j<playersAmount;j++){
      // player hits left bound of barrier
      if (players[j].x+players[j].wei > barriers[i].left && players[j].x+players[j].wei < barriers[i].left+collisionSize &&
          players[j].y+players[j].hei >= barriers[i].top+5 && players[j].y+players[j].wei/5 <= barriers[i].bottom-5){
        makeBounceRight(barriers[i].left, j);
      }
      
      // player hits right bound of barrier
      if (players[j].x < barriers[i].right && players[j].x > barriers[i].right-collisionSize &&
          players[j].y + players[j].hei >= barriers[i].top+5 && players[j].y + players[j].wei/5 <= barriers[i].bottom-5){
        makeBounceLeft(barriers[i].right, j);
      }
      
      // player hits floor of Barrier
      if (players[j].y + players[j].hei >= barriers[i].top && players[j].y + players[j].hei <= barriers[i].top+collisionSize &&
          players[j].x + players[j].wei >= barriers[i].left && players[j].x < barriers[i].right) { 
        makeBounceBottom(barriers[i].top, j);
      }
      
      // player hits ceiling of Barrier
      if (players[j].y <= barriers[i].bottom && players[j].y >= barriers[i].bottom-collisionSize &&
          players[j].x + players[j].wei >= barriers[i].left && players[j].x < barriers[i].right) {
        makeBounceTop(barriers[i].bottom, j);
      }
    }

  }
}

//players Collision attributes
void makeBounceBottom(float surface, int playerIndex) {
  players[playerIndex].y = surface-(players[playerIndex].hei);
  players[playerIndex].speedVert = 0;
  players[playerIndex].switchJump = true;
  players[playerIndex].isJumping = false;
}

void makeBounceTop(float surface, int playerIndex) {
  players[playerIndex].y = surface;
  players[playerIndex].speedVert = 0;
}

void makeBounceLeft(float surface, int playerIndex){
  //players[playerIndex].left = false;
  players[playerIndex].x = surface;
  players[playerIndex].speedVert = 0.5;
}

void makeBounceRight(float surface, int playerIndex){
  //players[playerIndex].left = true;
  players[playerIndex].x = surface-players[playerIndex].wei;
  players[playerIndex].speedVert = 0.5;
}


//check if two rect overlap
boolean collision(float x1, float y1, float wei1, float hei1, float x2, float y2, float wei2, float hei2){
  float nMaxLeft = x1 >= x2 ? x1 : x2;  
  float nMaxTop = y1 >= y2 ? y1 : y2;  
  float nMinRight = (x1 + wei1) <= (x2 + wei2) ? (x1 + wei1) : (x2 + wei2);  
  float nMinBottom = (y1 + hei1) <= (y2 + hei2) ? (y1 + hei1) : (y2 + hei2);
  
  if (nMaxLeft > nMinRight || nMaxTop > nMinBottom){  
    return false;  
  }  
  else{  
    return true;  
  }  
}