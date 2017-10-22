int bulletLeftMount = 200, bulletRightMount = 200;
Bullet[] bulletLeft = new Bullet[bulletLeftMount];
Bullet[] bulletRight = new Bullet[bulletRightMount];

int barrierMount = 50;
BarriersManager barriersManager = new BarriersManager();
Barriers[] barrier = new Barriers[barrierMount];

int playersMount = 4;
Player[] players = new Player[playersMount];

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
 for(int i=0;i<playersMount;i++){
   players[i] = new Player();
 }
 gameScreenControl();
 //frameRate(60);
}

void draw(){
  gameScreenControl();
}