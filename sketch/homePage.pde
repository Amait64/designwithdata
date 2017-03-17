class HomePage extends BasePage {
  Button _button;
  Textfield _textfield;
  PassportPage _passportPage;
  Player _player;

  HomePage(PApplet thePApplet, PassportPage passportPage) {
    super(thePApplet);
    _isActive = true;

    _passportPage = passportPage;                      
    _player = Player.getInstance();

    _textfield = cp5.addTextfield("");
    _textfield.setPosition(width/2-100, height*1.8/5)
      .setSize(480, 60) 
      .setFocus(true)
      .setColor(color(0))
      .setColorActive(0) 
      .setColor(color(129))
      .setFont(font) 
      .setText(" Enter your name")


      .setColorForeground(0) 
      .setColorBackground(color(255))  
      .setFont(font)      
      .setVisible(_isActive);

    textFont(font);
    text("NAME:", width/2-300, height*1.8/5+40);

    _textfield.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        _textfield.clear();       
      }
    }
    );

    _button = cp5.addButton("ENTER");
    _button.setValue(0)
      .setPosition(width/2-100, height*3/5)
      .setFont(font)  
      .setColorForeground(color(255))
      .setColorActive(color(255))
      .setColorLabel(color(0))
      .setColorBackground(color(255))     
      .setSize(200, 60)      
      .setVisible(_isActive);



    _button.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {       
        if (getTextFieldValue().isEmpty())//TODO: Add validation to alert user about the required field..
          return;
        hide();            
        _isActive = false;        
        String name = getTextFieldValue();
        _player.setName(name);
        _passportPage.setActive();
      }
    }
    );
  }

  void display() { 
    _button.setVisible(true);
    _textfield.setVisible(true);
  }

  void hide() {
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


//add markers per country
//draw routes
//include backend code