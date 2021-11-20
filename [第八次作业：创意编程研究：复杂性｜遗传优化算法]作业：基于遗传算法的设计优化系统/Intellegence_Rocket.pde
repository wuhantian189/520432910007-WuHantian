int lifetime;
int lifeCounter;
Population population;
PVector target;

void setup(){
  size(800,400);
  smooth();
  
  lifetime=400;
  lifeCounter=0;
  target=new PVector(width/2,24);
  population=new Population(0.01,50);
  frameRate(100);
}

void draw(){
  background(0);
  
  fill(255,99,71);
  ellipse(target.x,target.y,24,24);
  fill(72,209,204);
  ellipse(width/2,400,100,100);
  
  if(lifeCounter<lifetime){
    population.live();
    ++lifeCounter;
  }
  else{
    lifeCounter=0;
    population.fitness();
    population.selection();
    population.reproduction();
  }
  
  fill(0);
  text("child#:"+population.getGenerations(),10,18);
  text("round:"+(lifetime-lifeCounter),10,36);
}

void mousePressed(){
  target.x=mouseX;
  target.y=mouseY;
}
