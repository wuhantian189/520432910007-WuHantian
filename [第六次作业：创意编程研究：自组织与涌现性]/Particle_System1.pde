ArrayList<Particle>particles=new ArrayList<Particle>();
int i=0,j=0;
float distanceX,distanceY,distance;
float force;
float accelerationX,accelerationY;
color[] color1={#FFE4E1,#FFDAB9,#FA8072,#9370DB,#FF7F50,#E6E6FA};

void setup(){
  size(2000,1600);
  noStroke();
  particles.add(new Particle(1000,800));
}

void draw(){
  background(0);
  if(mousePressed){
    particles.add(new Particle(mouseX,mouseY));
  }
  for(i=0;i<=particles.size()-1;++i){
    accelerationX=0;accelerationY=0;
    for(j=0;j<=particles.size()-1;++j){
      if(i!=j){
        distanceX=particles.get(j).positionX-particles.get(i).positionX;
        distanceY=particles.get(j).positionY-particles.get(i).positionY;
        distance = sqrt(distanceX * distanceX + distanceY * distanceY);
        if (distance < 1) distance = 1;
        force=(distance-320)*particles.get(j).mass/distance;
        accelerationX += force * distanceX;
        accelerationY += force * distanceY;
      }
    }
    particles.get(i).velocityX=particles.get(i).velocityX*0.995+accelerationX*particles.get(i).mass;
    particles.get(i).velocityY=particles.get(i).velocityY*0.995+accelerationY*particles.get(i).mass;
  }
  
  for(i=0;i<=particles.size()-1;++i){
    particles.get(i).positionX+=particles.get(i).velocityX;
    particles.get(i).positionY+=particles.get(i).velocityY;
    if(particles.get(i).type==0){
      fill(particles.get(i).colorofParticle);
      ellipse(particles.get(i).positionX,particles.get(i).positionY,particles.get(i).mass*1000,particles.get(i).mass*1000);
    }
    else if(particles.get(i).type==1){
      fill(particles.get(i).colorofParticle);
      rect(particles.get(i).positionX,particles.get(i).positionY,particles.get(i).mass*1000,particles.get(i).mass*1000);
    }
    else{
      fill(particles.get(i).colorofParticle);
      triangle(particles.get(i).positionX,particles.get(i).positionY+particles.get(i).mass*500,particles.get(i).positionX-particles.get(i).mass*500,particles.get(i).positionY-particles.get(i).mass*300,particles.get(i).positionX+particles.get(i).mass*500,particles.get(i).positionY-particles.get(i).mass*300);
    }
  }
}
