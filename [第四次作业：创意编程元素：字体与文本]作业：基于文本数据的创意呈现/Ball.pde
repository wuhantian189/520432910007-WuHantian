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
