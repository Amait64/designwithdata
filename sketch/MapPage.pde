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
    //backgroundImage = loadImage("moonwalk.jpg");
  }

  void display() { 
    background(255);
    //background(backgroundImage);
    baseMap = loadShape("WorldMap.svg");
    shape(baseMap, 0, 0, width, height);
    drawHovers();
  }

  void hide() {
  }

  void setActive() {
    _isActive = true;
  }

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