### 作业要求

- 熟悉processing中提供的绘图函数；
- 分析理解彼埃·蒙德里安的作品风格和构图规则，创作类似彼埃·蒙德里安风格的作品，利用processing中提供的绘图函数进行创作实现。

✏️简单描述你的创意内容，将程序运行结果附在这里。

对每行每列循环，让后再对其中一些矩形经行循环分割成更小的矩形，达到临摹蒙德里安的效果。随机黑白灰，其中对于黑色的矩形有大小要求。点击画面随机生成蒙德里安临摹画。!
```
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
```
![微信图片_20211023214351](https://user-images.githubusercontent.com/91180371/138559174-7967fa02-dfb8-47b9-9c24-b4185326809d.png)
![微信图片_20211023214419](https://user-images.githubusercontent.com/91180371/138559177-3d35ef90-ef47-4cde-b871-b0537a46bc02.jpg)
![微信图片_20211023214429](https://user-images.githubusercontent.com/91180371/138559180-22c034cf-a2ef-4375-b2a6-6a6df6bdd83b.jpg)
