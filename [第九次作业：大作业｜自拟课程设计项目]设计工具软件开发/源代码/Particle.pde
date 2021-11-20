class Particle{
  float posX,posY;
  float velX,velY;
  float mass;
  float t;
  color colorofParticle;
  float noiseScale=0.01;
  float d;
  
  Particle(float ox,float oy){
    velX=0;velY=0;
    posX=ox;posY=oy;
    mass=random(0.003,0.03);
    t=random(0,noiseScale);
    colorofParticle=color(color1[int(random(color1.length))]);
    d=sizeofParticleMin+random(sizeofParticleMax-sizeofParticleMin);
  }
  
  void display(){
    fill(colorofParticle);
    noStroke();
    circle(posX,posY,d);
  }
  
  void move(){
    float theta=map(noise(posX*noiseScale,posY*noiseScale,t),0,1,-360,360);
    float vel=random(0,5);
    velX=vel*cos(radians(theta));
    velY=vel*sin(radians(theta));
    posX+=velX;
    posY+=velY;
    if(posX>displayWidth)posX-=displayWidth;
    if(posX<0)posX+=displayWidth;
    if(posY>displayHeight)posX-=displayHeight;
    if(posY<0)posX+=displayHeight;
  }
  
  void moveInteract(){
    posX+=velX;
    posY+=velY;
  }
}
