class PassportPage extends BasePage { 
  Button _button2;
  Textlabel _label;
  MapPage _mapPage;
  boolean isActive;
  
  PassportPage(PApplet thePApplet, MapPage mapPage) {
    super(thePApplet);
    isActive = _isActive;
    _mapPage = mapPage;

    //Declare controls
    _label = cp5.addTextlabel("PassportPageTitle");
    _label.setText("Passport Page")
      .setPosition(100, 50)
      .setColorValue(0xffffff00)
      .setFont(font)
      .setVisible(_isActive);
      
    _button2 = cp5.addButton("Start");
    _button2.setValue(0)
      .setPosition(width/2-200, height*3/5)
      .setFont(font)  
      .setColorForeground(color(255))
      .setColorActive(color(255))
      .setColorLabel(color(0))
      .setColorBackground(color(255))           
      .setVisible(_isActive)
      .setSize(200, 40);

    //Add event to control
    _button2.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        _isActive = false;    
        hide();
        _mapPage.display();        
      }
    }
    );
  }

  void display() {
     background(0);
    _label.setVisible(true);
    _button2.setVisible(true);
  }

  void hide() {
     background(123);
    _label.setVisible(false);    
    _button2.hide();
  }

  void setActive() {
    _isActive = true;
  }

  boolean isActive() {
    return _isActive;
  }
}