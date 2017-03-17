class MapPage extends BasePage {
  PShape baseMap;
  PImage backgroundImage;
  ArrayList<Country> _countries;

  MapPage(PApplet thePApplet, ArrayList<Country> countries) {
    super(thePApplet);          
    backgroundImage = loadImage("WorldMap.jpg");
    _countries = countries;
  }


  void loadMap() {
    backgroundImage = loadImage("moonwalk.jpg");
    //baseMap = loadShape("WorldMap.svg");
  }

  void display() { 

    background(backgroundImage);
   drawHovers();
  }

  void hide() {
    //_label.setVisible(false);
  }

  void setActive() {
    _isActive = true;
  }

  //void drawMap() {
  //  shape(baseMap, 0, 0, width, height);
  //}

  boolean isActive() {
    return _isActive;
  }

  void drawHovers() {
    for (int i = 0; i < _countries.size(); i++) {
      Country currentCountry = _countries.get(i);
      Hover newHoverItem = new Hover(currentCountry); 
      newHoverItem.display();
    }
  }
}