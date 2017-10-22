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