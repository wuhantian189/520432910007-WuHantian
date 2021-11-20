class flowObj{
  float velX,velY;
  float posX,posY;
  float t;
  float lifeMax,life;
  float step;//流体画粒子衰减的速度
  float dMax,d;
  float noiseScale=0.01;
  color c;
  
  flowObj(float ox,float oy,float d_){
    velX=0;velY=0;
    posX=ox;posY=oy;
    t=random(0,noiseScale);
    lifeMax=random(60,100);
    life=lifeMax;
    step=random(0.1,0.5);
    dMax=d_;
    d=dMax;
    c=color(color1[int(random(color1.length))]);
  }
  
  void move(){
    float theta=map(noise(posX*noiseScale,posY*noiseScale,t),0,1,-360,360);
    velX=1*cos(radians(theta));
    velY=1*sin(radians(theta));
    posX+=velX;
    posY+=velY;
  }
  
  boolean isFinished(){
    life-=step;
    d=map(life,0,lifeMax,0,dMax);
    if(life<0) return true;
    else return false;
  }
  
  void display(){
    fill(c);
    noStroke();
    circle(posX,posY,d);
  }
}
