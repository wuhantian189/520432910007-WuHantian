class Obj{
  float velx,vely;
  float posx,posy;
  float t,lifeMax,life,step,dMax,d;
  float noiseScale=0.01;
  color c;
  
  Obj(float ox,float oy){
    velx=0;vely=0;
    posx=ox;posy=oy;
    t=random(0,noiseScale);
    lifeMax=random(60,100);
    life=lifeMax;
    step=random(0.1,0.5);
    dMax=50;
    d=dMax;  
    c=color(color1[int(random(color1.length))]);
  }
  
  void move (){
    float theta=map(noise(posx*noiseScale,posy*noiseScale,t),0,1,-360,360);
    velx=1*cos(radians(theta));
    vely=1*sin(radians(theta));
    posx=posx+velx;
    posy=posy+vely;
  }
  
  boolean isFinished(){
    life=life-step;
    d=map(life,0,lifeMax,0,dMax);
    if(life<0){
      return true;
    }
    else {
      return false;
    }
  }
  
  void display(){
    fill(c);
    noStroke();
    circle(posx,posy,d);
  }
  
}
