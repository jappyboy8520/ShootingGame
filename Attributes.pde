float airfriction = 0.01;
float gravity=1;

void applyGravity() {
  characterSpeedVert += gravity;
  p1Y += characterSpeedVert;
  characterSpeedVert -= (characterSpeedVert * airfriction);
}

void makeBounceBottom(float surface) {
  p1Y = surface-(characterSize*2);
  characterSpeedVert = 0;
}

void makeBounceTop(float surface) {
  p1Y = surface;
  characterSpeedVert = 0;
}

void makeBounceLeft(float surface){
  characterLeft = false;
  p1X = surface;
  characterSpeedVert = 0;
}

void makeBounceRight(float surface){
  characterLeft = true;
  p1X = surface-characterSize;
  characterSpeedVert = 0;
}