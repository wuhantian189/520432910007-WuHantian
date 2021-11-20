ArrayList<flowObj>flowobjs=new ArrayList<flowObj>();
ArrayList<Particle>particles=new ArrayList<Particle>();
color[] color1={#FFE4E1,#FFDAB9,#FA8072,#9370DB};
Button letParticleFlow,createParticle,letParticleInteract,clean,Bubble;
Block ParticleMin,ParticleMax,firstColorR,firstColorG,firstColorB,secondColorR,secondColorG,secondColorB,thirdColorR,thirdColorG,thirdColorB,forthColorR,forthColorG,forthColorB;
float sizeofParticleMin=10,sizeofParticleMax=30;
//粒子相互作用运动时所需要用到的加速度，粒子间距离，力的大小；
float accelerationX,accelerationY,distanceX,distanceY,distance,force;
int mode=1;
int i,j=0;
boolean changeFromCreateToFlow=false;

void setup(){
  size(displayWidth,displayHeight);
  background(   #F0F8FF);
  color cc = color(random(255), random(255), random(255));
  letParticleFlow=new Button(50,50,120,20,cc,"letParticleFlow");
  createParticle=new Button(50,80,120,20,cc,"createParticle");
  letParticleInteract=new Button(50,110,120,20,cc,"letParticleInteract");
  clean=new Button(50,170,120,20,cc,"clean");
  Bubble=new Button(50,140,120,20,cc,"Bubble");
  ParticleMin=new Block(50,200,5,20,120,20);
  ParticleMax=new Block(50,230,25,50,120,20);
  firstColorR=new Block(50,300,0,255,120,20);
  firstColorG=new Block(50,330,0,255,120,20);
  firstColorB=new Block(50,360,0,255,120,20);
  secondColorR=new Block(50,410,0,255,120,20);
  secondColorG=new Block(50,440,0,255,120,20);
  secondColorB=new Block(50,470,0,255,120,20);
  thirdColorR=new Block(50,520,0,255,120,20);
  thirdColorG=new Block(50,550,0,255,120,20);
  thirdColorB=new Block(50,580,0,255,120,20);
  forthColorR=new Block(50,630,0,255,120,20);
  forthColorG=new Block(50,660,0,255,120,20);
  forthColorB=new Block(50,690,0,255,120,20);
  
  //inputSizeOfParticle=new ControlP5(this);
  //inputSizeOfParticle.addTextfield("min").setPosition(110,200).setSize(120,30).setColor(color(255,0,0));
  //inputSizeOfParticle.addTextfield("max").setPosition(110,240).setSize(120,30).setColor(color(255,0,0));
}
void draw(){
  if(mode==1||mode==3||mode==4)background(   #F0F8FF);
  letParticleFlow.showButton();
  createParticle.showButton();
  letParticleInteract.showButton();
  clean.showButton();
  Bubble.showButton();
  noStroke();
  ParticleMin.showBlock();
  ParticleMax.showBlock();
  firstColorR.showBlock();
  firstColorG.showBlock();
  firstColorB.showBlock();
  secondColorR.showBlock();
  secondColorG.showBlock();
  secondColorB.showBlock();
  thirdColorR.showBlock();
  thirdColorG.showBlock();
  thirdColorB.showBlock();
  forthColorR.showBlock();
  forthColorG.showBlock();
  forthColorB.showBlock();
  fill(0);textSize(15);textAlign(CENTER);text("MinimumOfParticle",ParticleMin.posX+ParticleMin.blockWidth/2,ParticleMin.posY+ParticleMin.blockHeight*1.6);text("MaximumOfParticle",ParticleMax.posX+ParticleMax.blockWidth/2,ParticleMax.posY+ParticleMax.blockHeight*1.6);
  text("first color RGB:",110,290);text("R",40,313);text("G",40,343);text("B",40,373);text("second color RGB:",110,400);text("R",40,423);text("G",40,453);text("B",40,483);text("third color RGB:",110,510);text("R",40,533);text("G",40,563);text("B",40,593);text("forth color RGB:",110,620);text("R",40,643);text("G",40,673);text("B",40,703);
  sizeofParticleMin=ParticleMin.value;
  sizeofParticleMax=ParticleMax.value;
  color1[0]=color(int(firstColorR.value),int(firstColorG.value),int(firstColorB.value));
  color1[1]=color(int(secondColorR.value),int(secondColorB.value),int(secondColorG.value));
  color1[2]=color(int(thirdColorR.value),int(thirdColorG.value),int(thirdColorB.value));
  color1[3]=color(int(forthColorR.value),int(forthColorG.value),int(forthColorB.value));
  if(letParticleFlow.press){
    mode=2;
    changeFromCreateToFlow=true;
  }
  else if(createParticle.press)
    mode=1;
  else if(letParticleInteract.press)
    mode=3;
  else if(Bubble.press){
    mode=4;
    changeFromCreateToFlow=true;
  }
  letParticleFlow.press=false;
  createParticle.press=false;
  letParticleInteract.press=false;
  Bubble.press=false;
  
  //进入添加粒子模式
  if(mode==1){
    if(mousePressed&&(!isMouseOnButton())){
      particles.add(new Particle(mouseX,mouseY));
    }
    for(i=0;i<=particles.size()-1;++i){
      //particles.get(i).move();
      particles.get(i).display();
    }
  }
  
  //进入粒子流动模式
  else if(mode==2||mode==4){
    if(changeFromCreateToFlow){
      for(i=0;i<=particles.size()-1;++i){
        flowobjs.add(new flowObj(particles.get(i).posX,particles.get(i).posY,particles.get(i).d));
      }
    }
    
    if(mousePressed&&(!isMouseOnButton())){
      flowobjs.add(new flowObj(mouseX,mouseY,sizeofParticleMin+random(sizeofParticleMax-sizeofParticleMin)));
    }
    
    for(i=0;i<flowobjs.size();++i){
      flowobjs.get(i).move();
      flowobjs.get(i).display();
    }
    
    for(j=flowobjs.size()-1;j>=0;--j){
      if(flowobjs.get(j).isFinished()){
        flowobjs.remove(j);
      }
    }
  }
  
  //进入粒子相互作用运动模式
  else if(mode==3){
    if(mousePressed&&(!isMouseOnButton())){
      particles.add(new Particle(mouseX,mouseY));
    }
    
    for(i=0;i<=particles.size()-1;++i){
      accelerationX=0;accelerationY=0;
      for(j=0;j<=particles.size()-1;++j){
        if(i!=j){
          distanceX=particles.get(j).posX-particles.get(i).posX;
          distanceY=particles.get(j).posY-particles.get(i).posY;
          distance = sqrt(distanceX * distanceX + distanceY * distanceY);
          if (distance < 1) distance = 1;
          force=(distance-320)*particles.get(j).mass/distance;
          accelerationX += force * distanceX;
          accelerationY += force * distanceY;
        }
      }
      particles.get(i).velX=particles.get(i).velX*0.995+accelerationX*particles.get(i).mass;
      particles.get(i).velY=particles.get(i).velY*0.995+accelerationY*particles.get(i).mass;
    }
    
    for(i=0;i<=particles.size()-1;++i){
      particles.get(i).moveInteract();
      particles.get(i).display();
    }
  }
  
  changeFromCreateToFlow=false;
}

//判断鼠标是否放在了按钮上
boolean isMouseOnButton(){
  if(mouseX<=170&&mouseX>=50&&mouseY>=50&&mouseY<=710)
    return true;
  else 
    return false;
}

void mousePressed(){
  if(mouseX<=170&&mouseX>=50&&mouseY<=190&&mouseY>=170)
    for(i=0;i<=particles.size()-1;++i){
      particles.remove(i);
    }
}



void keyPressed(){
  if(key=='q'){
    save("output.png");
  }
}
