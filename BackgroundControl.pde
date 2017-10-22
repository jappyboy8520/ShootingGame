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
    barriers[0].drawBarrier(100,400,100,100);
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
    
    for(int i=0;i<bulletLeftMount;i++){
      if(bulletsLeft[i].visible){
        bulletsLeft[i].show();
        bulletsLeft[i].move();
      }
    }
    
    for(int i=0;i<bulletRightMount;i++){
      if(bulletsRight[i].visible){
        bulletsRight[i].show();
        bulletsRight[i].move();
      }
    }
    
    for(int i=0;i<playersMount;i++){
      players[i].switchJump = false;
    }
    
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

void applyGravity() {
  for(int i=0;i<4;i++){
    players[i].speedVert += gravity;
    players[i].y += players[i].speedVert;
    players[i].speedVert -= players[i].speedVert * airfriction;
  }
  
}

void keepInScreen() {
  for(int i=0;i<playersMount;i++){
    // player hits floor
    if (players[i].y+(players[i].size*2) > height) { 
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
    if (players[i].x+(players[i].size) > width){
      makeBounceRight(width, i);
    }
  }
}

//player collision
void playerHitsBarrier(){
  for(int i=0;i<50;i++){

    for(int j=0;j<playersMount;j++){
      // player hits left bound of barrier
      if (players[j].x+players[j].size > barriers[i].left && players[j].x+players[j].size < barriers[i].left+20 &&
          players[j].y+players[j].size*2 >= barriers[i].top+5 && players[j].y+players[j].size/3 <= barriers[i].bottom-5){
        makeBounceRight(barriers[i].left, j);
      }
      
      // player hits right bound of barrier
      if (players[j].x < barriers[i].right && players[j].x > barriers[i].right-20 &&
          players[j].y + players[j].size*2 >= barriers[i].top+5 && players[j].y + players[j].size/3 <= barriers[i].bottom-5){
        makeBounceLeft(barriers[i].right, j);
      }
      
      // player hits floor of Barrier
      if (players[j].y + players[j].size*2 >= barriers[i].top && players[j].y + players[j].size*2 <= barriers[i].top+20 &&
          players[j].x + players[j].size >= barriers[i].left && players[j].x <=barriers[i].right) { 
        makeBounceBottom(barriers[i].top, j);
      }
      
      // player hits ceiling of Barrier
      if (players[j].y <= barriers[i].bottom && players[j].y >= barriers[i].bottom-20 &&
          players[j].x + players[j].size >= barriers[i].left && players[j].x <= barriers[i].right) {
        makeBounceTop(barriers[i].bottom, j);
      }
    }

  }
}

//players Collision attributes
void makeBounceBottom(float surface, int playerIndex) {
  players[playerIndex].y = surface-(players[playerIndex].size*2);
  players[playerIndex].speedVert = 0;
  players[playerIndex].switchJump = true;
}

void makeBounceTop(float surface, int playerIndex) {
  players[playerIndex].y = surface;
  players[playerIndex].speedVert = 0;
}

void makeBounceLeft(float surface, int playerIndex){
  players[playerIndex].left = false;
  players[playerIndex].x = surface;
  players[playerIndex].speedVert = 0;
}

void makeBounceRight(float surface, int playerIndex){
  players[playerIndex].left = true;
  players[playerIndex].x = surface-players[playerIndex].size;
  players[playerIndex].speedVert = 0;
}