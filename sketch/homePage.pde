import controlP5.*;

class HomePage {
  ControlP5 cp5;
  boolean _isActive = true;
  Button _button;
  Textfield _textfield;
  HomePage(PApplet thePApplet) {
    cp5 = new ControlP5(thePApplet);
  }

  void display() { 
    background(0);
    _textfield = cp5.addTextfield("input");
    _textfield.setPosition(230, 250)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(255, 0, 0))
      .setLabel("Text label");

    _button = cp5.addButton("colorA");
    _button.setValue(0)
      .setPosition(100, 100)
      .setSize(200, 19);
  }
  
  void hide() {
    _button.setVisible(false);
    _textfield.setVisible(false);
  }
  
  void colorA(int theValue) {
    if(getTextFieldValue().isEmpty())//TODO: Add validation to alert user about the required field..
      return;
    println("a button event from colorA: "+theValue);
    println("value from Textfield:" + getTextFieldValue());
    _isActive = false;
  }
  
  String getTextFieldValue() {
    return cp5.get(Textfield.class, "input").getText();
  }
  boolean isActive() {
    return _isActive;
  }
}