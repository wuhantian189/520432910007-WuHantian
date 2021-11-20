class Button {
  float posX, posY;
  float buttonWidth, buttonHeight;
  color buttonColor;
  boolean press;
  String nameofButton;

  Button(float x, float y, float w, float h, color c,String s) {
    posX = x;
    posY = y;
    buttonWidth = w;
    buttonHeight = h;
    buttonColor = c;
    nameofButton=s;
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
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text(nameofButton,posX+buttonWidth/2,posY+buttonHeight/2);
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
