int bulletLeftCounter = 0;
int bulletRightCounter = 0;
int barrierCounter = 0;
float bulletSize = 10.0;
float bulletSpeed = 30.0;
float weaponItemSize = 20.0;

class Bullet{
  Bullet(boolean L){ 
    if(L)speed = -bulletSpeed;
    else speed = bulletSpeed;
    
    x=0.0;
    y=0.0;     
  }

  void setPosition(int playerIndex){
    // after set the position the bullet can hurt
    switchHurt = true;
    if(players[playerIndex].isLeft){
      x = players[playerIndex].x;
      y = players[playerIndex].y + players[playerIndex].wei;
    }
    else{
      x = players[playerIndex].x + players[playerIndex].wei - bulletSize;
      y = players[playerIndex].y + players[playerIndex].wei;
    }
    damage = weapons[players[playerIndex].weaponNumber].damage;
  }
  
  void show(){
    line(x,y,x+bulletSize,y);
  }
  
  void move(){
    x+=speed;
    if(x>=800||x<=0){
      visible=false;
    }
    
    //check hits the player
    for(int i=0;i<playersAmount;i++){
      /*if(x+bulletSize/2.0 >= players[i].x &&  x+bulletSize/2.0 <= players[i].x+collisionSize &&
         y >= players[i].y && y <= players[i].y+collisionSize*2.0)*/
       if(switchHurt){
         if(collision(x, y, bulletSize, 0.1, players[i].x, players[i].y, players[i].wei, players[i].hei)){
           players[i].hp -= damage;
           //after damage the player the bullet become invalid
           switchHurt = false;
         }
       }
    }
    
    //check hits the barrier
    for(int i=0;i<50;i++){
      
      if(/*x >= barriers[i].left &&  x <= barriers[i].right &&
          y >= barriers[i].top && y <= barriers[i].bottom*/
          collision(x, y, bulletSize, 0.1, barriers[i].x, barriers[i].y, barriers[i].wei, barriers[i].hei)){
       visible = false;
      }
      
    }
  }

  float x,y,speed,damage,gun;
  boolean visible = false, switchHurt = true;
}


class Barriers{
  void drawBarrier(float x, float y, float wei, float hei){
    //draw
    //fill(200,205,0);
    //rect(x,y,wei,hei);
    image(platform,x,y,wei,hei);
    
    this.x=x;
    this.y=y;
    this.wei=wei;
    this.hei=hei;
    
    //set the edges of Barrier
    top = y;
    bottom = y+hei;
    left = x;
    right = x+wei;
  }
  float top,bottom,left,right;
  float x,y,wei,hei;
}


class Weapon{
  Weapon(){
    //img = loadImage(null);
    damage = 0;
    maxBullets = bullets = 0;
    ;
    coolDownTime = 0.0;
  }
  
  void coolDown(){
    currentTime = millis()/1000.0;
    if(switchFire) startTime = currentTime;
    switchFire = false;
    if(currentTime - startTime >= coolDownTime) switchFire = true;
  }
  
  void showItem(float x, float y){
    if(isItem){
      //image(img,x,y);
      rect(x,y,30,30);
      for(int i=0;i<playersAmount;i++){
        if (collision(players[i].x, players[i].y, players[i].wei, players[i].hei, x, y, size, size)){
          isItem = false;
          players[i].setWeapon(number);
        }
      }
    }
  }
  
  void fire(int playerIndex){
    //check if it can shoot
    if(switchFire && bullets>0){
      
      players[playerIndex].isFiring = true;
      
      //control the global bulletIndex 
      if(players[playerIndex].isLeft) bulletLeftCounter++;
      else bulletRightCounter++;
      
      //over the max bulletAmount back to 0
      if(bulletLeftCounter>=bulletLeftAmount) bulletLeftCounter=0;
      if(bulletRightCounter>=bulletRightAmount) bulletRightCounter=0;
      
      //set the left bullet
      if(players[playerIndex].isLeft){
        bulletsLeft[bulletLeftCounter].setPosition(playerIndex);
        bulletsLeft[bulletLeftCounter].visible=true;
      }
      
      //set the right bullet
      else{
        bulletsRight[bulletRightCounter].setPosition(playerIndex);
        bulletsRight[bulletRightCounter].visible=true;
      }
      
      //substract the bullet from the gun
      bullets--;

    }
    //cooldown for shooting
    coolDown();
  }
    
