Happy Halloween!
这是一个粒子引力系统。当你用鼠标点击滑动时，就会出现新的粒子，被原来系统的中心所吸引做高速圆周运动，其速度与其所处半径成正比。点击滑动，就会呈现可爱酷炫的万圣节跳跳糖！
```
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
```

https://user-images.githubusercontent.com/91180371/139592462-5b49e58f-71d4-4b31-b459-b2fe820900ce.mp4


https://user-images.githubusercontent.com/91180371/139592577-971f7546-e6ee-46aa-a388-784747be485c.mp4


上面是有圆有方有三角的，以下是纯粹的圆


https://user-images.githubusercontent.com/91180371/139592704-583ccee8-8798-420d-9e40-62e8c3dca0fe.mp4



https://user-images.githubusercontent.com/91180371/139592801-7dde0ed1-b9ce-4a8d-b257-63053e61b382.mp4




