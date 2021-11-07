Button button1,button2;
ArrayList<Obj>objs=new ArrayList<Obj>();
int mode=1;
float R,maxR;
float t=0;
float nt=0;
float nR=0;
float nTheta=1000;
float x,y;
int i,j=0;
color[] color1={#80FFE4E1,#80FFDAB9,#4DFA8072, #4D9370DB,  #4DFF7F50 ,#80E6E6FA};
float dx,dy,lastX=0,lastY,dis,x0,y0,sc=2,check;
float l=2;
void setup(){
  size(2000,1600);
  background(   #F0F8FF);
  maxR=max(width,height)*0.45;
  color cc = color(random(255), random(255), random(255));
  button1=new Button(50,50,50,20,cc);
  button2=new Button(50,80,50,20,cc);

  frameRate(100);
}
void draw(){
  button1.showButton();
  button2.showButton();
  textSize(15);
  fill(255);
  text("flow",75,65);
  text("spray",75,95);
  if(button1.press) mode=1;
  else if(button2.press) mode=2;
  button1.press=false;
  button2.press=false;
  if((mode==1)&&!(mouseX<=100&&mouseX>=50&&mouseY>=50&&mouseY<=70)&&!(mouseX<=100&&mouseX>=50&&mouseY>=80&&mouseY<=100)){
    R = map(noise(nt * 0.01, nR), 0, 1, 0, maxR);
    t = map(noise(nt * 0.001, nTheta), 0, 1, -360, 360);
    x = R * cos(t) + width / 2;
    y = R * sin(t) + height / 2;
    //objs.add(new Obj(x,y));
  
    if(mousePressed){
      objs.add(new Obj(mouseX,mouseY));
    }
  
    for(i=0;i<objs.size();++i){
      objs.get(i).move();
      objs.get(i).display();
    }
  
    for(j=objs.size()-1;j>=0;--j){
      if(objs.get(j).isFinished()){
        objs.remove(j);
      }
    }
    nt++;
  }
  else if(mode==2&&!(mouseX<=100&&mouseX>=50&&mouseY>=50&&mouseY<=70)&&!(mouseX<=100&&mouseX>=50&&mouseY>=80&&mouseY<=100)){
    if(mousePressed){
      dx=mouseX-lastX;
      dy=mouseY-lastY;
      dis =sqrt(dx*dx+dy*dy);
      x0=50*sc/(dis+2)*random(1,1.3);
      y0=50*sc/(dis+2)*random(1,1.3);
      noStroke();
  
      color col= color(random(75,185),random(25,150),random(125,255),random(25,150));
  
      if (lastX == 0)
      {
        noStroke();
        fill(col);
        ellipse(mouseX, mouseY, x0, y0);
        
        check = 1;
      }
      else
      {
        //if ((dis>2*l))
        //{
        //  noStroke();
        //  fill(col);
        //  ellipse(mouseX, mouseY, x0, y0);
          
        //  check = 1;
        //}
        //else if ((dis>l/2)&&(dis<2*l))
        //{
          noStroke();
          fill(col);
          ellipse(mouseX-lastX/random(5,10), mouseY, x0, y0);
          ellipse(mouseX-lastX/random(5,10), mouseY-lastY/random(5,10), x0, y0);
  
          check = 1;
        //}
      }
      if(check ==1)
      {     
        lastX = mouseX;
        lastY= mouseY;
      }
    }
  }
}
