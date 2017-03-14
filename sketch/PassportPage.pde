import controlP5.*;

class PassportPage {
  ControlP5 cp5;
  boolean _isActive = false;
  PFont font;
  Textlabel _label;

  PassportPage(PApplet thePApplet) {
    cp5 = new ControlP5(thePApplet);
    font = createFont("Early-GameBoy.ttf", 32);
  }

  void display() { 
    background(0);
    //create passport page
    _label = cp5.addTextlabel("label")
      .setText("A single ControlP5 textlabel, in yellow.")
      .setPosition(100, 50)
      .setColorValue(0xffffff00)
      .setFont(font);
  }

  void hide() {
    _label.setVisible(false);
  }

  boolean isActive() {
    return _isActive;
  }
}