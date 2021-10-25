创建您自己的定制设计软件。

### 作业要求

- 至少有两个功能按钮，这些按钮的具体功能（如画笔样式、颜色、动作等）请自行设定；
- 利用这个工具绘制并导出一个美观的示例草图
- 通过readme.md说明这个定制设计软件的功能和使用方法。

✏️使用readme.md进行作业介绍与说明，可通过图文等形式丰富readme.md中的内容

两个按钮，第一个按钮实现流体化笔刷；第二个按钮实现喷漆样的笔刷。流体样笔刷是由构成，每一笔会生长出分支，分支上圆的大小和其寿命成映射关系。喷漆样笔刷是每一次刷新生成两个圆两个圆的大小与笔刷移动距离相关。

```
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

class Button {
  float posX, posY;
  float buttonWidth, buttonHeight;
  color buttonColor;
  boolean press;

  Button(float x, float y, float w, float h, color c) {
    posX = x;
    posY = y;
    buttonWidth = w;
    buttonHeight = h;
    buttonColor = c;
  }

  void showButton() {
    if (hover()) {
      stroke(0);
      strokeWeight(2);
    } 
    else {
      noStroke();
    }
    if (mousePressed && hover()) {
      press = true;
      fill(buttonColor, 100);
    } 
    else {
      fill(buttonColor);
    }
    rect(posX, posY, buttonWidth, buttonHeight);
  }

  boolean hover() {
    if (mouseX < posX + buttonWidth && mouseX > posX &&
      mouseY < posY + buttonHeight && mouseY > posY) {
      return true;
    } else {
      return false;
    }
  }
}
```
![微信图片_20211024171937](https://user-images.githubusercontent.com/91180371/138588053-4fd3d0e9-9334-48de-9289-85246811e9d0.png)
![微信图片_20211024171948](https://user-images.githubusercontent.com/91180371/138588057-7ef64f4a-706e-449a-964c-d7b375020358.png)
![微信图片_20211024172000](https://user-images.githubusercontent.com/91180371/138588061-60cb71ee-4faf-4237-97ea-289cb0b0a4ef.png)

