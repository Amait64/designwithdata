import controlP5.*;


class HomePage {
  ControlP5 cp5;
  Button _button;
  Textfield _textfield;
  PFont font;
  boolean _isActive = true;

  
  HomePage(PApplet thePApplet) {
    cp5 = new ControlP5(thePApplet);
    font = createFont("Early-GameBoy.ttf", 32);
  }

  void display() { 
    background(0);
    _textfield = cp5.addTextfield("");
    _textfield.setPosition(width/2, height*2/5)
      .setSize(200, 40) 
      .setFocus(true)
      .setColor(color(0))
      .setColorActive(0) 
      .setColorForeground(0) 
      .setColorBackground(color(255))  
      .setFont(font);
      textFont(font);
      text("NAME:",width/2-200, height*2/5+30);
     

    _button = cp5.addButton("ENTER");
    _button.setValue(0)
      .setPosition(width/2-100, height*3/5)
      .setFont(font)
   
      .setColorBackground(color(255)) 
      .setSize(200, 40);
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