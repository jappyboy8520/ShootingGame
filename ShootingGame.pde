import processing.sound.*;

SoundFile a;
String audioName = "pistolsound.mp3";
String pp;

int bulletLeftAmount = 200, bulletRightAmount = 200;
Bullet[] bulletsLeft = new Bullet[bulletLeftAmount];
Bullet[] bulletsRight = new Bullet[bulletRightAmount];

int playersAmount = 2;
Player[] players = new Player[playersAmount];

int weaponsAmount = 50;
Weapon[] weapons = new Weapon[weaponsAmount];

int barriersAmount = 50;
Barrier[] barriers = new Barrier[barriersAmount];

int barriersIndex = 0;
int barrierDesertAmount = 20;


int weaponsIndex = 0;
int smallGunAmount = 4;
int akAmount = 4;
int machineGunAmount = 4;

PImage playerJumpingL, playerJumpingR;
PImage playerStandingL, playerStandingR;
Animation playerMovingL, playerMovingR;

PImage machineGunJumpingL, machineGunJumpingR;
PImage machineGunStandingL, machineGunStandingR;
PImage machineGunItem;
Animation machineGunMovingL, machineGunMovingR;
Animation machineGunFiringL, machineGunFiringR;

PImage akJumpingL, akJumpingR;
PImage akStandingL, akStandingR;
PImage akItem;
Animation akMovingL, akMovingR;
Animation akFiringL, akFiringR;

PImage pistolJumpingL, pistolJumpingR;
PImage pistolStandingL, pistolStandingR;
PImage pistolItem;
Animation pistolMovingL, pistolMovingR;
Animation pistolFiringL, pistolFiringR;

PImage normalJumpingL, normalJumpingR;
PImage normalStandingL, normalStandingR;
Animation normalMovingL, normalMovingR;

PImage backgroundDesert;
PImage startpage;
PImage gameover01, gameover02;
PImage barrierDesert;

void setup(){
  size(800,600);
  barriersIndex = 0;
  weaponsIndex = 0;
  switchGenerateWeapon = true;
  
  pp = sketchPath(audioName);
  print(pp);
  a = new SoundFile(this, "pistolsound.mp3");
  
  a.play();
  
  backgroundDesert = loadImage("Images/background.jpg");
  startpage = loadImage("Images/startpage.png");
  barrierDesert = loadImage("Images/platform.png");
  smooth();
  
  //Gameover screen
  gameover01 = loadImage("Images/gameovermode1.png");
  gameover02 = loadImage("Images/gameovermode2.png");
  
  //images
  // animations for normal stickman
  normalJumpingL = loadImage("Images/normal/walk/L-0000.png");
  normalJumpingR = loadImage("Images/normal/walk/R-0000.png");
  normalMovingL = new Animation("Images/normal/walk/L-", 4, 0.08);
  normalMovingR = new Animation("Images/normal/walk/R-", 4, 0.08);
  normalStandingL = loadImage("Images/normal/walk/L-0002.png");
  normalStandingR = loadImage("Images/normal/walk/R-0002.png");
  
  // animations for the stickman which is with a pistol
  pistolJumpingL = loadImage("Images/pistol/walk/L-0000.png");
  pistolJumpingR = loadImage("Images/pistol/walk/R-0000.png");
  pistolMovingL = new Animation("Images/pistol/walk/L-", 4, 0.08);
  pistolMovingR = new Animation("Images/pistol/walk/R-", 4, 0.08);
  pistolStandingL = loadImage("Images/pistol/walk/L-0002.png");
  pistolStandingR = loadImage("Images/pistol/walk/R-0002.png");
  pistolFiringL = new Animation("Images/pistol/shot/L-", 4, 0.01);
  pistolFiringR = new Animation("Images/pistol/shot/R-", 4, 0.01);
  
  // animations for the stickman which is with an ak
  akJumpingL = loadImage("Images/ak/walk/L-0000.png");
  akJumpingR = loadImage("Images/ak/walk/R-0000.png");
  akMovingL = new Animation("Images/ak/walk/L-", 4, 0.08);
  akMovingR = new Animation("Images/ak/walk/R-", 4, 0.08);
  akStandingL = loadImage("Images/ak/walk/L-stand.png");
  akStandingR = loadImage("Images/ak/walk/R-stand.png");
  akFiringL = new Animation("Images/ak/shot/L-", 4, 0.01);
  akFiringR = new Animation("Images/ak/shot/R-", 4, 0.01);
  
  // animations for the stickman which is with a machineGun gun
  machineGunJumpingL = loadImage("Images/machineGun/walk/L-0000.png");
  machineGunJumpingR = loadImage("Images/machineGun/walk/R-0000.png");
  machineGunMovingL = new Animation("Images/machineGun/walk/L-", 4, 0.08);
  machineGunMovingR = new Animation("Images/machineGun/walk/R-", 4, 0.08);
  machineGunStandingL = loadImage("Images/machineGun/walk/L-stand.png");
  machineGunStandingR = loadImage("Images/machineGun/walk/R-stand.png");
  machineGunFiringL = new Animation("Images/machineGun/shot/L-", 3, 0.01);
  machineGunFiringR = new Animation("Images/machineGun/shot/R-", 3, 0.01);
  
  //item images
  pistolItem = loadImage("Images/gunbox/pistol.png");
  akItem = loadImage("Images/gunbox/ak.png");
  machineGunItem = loadImage("Images/gunbox/gunbox.png");
 
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
  for(i=barriersIndex;i<barriersIndex+barrierDesertAmount;i++){
    barriers[i] = new Barrier(barrierDesert);
  }
  barriersIndex += barrierDesertAmount;
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
  for(i=weaponsIndex;i<weaponsIndex+smallGunAmount;i++){
    weapons[i] = new SmallGun();
    weapons[i].number = i;
  }
  weaponsIndex += smallGunAmount;
  
  // ak
  for(i=weaponsIndex;i<weaponsIndex+akAmount;i++){
    weapons[i] = new Ak();
    weapons[i].number = i;
  }
  weaponsIndex += akAmount;
  
  //machineGun gun
  for(i=weaponsIndex;i<weaponsIndex+machineGunAmount;i++){
    weapons[i] = new MachineGun();
    weapons[i].number = i;
  }
  weaponsIndex += machineGunAmount;
  
  frameRate(120);
}

void draw(){
  gameScreenControl();
}