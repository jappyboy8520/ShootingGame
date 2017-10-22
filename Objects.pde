int bulletLeftCounter = 0;
int bulletRightCounter = 0;


class Bullet{
  Bullet(boolean L){
    if(L)speed = -25;
    else speed = 25;
    
    x=0;
    y=0;     
  }

  void setPosition(int playerIndex){
    x=players[playerIndex].x;
    y=players[playerIndex].y + players[playerIndex].size*2/3;
  }
  
  void show(){
    line(x,y,x+20,y);
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

class ObjectManager{
  void generateBar(){
    rect(100,400,100,100);
    barrier[0].setPosition(100,400,100,100);
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