float airfriction = 0.005;
float gravity = 0.1;
int gameMode = 0;
float currentTime;

// for generating weapon //will be altered //////////////////////////////////////////////////////////////////
boolean switchGenerateWeapon = true;
float generateStartTime;
float generateCoolDown = 6;

//0 : Main menu, 1 : Gaming, 2 : game over, 3:control dedtail
void gameScreenControl(){
  //0 : Main menu
  if( gameMode==0 ){
    
    background(startpage);
    menuControl();
  }
  
  //1 : Gaming
  if(gameMode==1){
    
    background(backgroundDesert);
    barriers[0].drawBarrier(20,400,240,10);
    //bound barrier
    barriers[1].drawBarrier(0,0,800,20);
    barriers[2].drawBarrier(0,0,20,600);
    barriers[3].drawBarrier(780,0,20,600);
    barriers[4].drawBarrier(0,580,800,20);
    // horizontal barrier
    barriers[5].drawBarrier(400,200,70,10);
    barriers[6].drawBarrier(300,300,60,10);
    barriers[7].drawBarrier(700,100,80,10);
    barriers[8].drawBarrier(540,400,240,10);
    barriers[9].drawBarrier(20,240,130,10);
    barriers[10].drawBarrier(200,100,40,10);
    barriers[11].drawBarrier(350,460,100,10);
    barriers[12].drawBarrier(520,280,100,10);
    
    //vertical barrier
    barriers[13].drawBarrier(520,450,25,130);
    barriers[14].drawBarrier(270,450,25,130);
    
    
    players[0].drawPlayer();
    players[1].drawPlayer();
    applyGravity();
    keepInScreen();
    playerHitsBarrier();
    keyControl();
    
   /* weapons[0].showItem(600,550);
    weapons[1].showItem(100,550); // small gunbox
    weapons[5].showItem(200,550); // ak gunbox
    weapons[8].showItem(700,550); // machine gunbox
    */
    
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
    
    generateWeapon();
    
    checkGameOver();
    
    //end Gaming
  }
  
  //2: game over
  if(gameMode==2){
    
    if(mousePressed){
      setup();
      gameMode = 0;
    }
  }
  
  //3: control detail
  if(gameMode==3){
    background(imgControl);
    if(mousePressed){
      gameMode = 1;
    }
  }
  
}

void checkGameOver(){
  if(players[0].hp<=0){
    gameMode = 2;
    background(gameover01);
  } 
  else if(players[1].hp<=0){
    gameMode = 2;
    background(gameover02);
  } 
}

void menuControl(){
  if(mousePressed){
    if(mouseX>=130 && mouseX<=280 && mouseY>=540 && mouseY<=595){
      gameMode = 3;
      mousePressed = false;
    }
    if(mouseX>=540 && mouseX<=690 && mouseY>=540 && mouseY<=595){
      exit();
    }
  }
}


void applyGravity() {
  
  //players
  for(int i=0;i<playersAmount;i++){
    players[i].speedVert += gravity;
    players[i].y += players[i].speedVert;
    players[i].speedVert -= players[i].speedVert * airfriction;
  }
  
  //Weapons
  for(int i=0;i<weaponsIndex;i++){
    weapons[i].speedVert += gravity;
    weapons[i].y += weapons[i].speedVert;
    weapons[i].speedVert -= weapons[i].speedVert * airfriction;
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
  for(int i=0;i<barriersIndex;i++){

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
          players[j].x + players[j].wei > barriers[i].left && players[j].x < barriers[i].right) { 
        makeBounceBottom(barriers[i].top, j);
      }
      
      // player hits ceiling of Barrier
      if (players[j].y <= barriers[i].bottom && players[j].y >= barriers[i].bottom-collisionSize &&
          players[j].x + players[j].wei > barriers[i].left && players[j].x < barriers[i].right) {
        makeBounceTop(barriers[i].bottom, j);
      }
    }
    
    for(int j=0;j<weaponsIndex;j++){
      // player hits left bound of barrier
      if (weapons[j].x+weapons[j].wei > barriers[i].left && weapons[j].x+weapons[j].wei < barriers[i].left+collisionSize &&
          weapons[j].y+weapons[j].hei >= barriers[i].top+5 && weapons[j].y+weapons[j].wei/5 <= barriers[i].bottom-5){
        weapons[j].y = barriers[i].left-(weapons[j].hei);
      }
      
      // player hits right bound of barrier
      if (weapons[j].x < barriers[i].right && weapons[j].x > barriers[i].right-collisionSize &&
          weapons[j].y + weapons[j].hei >= barriers[i].top+5 && weapons[j].y + weapons[j].wei/5 <= barriers[i].bottom-5){
        weapons[j].y = barriers[i].right-(weapons[j].hei);
      }
      
      // player hits floor of Barrier
      if (weapons[j].y + weapons[j].hei >= barriers[i].top && weapons[j].y + weapons[j].hei <= barriers[i].top+collisionSize &&
          weapons[j].x + weapons[j].wei > barriers[i].left && weapons[j].x < barriers[i].right) { 
        weapons[j].y = barriers[i].top-(weapons[j].hei);
        weapons[j].speedVert = 0;
      }
      
      // player hits ceiling of Barrier
      if (weapons[j].y <= barriers[i].bottom && weapons[j].y >= barriers[i].bottom-collisionSize &&
          weapons[j].x + weapons[j].wei > barriers[i].left && weapons[j].x < barriers[i].right) {
        weapons[j].y = barriers[i].bottom-(weapons[j].hei);
        weapons[j].speedVert = 0;
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
  //players[playerIndex].speedVert = 0.5;
}

void makeBounceRight(float surface, int playerIndex){
  //players[playerIndex].left = true;
  players[playerIndex].x = surface-players[playerIndex].wei;
  //players[playerIndex].speedVert = 0.5;
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

//generate Weapon // will be altered //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void generateWeapon(){
  
  if( switchGenerateWeapon ){
    int randomWeapon = int(random(weaponsIndex));
    if(weapons[randomWeapon].isGotten == false){
      weapons[randomWeapon].reset();
      weapons[randomWeapon].isItem = true;
    }
  }
  
  for(int i=0;i<weaponsIndex;i++){
    weapons[i].showItem();
  } 
  
  generateCoolDown();
  
}

void generateCoolDown(){
  currentTime = millis()/1000.0;
  if(switchGenerateWeapon) generateStartTime = currentTime;
  switchGenerateWeapon = false;
  if(currentTime - generateStartTime >= generateCoolDown) switchGenerateWeapon = true;
}