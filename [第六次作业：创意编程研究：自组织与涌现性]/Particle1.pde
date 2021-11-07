class Particle{
  float positionX,positionY;
  float velocityX,velocityY;
  float mass;
  int type;
  color colorofParticle;
  
  Particle(float ox,float oy){
    velocityX=0;velocityY=0;
    positionX=ox;positionY=oy;
    mass=random(0.003,0.03);
    type=int(random(3));
    colorofParticle=color(color1[int(random(color1.length))]);
  }
}
