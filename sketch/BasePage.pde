import controlP5.*;

class BasePage {
  ControlP5 cp5;
  PFont font;
  boolean _isActive;

  BasePage(PApplet thePApplet) {
    _isActive = false;
    cp5 = new ControlP5(thePApplet);
    font = createFont("Early-GameBoy.ttf", 32);
  }
}