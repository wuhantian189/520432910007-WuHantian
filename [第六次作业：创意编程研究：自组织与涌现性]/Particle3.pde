class Particle{
  float positionX,positionY;
  float velocityX,velocityY;
  float mass;
  color colorofParticle;
  
  Particle(float ox,float oy){
    velocityX=0;velocityY=0;
    positionX=ox;positionY=oy;
    mass=random(0.003,0.03);
    colorofParticle=color(color1[int(random(color1.length))]);
  }
}
