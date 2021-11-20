class Block{
  float posX,posY;
  float min,max;
  float blockWidth,blockHeight;
  float circleX,circleY;
  float value=(min+max)/2;
  
  Block(float x,float y,float min_,float max_,float w,float h){
    posX=x;
    posY=y;
    min=min_;
    max=max_;
    blockWidth=w;
    blockHeight=h;
    circleX=posX+blockWidth/2;
    circleY=posY+blockHeight/2;
  }
  
  boolean hover(){
    if(mouseX<posX+blockWidth&&mouseX>posX && mouseY<posY+blockHeight && mouseY>posY)
      return true;
    else
      return false;
  }
  
  void showBlock(){
    if(mousePressed&&hover()){
      circleX=mouseX;
      //value=(circleX-posX)/blockWidth*(max-min)+min;
    }
    value=(circleX-posX)/blockWidth*(max-min)+min;
    fill(0);
    rect(posX,posY+blockHeight/4,blockWidth,blockHeight/2);
    fill(255);
    circle(circleX,circleY,8);
  }
}
