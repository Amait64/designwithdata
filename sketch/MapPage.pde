class MapPage extends BasePage {
  PShape baseMap;
  PImage backgroundImage;
  MapPage(PApplet thePApplet) {
    super(thePApplet);          
    backgroundImage = loadImage("WorldMap.jpg");
  }

 
  void loadMap() {
    backgroundImage = loadImage("moonwalk.jpg");
    //baseMap = loadShape("WorldMap.svg");
  }

  void display() { 
   
    background(backgroundImage);
    //loadMap();
    //drawMap();    
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
}