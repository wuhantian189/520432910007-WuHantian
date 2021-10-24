### 作业要求

- 熟悉processing中提供的绘图函数；
- 自行设计构形规则，利用processing中提供的绘图函数进行造型图案创作。

✏️简单描述你的创意内容，将程序运行结果附在这里。
移动鼠标，会生成以鼠标位置为半径的椭圆，进行循环。不停移动鼠标，会出现一闪一闪的动态效果。颜色也选用接近的，不同明暗度的颜色。
```
void setup(){
  size(1000,800);
  background(0);
  colorMode(HSB,360,100,100);
  frameRate(15);
}

void draw(){
    for(int y=0;y<=height;y+=40){
  for(int x=0;x<=width;x+=60){ 
    fill(random(30,50),random(55,75),random(70,90));
    ellipse(x,y,random (mouseX)/6,random (mouseY)/5);
  }
  }
}
```
![微信图片_20211024173649](https://user-images.githubusercontent.com/91180371/138588508-640e9671-146e-410f-8104-322fe42308db.png)

第二个作品和第一个类似，将圆改成长方形，会有舞动的长方形。
```
void setup(){
  size(1000,800);
  background(0);
  colorMode(HSB,360,100,100);
  frameRate(20);
}

void draw(){
    for(int y=0;y<=height;y+=40){
    for(int x=0;x<=width;x+=60){ 
    fill(random(180,200),random(60,80),random(70,90));
    rect(x,0,random (mouseX)/3,height );
  }
  }
}
```
![微信图片_20211024174129](https://user-images.githubusercontent.com/91180371/138588668-54af40b4-133d-43e8-b2ee-1e041bf9c575.png)
![微信图片_20211024174132](https://user-images.githubusercontent.com/91180371/138588669-0af60050-3c74-4c1e-b532-0d5366e1b925.png)


