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
    background(0);
<<<<<<< HEAD
    _textfield = cp5.addTextfield("input");
    _textfield.setPosition(width/2, height/2)//TODO: locate the textfield...
      .setSize(200, 40)//TODO: set size
=======
    _textfield = cp5.addTextfield("");
    _textfield.setPosition(width/2, height*2/5)
      .setSize(200, 40) 
>>>>>>> 604f74a104bcc84caed4a366efff26e4dbd15e44
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
      //int cfg, int cbg, int cactive, int ccl, int cvl
      //.setColor(new CColor(color(255), color(255), color(255), color(0), color(0)))
      .setColorForeground(color(255))
      .setColorActive(color(255))
      .setColorLabel(color(0))
      .setColorBackground(color(255))     
      .setSize(200, 40);
  }

  void display() { 
    _button.setVisible(true);
    _textfield.setVisible(true);
  }
  
  void hide() {
    _button.setVisible(false);
    _textfield.setVisible(false);
  }
  
  void onClick(int theValue) {
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