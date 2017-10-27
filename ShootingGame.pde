int bulletLeftAmount = 200, bulletRightAmount = 200;
Bullet[] bulletsLeft = new Bullet[bulletLeftAmount];
Bullet[] bulletsRight = new Bullet[bulletRightAmount];

int barrierAmount = 50;
Barriers[] barriers = new Barriers[barrierAmount];

int playersAmount = 4;
Player[] players = new Player[playersAmount];

int weaponAmount = 4;
Weapon[] weapons = new Weapon[weaponAmount];

int smallGunAmount = 4;

PImage playerJumpingL, playerJumpingR;
PImage playerStandingL, playerStandingR;
Animation playerMovingL, playerMovingR;

void setup(){
  size(800,600); 
  background(200);
  smooth();
 
  int i;
  //left bullet
  for(i=0;i<bulletLeftAmount;i++){
    bulletsLeft[i] = new Bullet(true);
  }
  //right bullet
  for(i=0;i<bulletRightAmount;i++){
    bulletsRight[i] = new Bullet(false);
  }
  //barrier
  for(i=0;i<barrierAmount;i++){
    barriers[i] = new Barriers();
  }
  //players
  for(i=0;i<playersAmount;i++){
    players[i] = new Player();
  }
  //small guns
  for(i=0;i<smallGunAmount;i++){
    weapons[i] = new SmallGun();
    weapons[i].number = i;
  }
  //images
  playerJumpingL = loadImage("Jumping_L.png");
  playerJumpingR = loadImage("Jumping_R.png");
  playerStandingL = loadImage("Standing_L.png");
  playerStandingR = loadImage("Standing_R.png");
  playerMovingL = new Animation("Moving_L_", 5);
  playerMovingR = new Animation("Moving_R_", 5);
  
  frameRate(120);
 
  //test
  players[0].weaponNumber = 0;
  players[1].weaponNumber = 1;
}

void draw(){
  gameScreenControl();
}