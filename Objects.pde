int bulletLeftCounter = 0;
int bulletRightCounter = 0;
int barrierCounter = 0;
float bulletSize = 10.0;
float bulletSpeed = 20.0;

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
    if(players[playerIndex].left){
      x=players[playerIndex].x-players[playerIndex].size*2;
      y=players[playerIndex].y + players[playerIndex].size;
    }
    else{
      x=players[playerIndex].x+players[playerIndex].size*2;
      y=players[playerIndex].y + players[playerIndex].size;
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
      if(x+bulletSize/2.0 >= players[i].x &&  x+bulletSize/2.0 <= players[i].x+collisionSize &&
         y >= players[i].y && y <= players[i].y+collisionSize*2.0){
        players[i].hp -= damage;
        //after damage the player the bullet become invalid
        switchHurt = false;
        if(players[i].hp <= 0) gameOver();
      }
      
    }
    
    //check hits the barrier
    for(int i=0;i<50;i++){
      
      if(x >= barriers[i].left &&  x <= barriers[i].right &&
          y >= barriers[i].top && y <= barriers[i].bottom){
       visible = false;
      }
       if(x >= barriers[i].left && x <= barriers[i].right &&
          y >= barriers[i].top && y <= barriers[i].bottom){
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
    fill(0,255,0);
    rect(x,y,wei,hei);
    //set the edges of Barrier
    top = y;
    bottom = y+hei;
    left = x;
    right = x+wei;
  }
  float top,bottom,left,right;
}

class Weapon{
  Weapon(){
    img = loadImage(null);
    damage = 0;
    bullets = 0;
    coolDown = 0.0;
  }
  
  void coolDown(){
    currentTime = millis()/1000.0;
    if(switchFire) startTime = currentTime;
    switchFire = false;
    if(currentTime - startTime >= coolDown) switchFire = true;
  }
  
  void drawWeapon(float x, float y){
    image(img,x,y);
    for(int i=0;i<playersAmount;i++){
      if (collision(players[i].x, players[i].y, players[i].size, players[i].size*2, x, y, size, size)){
        isItem = false;
        players[i].setWeapon(number);
      }
    }
  }
  
  int damage, bullets, number;
  float coolDown;
  float x ,y, size = 20.0;
  float startTime,currentTime;
  boolean switchFire = true, isItem = false;
  PImage img;
}

class SmallGun extends Weapon{
  SmallGun(){
    damage = 10;
    bullets = 7;
    coolDown = 0.5;
  }
}


class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, float wei, float hei) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, wei, hei);
  }
  
  int getWidth() {
    return images[0].width;
  }
}