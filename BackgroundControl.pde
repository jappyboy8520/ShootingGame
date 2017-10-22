void keepInScreen() {
  // ball hits floor
  if (p1Y+(characterSize*2) > height) { 
    makeBounceBottom(height);
    switchJump = true;
  }
  
  // ball hits ceiling
  if (p1Y < 0) {
    makeBounceTop(0);
  }
  
  // ball hits left bound of Screen
  if (p1X < 0){
    makeBounceLeft(0);
  }
  
  //ball hits right bound of Screen
  if (p1X+(characterSize) > width){
    makeBounceRight(width);
  }
  
}

void bumpIntoBarrier(){
  // ball hits floor of Barrier
  /*if (p1Y+characterSize*2 >= 500 && p1Y+characterSize*2 <= 520 &&
      p1X+characterSize >=100 && p1X <=200) { 
    makeBounceBottom(500);
    switchJump = true;
  }
  
  // ball hits ceiling
  if (p1Y >= 490 && p1Y <= 510 &&
      p1X+characterSize >=100 && p1X <=200) {
    makeBounceTop(510);
  }
  
  // ball hits left bound of barrier
  if (p1X >= 100 && p1X<=110 && p1Y+characterSize>=100 && p1Y+characterSize<=110){
    makeBounceLeft(100);
  }
  
  //ball hits right bound of barrier
  if (p1X <= 200 && p1X >= 190 && p1Y+characterSize>=100 && p1Y+characterSize<=110){
    makeBounceRight(200);
  }*/
  
  for(int i=0;i<50;i++){
    
    // character hits left bound of barrier
    if (p1X+characterSize > barrier[i].left && p1X+characterSize < barrier[i].left+20 &&
        p1Y+characterSize*2 >= barrier[i].top+5 && p1Y+characterSize/3 <= barrier[i].bottom-5){
      makeBounceRight(barrier[i].left);
    }
    
    // character hits right bound of barrier
    if (p1X < barrier[i].right && p1X > barrier[i].right-20 &&
        p1Y+characterSize*2 >= barrier[i].top+5 && p1Y+characterSize/3 <= barrier[i].bottom-5){
      makeBounceLeft(barrier[i].right);
    }
    
    // character hits floor of Barrier
    if (p1Y+characterSize*2 >= barrier[i].top && p1Y+characterSize*2 < barrier[i].top+20 &&
        p1X+characterSize >=barrier[i].left && p1X <=barrier[i].right) { 
      makeBounceBottom(barrier[i].top);
      switchJump = true;
    }
    
    // character hits ceiling
    if (p1Y <= barrier[i].bottom && p1Y >= barrier[i].bottom-20 &&
        p1X+characterSize >= barrier[i].left && p1X <= barrier[i].right) {
      makeBounceTop(barrier[i].bottom);
    }
    
    for(int j=0;j<bulletLeftMount;j++){
      if(bulletLeft[j].x <= barrier[i].right &&
          bulletLeft[j].y >= barrier[i].top && bulletLeft[j].y <= barrier[i].bottom){
       bulletLeft[j].visible=false;
      }
    }
    for(int j=0;j<bulletRightMount;j++){
       if(bulletRight[j].x >= barrier[i].left &&
          bulletRight[j].y >= barrier[i].top && bulletRight[j].y <= barrier[i].bottom){
       bulletRight[j].visible=false;
      }
    }


  }
  
}