  int damage, bullets, number, maxBullets;
  float coolDownTime;
  float x ,y, size = weaponItemSize;
  float startTime,currentTime;
  boolean switchFire = true, isItem = true;
  PImage img;
}


class SmallGun extends Weapon{
  SmallGun(){
    damage = 8;
    maxBullets = bullets = 12;
    coolDownTime = 0.5;
  }
  void showItem(float x, float y){
    if(isItem){
      //image(img,x,y);
      rect(x,y,30,30);
      for(int i=0;i<playersAmount;i++){
        if (collision(players[i].x, players[i].y, players[i].wei, players[i].hei, x, y, size, size)){
          isItem = false;
          players[i].setWeapon(number);
          
          players[i].jumpingL = pistolJumpingL;
          players[i].jumpingR = pistolJumpingR;
          players[i].movingL = pistolMovingL;
          players[i].movingR = pistolMovingR;
          players[i].standingL = pistolStandingL;
          players[i].standingR = pistolStandingR;
          players[i].firingL = pistolFiringL;
          players[i].firingR = pistolFiringR;
        }
      }
    }
  }
}

class Ak extends Weapon{
  Ak(){
    damage = 10;
    maxBullets = bullets = 30;
    coolDownTime = 0.1;
  }
  
  void showItem(float x, float y){
    if(isItem){
      //image(img,x,y);
      rect(x,y,30,30);
      for(int i=0;i<playersAmount;i++){
        if (collision(players[i].x, players[i].y, players[i].wei, players[i].hei, x, y, size, size)){
          isItem = false;
          players[i].setWeapon(number);
          
          players[i].jumpingL = akJumpingL;
          players[i].jumpingR = akJumpingR;
          players[i].movingL = akMovingL;
          players[i].movingR = akMovingR;
          players[i].standingL = akStandingL;
          players[i].standingR = akStandingR;
          players[i].firingL = akFiringL;
          players[i].firingR = akFiringR;
        }
      }
    }
  }
  
}

class MachineGun extends Weapon{
  MachineGun(){
    damage = 7;
    maxBullets = bullets = 75;
    coolDownTime = 0.06;
  }
  
  void showItem(float x, float y){
    if(isItem){
      //image(img,x,y);
      rect(x,y,30,30);
      for(int i=0;i<playersAmount;i++){
        if (collision(players[i].x, players[i].y, players[i].wei, players[i].hei, x, y, size, size)){
          isItem = false;
          players[i].setWeapon(number);
          
          players[i].jumpingL = machineGunJumpingL;
          players[i].jumpingR = machineGunJumpingR;
          players[i].movingL = machineGunMovingL;
          players[i].movingR = machineGunMovingR;
          players[i].standingL = machineGunStandingL;
          players[i].standingR = machineGunStandingR;
          players[i].firingL = machineGunFiringL;
          players[i].firingR = machineGunFiringR;
        }
      }
    }
  }
  
}

// Class for animating a sequence of pictures
class Animation {
  
  Animation(String imagePrefix, int count, float animationFrameRate) {
    imageCount = count;
    images = new PImage[imageCount];
    frame = -1;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
    
    coolDownTime = animationFrameRate;
  }
  
  void display(float xpos, float ypos) {
    if(switchNextFrame){
      frame = (frame+1) % imageCount;
    }
    image(images[frame], xpos, ypos);
    coolDown();
  }

  void display(float xpos, float ypos, float wei, float hei) {
    if(switchNextFrame){
      frame = (frame+1) % imageCount;
    }
    image(images[frame], xpos, ypos, wei, hei);
    coolDown();
  }
  
  void coolDown(){
    currentTime = millis()/1000.0;
    if(switchNextFrame) startTime = currentTime;
    switchNextFrame = false;
    
    if(currentTime - startTime >= coolDownTime) switchNextFrame = true;
  }
  
  void coolDownReset(){
    switchNextFrame = true;
    frame = -1;
  }
  
  int getWidth() {
    return images[0].width;
  }
  
  PImage[] images;
  int imageCount;
  int frame;
  float currentTime, startTime, coolDownTime;
  boolean switchNextFrame = true;
  
}