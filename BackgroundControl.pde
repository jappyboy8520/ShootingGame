float airfriction = 0.01;
float gravity=1;
int gameMode;

void gameScreenControl(){
  //0 : Main menu
  if(gameMode==0){
    
  }
  
  if(gameMode==1){
    
  }
  
  if(gameMode==2){
    
  }
  if(gameMode==3){
    
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
  for(int i=0;i<playersMount;i++){
    // ball hits floor
    if (players[i].y+(players[i].size*2) > height) { 
      makeBounceBottom(height, i);
    }
    
    // ball hits ceiling
    if (players[i].y < 0) {
      makeBounceTop(0, i);
    }
    
    // ball hits left bound of Screen
    if (players[i].x < 0){
      makeBounceLeft(0, i);
    }
    
    //ball hits right bound of Screen
    if (players[i].x+(players[i].size) > width){
      makeBounceRight(width, i);
    }
  }
}

void bumpIntoBarrier(){
  for(int i=0;i<50;i++){
    // left bullet hits the bound of barrier
    for(int j=0;j<bulletLeftMount;j++){
      if(bulletLeft[j].x <= barrier[i].right && bulletLeft[j].x >= barrier[i].left &&
          bulletLeft[j].y >= barrier[i].top && bulletLeft[j].y <= barrier[i].bottom){
       bulletLeft[j].visible=false;
      }
    }
    
    // right bullet hits the bound of barrier
    for(int j=0;j<bulletRightMount;j++){
     if(bulletRight[j].x >= barrier[i].left && bulletRight[j].x <= barrier[i].right &&
          bulletRight[j].y >= barrier[i].top && bulletRight[j].y <= barrier[i].bottom){
       bulletRight[j].visible=false;
      }
    }
    
    
    for(int j=0;j<playersMount;j++){
      // character hits left bound of barrier
      if (players[j].x+players[j].size > barrier[i].left && players[j].x+players[j].size < barrier[i].left+20 &&
          players[j].y+players[j].size*2 >= barrier[i].top+5 && players[j].y+players[j].size/3 <= barrier[i].bottom-5){
        makeBounceRight(barrier[i].left, j);
      }
      
      // character hits right bound of barrier
      if (players[j].x < barrier[i].right && players[j].x > barrier[i].right-20 &&
          players[j].y + players[j].size*2 >= barrier[i].top+5 && players[j].y + players[j].size/3 <= barrier[i].bottom-5){
        makeBounceLeft(barrier[i].right, j);
      }
      
      // character hits floor of Barrier
      if (players[j].y + players[j].size*2 >= barrier[i].top && players[j].y + players[j].size*2 < barrier[i].top+20 &&
          players[j].x + players[j].size >=barrier[i].left && players[j].x <=barrier[i].right) { 
        makeBounceBottom(barrier[i].top, j);
      }
      
      // character hits ceiling
      if (players[j].y <= barrier[i].bottom && players[j].y >= barrier[i].bottom-20 &&
          players[j].x + players[j].size >= barrier[i].left && players[j].x <= barrier[i].right) {
        makeBounceTop(barrier[i].bottom, j);
      }
    }

  }
  
}