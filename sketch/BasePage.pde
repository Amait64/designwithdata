import controlP5.*;

class BasePage {
  ControlP5 cp5;
  PFont font;
  boolean isActive;

  BasePage(PApplet thePApplet) {
    isActive = false;
    cp5 = new ControlP5(thePApplet);
    font = createFont("Early-GameBoy.ttf", 32);
  }
}