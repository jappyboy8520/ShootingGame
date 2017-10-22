int bulletLeftCounter = 0;
int bulletRightCounter = 0;
int barrierCounter = 0;

class Bullet{
  Bullet(boolean L){
    if(L)speed = -25.0;
    else speed = 25.0;
    
    x=0.0;
    y=0.0;     
  }

  void setPosition(int playerIndex){
    if(players[playerIndex].left){
      x=players[playerIndex].x-players[playerIndex].size*2;
      y=players[playerIndex].y + players[playerIndex].size;
    }
    else{
      x=players[playerIndex].x+players[playerIndex].size*2;
      y=players[playerIndex].y + players[playerIndex].size;
    }
    damage = players[playerIndex].damage;
  }
  
  void show(){
    line(x,y,x+10.0,y);
  }
  
  void move(){
    x+=speed;
    if(x>=800||x<=0){
      visible=false;
    }
    
    for(int i=0;i<playersMount;i++){
      
      if(x >= players[i].x &&  x <= players[i].x+collisionSize &&
         y >= players[i].y && y <= players[i].y+collisionSize*2){
        players[i].hp -= damage;
        if(players[i].hp <= 0) gameOver();
      }
      
    }
    for(int i=0;i<50;i++){
      
      if(x >= barrier[i].left &&  x <= barrier[i].right &&
          y >= barrier[i].top && y <= barrier[i].bottom){
       visible=false;
      }
       if(x >= barrier[i].left && x <= barrier[i].right &&
          y >= barrier[i].top && y <= barrier[i].bottom){
       visible=false;
      }
      
    }
  }

  float x,y,speed,damage;
  boolean visible=false;
}

class BarriersManager{
  void generateBar(int barrierIndex, float x, float y, float wei, float hei){
    fill(0,255,0);
    rect(x,y,wei,hei);
    barrier[barrierIndex].setPosition(x,y,wei,hei);
  }
}

class Barriers{
  void setPosition(float x, float y, float wei, float hei){
    top = y;
    bottom = y+hei;
    left = x;
    right = x+wei;
  }
  float top,bottom,left,right;
}

class Gun{
  Gun(){
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
  
  void drawGun(){
    
  }
  
  int damage,bullets;
  float coolDown;
  float startTime,currentTime;
  boolean switchFire = true;
}

class SmallGun extends Gun{
  SmallGun(){
    damage = 10;
    bullets = 7;
    coolDown = 0.5;
  }
}