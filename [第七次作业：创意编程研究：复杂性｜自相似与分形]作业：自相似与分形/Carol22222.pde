

//------------------------------------

import processing.pdf.*;

 
 
 
boolean record;
boolean isStopped=false;

//ArrayList<Obj>objs=new ArrayList<Obj>();
//float R,maxR;
//float t=0;
//float nt=0;
//float nR=0;
//float nTheta=1000;
//float x,y;
//int i,j=0;
color[] color1={#80FFE4E1,#80FFDAB9,#4DFA8072, #4D9370DB,  #4DFF7F50 ,#80E6E6FA};
float[] pX, pY;
float startRadius = 10;
int maxP = 6000;
int pCount = 3;
float pSize = 7;
int stickDist = 6;

//----------------------------------
  
void setup() {
  size(2000,2000,JAVA2D);
  background(20);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  colorMode(HSB);
  strokeWeight(8);
  smooth();
  
  
  pX = new float[maxP];
  pY = new float[maxP];
  
  pX[0] = 0;
  pY[0] = 0;
  beginRecord(PDF, "everything.pdf");
}
  
//---------------------------------


void draw() {
  if(isStopped);
  else{
    // declaring these here to save some overhead in inner loops
    float arrayDist, arraySize;
    float maxJumpDist = width;
    int closestElement = 0;
    
    translate(width/2,height/2);
    
    // spawn a fresh p
    float theta = random(TWO_PI);
    float newElementX=startRadius*sin(theta);
    float newElementY=startRadius*cos(theta);
    
    // loop until we've plotted a new p
    while (true) {
      // find the max dist from the array and the closest element
      for (int i=0; i<pCount; i++) {
        arrayDist = dist(pX[i],pY[i],newElementX,newElementY);
        if (arrayDist<maxJumpDist) {
          maxJumpDist = arrayDist;
          closestElement = i;
        }
      }
    
      // is the p close enough to stick?
      if (maxJumpDist<=stickDist) {
        // if so, work out where to plot it
        theta = atan2(newElementY-pY[closestElement], newElementX-pX[closestElement]);
        pX[pCount] = pX[closestElement] + pSize*cos(theta);
        pY[pCount] = pY[closestElement] + pSize*sin(theta);
        // draw that sucka
        stroke(((float)pCount/maxP)*255,120,255,200);
        line(pX[pCount],pY[pCount],pX[closestElement],pY[closestElement]);
        // adjust our p start radius, increment and either stop or bust outta here
        for (int i=0; i<pCount; i++) {
          arraySize = dist(pX[i],pY[i],0,0);
          if (arraySize>startRadius) {
            startRadius = arraySize;
          }
        }
        pCount++;
        if (pCount == maxP) {
          noLoop();
        }
        break;
      }
    
      // move p
      theta = random(TWO_PI);
      newElementX+=random(maxJumpDist)*sin(theta);
      newElementY+=random(maxJumpDist)*cos(theta);
      if (dist(0,0,newElementX,newElementY)>startRadius*2) {
        newElementX=startRadius*sin(theta);
        newElementY=startRadius*cos(theta);
        
 
      }
    }
  }
}



//----------------------------------------
  
void mousePressed() {
  background(20);
  pCount=1;
  loop();
}

//----------------------------------------
 
//void keyPressed() {
//  if (key == 'q') {
//  endRecord();
//  exit();
//  }
//}

void keyPressed(){
  if(key=='q'){
    if(isStopped)isStopped=false;
    else isStopped=true;
  }
 
}
