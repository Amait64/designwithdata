class MapPage extends BasePage {
  Textlabel _label;

  MapPage(PApplet thePApplet) {
    super(thePApplet);    
    
    _label = cp5.addTextlabel("MapPageTitle")
      .setText("Map Page")
      .setPosition(100, 50)
      .setColorValue(0xffffff00)
      .setFont(font)      
      .setVisible(_isActive);
      
      
      
  }

  void display() { 
        background(0);
   _label.setVisible(true);
  }

  void hide() {
    _label.setVisible(false);
  }

  void setActive() {
    println("set Active");
    _isActive = true;
  }

  boolean isActive() {
    return _isActive;
  }
}