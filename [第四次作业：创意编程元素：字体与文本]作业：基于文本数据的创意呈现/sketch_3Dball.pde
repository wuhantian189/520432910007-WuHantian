

Ball b;
float r, startAngle, angleVelocity;

void setup(){
 colorMode(HSB,360,100,100);
 fullScreen(P3D);
 b= new Ball(width/2,height/2,500);
}

void draw(){
  background(0);
  b.update();
  b.display();
}
