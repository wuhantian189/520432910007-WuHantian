### 作业要求
#### 1.选择一段文本，根据你的创意进行演绎规则的设计，实现对文本内容的图形化呈现。
#### 2.通过网站检索文本可视化项目，从中找出你所喜欢的作品，形式不限，可以是海报、动画、交互媒体和装置。归纳一些应用文字创作图形作品的方法和思路，并进行案例整理，具体包括：

- 项目名称
- 作者/艺术家名称
- 来源/出处（URL等）
- 概要描述（文字描述）
- 截图/视频素材

✏️简单描述你的创意内容，将程序运行结果附在这里。
设计一个3D的球体，将文字内容附在球体的不同位置上，进行球体转动效果。
```
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

class Ball{

  PVector location;
  float r, startAngle, angleVelocity;

  Ball(float x,float y, float _r){
    location = new PVector(x,y,-_r);
    r=_r;
    startAngle = 0;
    angleVelocity = -0.1;
  }

  void display() {
    translate(location.x, location.y, location.z);
    textSize(40);
    textAlign(CENTER);

    float step = 10;
    float offset = step / 4;// 
    for (int i = 0; i < 360; i+=step) {
      offset *= -1;
      for (int j = -90; j < 90; j+=step) {
        float theta1 = radians(i + startAngle), theta2 = radians(j + offset);
        float x = r * cos(theta2) * cos(theta1);
        float y = r * sin(theta2);
        float z = r * cos(theta2) * sin(theta1);
        if (z > 0)
          fill(random(0,255),random(0,255),random(0,255));
          text("globe", x, y, z);
      }
    }
  }

  void update () {
    startAngle += angleVelocity;
  }
}
```
![微信图片_20211024174739](https://user-images.githubusercontent.com/91180371/138588915-ad918950-a7b0-45d2-8784-e323a1063d76.png)
