int bulletLeftMount = 200, bulletRightMount = 200;
Bullet[] bulletLeft = new Bullet[bulletLeftMount];
Bullet[] bulletRight = new Bullet[bulletRightMount];

int barrierMount = 50;
ObjectManager objectManager = new ObjectManager();
Barriers[] barrier = new Barriers[barrierMount];

int playerMount = 4;
Player[] players = new Player[playerMount];

void setup(){
 size(800,600); 
 background(200);
 smooth();
 //left bullet
 for(int i=0;i<bulletLeftMount;i++){
   bulletLeft[i] = new Bullet(true);
 }
 //right bullet
 for(int i=0;i<bulletRightMount;i++){
   bulletRight[i] = new Bullet(false);
 }
 //barrier
 for(int i=0;i<barrierMount;i++){
   barrier[i] = new Barriers();
 }
 //players
 for(int i=0;i<playerMount;i++){
   players[i] = new Player();
 }
 frameRate(60);
}

void draw(){
  background(200);
  objectManager.generateBar();
  drawPlayer1();
  player1.drawPlayer();
  applyGravity();
  keepInScreen();
  bumpIntoBarrier();
  keyControl();
  
  
  for(int i=0;i<bulletLeftMount;i++){
    if(bulletLeft[i].visible){
      bulletLeft[i].show();
      bulletLeft[i].move();
    }
  }
  
  for(int i=0;i<bulletRightMount;i++){
    if(bulletRight[i].visible){
      bulletRight[i].show();
      bulletRight[i].move();
    }
  }
  
  switchJump=false;
}