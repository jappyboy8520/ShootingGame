int bulletLeftAmount = 200, bulletRightAmount = 200;
Bullet[] bulletsLeft = new Bullet[bulletLeftAmount];
Bullet[] bulletsRight = new Bullet[bulletRightAmount];

int barrierAmount = 50;
Barriers[] barriers = new Barriers[barrierAmount];

int playersAmount = 4;
Player[] players = new Player[playersAmount];

int weaponAmount = 8;
Weapon[] weapons = new Weapon[weaponAmount];

int smallGunAmount = 4;
int akAmount = 4;

PImage playerJumpingL, playerJumpingR;
PImage playerStandingL, playerStandingR;
Animation playerMovingL, playerMovingR;

PImage akJumpingL, akJumpingR;
PImage akStandingL, akStandingR;
Animation akMovingL, akMovingR;
Animation akFiringL, akFiringR;

PImage pistolJumpingL, pistolJumpingR;
PImage pistolStandingL, pistolStandingR;
Animation pistolMovingL, pistolMovingR;
Animation pistolFiringL, pistolFiringR;

PImage normalJumpingL, normalJumpingR;
PImage normalStandingL, normalStandingR;
Animation normalMovingL, normalMovingR;

void setup(){
  size(800,600); 
  background(200);
  smooth();
  
  //images
  
  normalJumpingL = loadImage("Images/normal/walk/L-0000.png");
  normalJumpingR = loadImage("Images/normal/walk/R-0000.png");
  normalMovingL = new Animation("Images/normal/walk/L-", 4, 0.08);
  normalMovingR = new Animation("Images/normal/walk/R-", 4, 0.08);
  normalStandingL = loadImage("Images/normal/walk/L-0002.png");
  normalStandingR = loadImage("Images/normal/walk/R-0002.png");
  
  
  pistolJumpingL = loadImage("Images/pistol/walk/L-0000.png");
  pistolJumpingR = loadImage("Images/pistol/walk/R-0000.png");
  pistolMovingL = new Animation("Images/pistol/walk/L-", 4, 0.08);
  pistolMovingR = new Animation("Images/pistol/walk/R-", 4, 0.08);
  pistolStandingL = loadImage("Images/pistol/walk/L-0002.png");
  pistolStandingR = loadImage("Images/pistol/walk/R-0002.png");
  pistolFiringL = new Animation("Images/pistol/shot/L-", 4, 0.01);
  pistolFiringR = new Animation("Images/pistol/shot/R-", 4, 0.01);
  
  akJumpingL = loadImage("Images/ak/walk/L-0000.png");
  akJumpingR = loadImage("Images/ak/walk/R-0000.png");
  akMovingL = new Animation("Images/ak/walk/L-", 4, 0.08);
  akMovingR = new Animation("Images/ak/walk/R-", 4, 0.08);
  akStandingL = loadImage("Images/ak/walk/L-stand.png");
  akStandingR = loadImage("Images/ak/walk/R-stand.png");
  akFiringL = new Animation("Images/ak/shot/L-", 4, 0.01);
  akFiringR = new Animation("Images/ak/shot/R-", 4, 0.01);
  
 
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
    
    players[i].jumpingL = normalJumpingL;
    players[i].jumpingR = normalJumpingR;
    players[i].movingL = normalMovingL;
    players[i].movingR = normalMovingR;
    players[i].standingL = normalStandingL;
    players[i].standingR = normalStandingR;
  }
  //small guns
  for(i=0;i<smallGunAmount;i++){
    weapons[i] = new SmallGun();
    weapons[i].number = i;
    print("1");
  }
  // ak
  for(i=smallGunAmount;i<akAmount+smallGunAmount;i++){
    weapons[i] = new Ak();
    weapons[i].number = i;
  }
  
  frameRate(120);
}

void draw(){
  gameScreenControl();
}