import controlP5.*;

class PassportPage {
  ControlP5 cp5;
  boolean _isActive = true;
  Button _button;
  Textfield _textfield;
  PassportPage(PApplet thePApplet) {
    cp5 = new ControlP5(thePApplet);
  }

  void display() { 
    background(0);
    //create passport page
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