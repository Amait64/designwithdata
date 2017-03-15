class HomePage extends BasePage {
  Button _button;
  Textfield _textfield;
  PassportPage _passportPage;

  HomePage(PApplet thePApplet, PassportPage passportPage) {
    super(thePApplet);
    _passportPage = passportPage;     
    _isActive = true;

    _textfield = cp5.addTextfield("");
    _textfield.setPosition(width/2, height*2/5)
      .setSize(200, 40) 
      .setFocus(true)
      .setColor(color(0))
      .setColorActive(0) 
      .setColorForeground(0) 
      .setColorBackground(color(255))  
      .setFont(font)      
      .setVisible(_isActive);
      
    textFont(font);
    text("NAME:", width/2-200, height*2/5+30);

    _button = cp5.addButton("ENTER");
    _button.setValue(0)
      .setPosition(width/2-100, height*3/5)
      .setFont(font)  
      .setColorForeground(color(255))
      .setColorActive(color(255))
      .setColorLabel(color(0))
      .setColorBackground(color(255))     
      .setSize(200, 40)      
      .setVisible(_isActive);

    _button.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        println("button click:" + theEvent.getAction());
        println("text value:" + getTextFieldValue());

        if (getTextFieldValue().isEmpty())//TODO: Add validation to alert user about the required field..
          return;
        hide(); 
        _isActive = false;          
        _passportPage.setActive();
        //_passportPage.display();
      }
    }
    );
  }

  void display() { 
      
    _button.setVisible(true);
    _textfield.setVisible(true);
  }

  void hide() {
    _button.hide();
    _textfield.hide();
    _button.setVisible(false);
    _textfield.setVisible(false);
  }

  String getTextFieldValue() {
    return _textfield.getText();
  }

  boolean isActive() {
    return _isActive;
  }
}