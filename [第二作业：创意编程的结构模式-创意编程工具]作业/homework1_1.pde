void setup(){
  size(1000,800);
  background(0);
  colorMode(HSB,360,100,100);
  frameRate(15);
}

void draw(){
    for(int y=0;y<=height;y+=40){
  for(int x=0;x<=width;x+=60){ 
    fill(random(30,50),random(55,75),random(70,90),200);
    ellipse(x,y,random (mouseX)/6,random (mouseY)/5);
  }
  }
}
