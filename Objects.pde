int bulletLeftCounter = 0;
int bulletRightCounter = 0;
int barrierCounter = 0;

class Bullet{
  Bullet(boolean L){
    if(L)speed = -25;
    else speed = 25;
    
    x=0;
    y=0;     
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

  }
  
  void show(){
    line(x,y,x+10,y);
  }
  
  void move(){
    x+=speed;
    if(x>=800||x<=0){
      visible=false;
    }
  }

  float x,y,speed;
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