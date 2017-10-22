int bulletLeftMount = 200, bulletRightMount = 200;
Bullet[] bulletsLeft = new Bullet[bulletLeftMount];
Bullet[] bulletsRight = new Bullet[bulletRightMount];

int barrierMount = 50;
Barriers[] barriers = new Barriers[barrierMount];

int playersMount = 4;
Player[] players = new Player[playersMount];

void setup(){
 size(800,600); 
 background(200);
 smooth();
 //left bullet
 for(int i=0;i<bulletLeftMount;i++){
   bulletsLeft[i] = new Bullet(true);
 }
 //right bullet
 for(int i=0;i<bulletRightMount;i++){
   bulletsRight[i] = new Bullet(false);
 }
 //barrier
 for(int i=0;i<barrierMount;i++){
   barriers[i] = new Barriers();
 }
 //players
 for(int i=0;i<playersMount;i++){
   players[i] = new Player();
 }
 frameRate(120);
}

void draw(){
  gameScreenControl();
}