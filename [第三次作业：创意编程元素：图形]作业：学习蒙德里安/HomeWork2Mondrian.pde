float rowSize = 0;
float colSize = 0;
float rowSize0 = 0;

color[] colors = { #ffffff, #808080};
color[] colors0 = { #ffffff,#808080,#000000};


void mondrianStyle(){
   for(int row=0; row< height; row += rowSize + 4){
     rowSize = random(50, height/2);
     for(int col=0; col< width; col += colSize + 4){
       colSize = random(50, width/2);
     
      color rectColor = colors[int(random(colors.length))];
       fill(rectColor);
       rect(col, row, colSize, rowSize);
       strokeWeight(4);
       stroke(0); 
       
//separate the column again:
     for(int row0=row; row0<= (row+rowSize); row0 += rowSize0 + 4){
          rowSize0 = random(rowSize/4, rowSize);
          if ( 400 > rowSize && rowSize > 125  && colSize> 125 && 400 > colSize){
            if( rowSize0<300 && colSize< 300){
          color rectColor0 = colors0[int(random(colors0.length))];
       fill(rectColor0);
       }
       rect(col, row0, colSize, rowSize0);
          
 //drawing black lines      
       strokeWeight(4);
       stroke(0); 
       float x = col+colSize;
      float y = row+rowSize;
      line(0, y, width, y);
      line(x, row, x, y);
          }
     }
      
   }
}
}

void setup(){
  size(1000,800);
  background(255); 
  mondrianStyle();
}

void draw() {
  if (mousePressed){
        mondrianStyle();
  }
//Regenerate when the mouse is clicked
}
