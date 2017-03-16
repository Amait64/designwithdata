import controlP5.*;

PShape baseMap;
String csv[];
String myData[][];
ArrayList<Country> _countries;
HomePage _homePage;
PassportPage _passportPage;
MapPage _mapPage;

void setup() {
  background(0);  
  size(1280, 720); 
  _mapPage = new MapPage(this);
  _passportPage = new PassportPage(this, _mapPage);  
  _homePage = new HomePage(this, _passportPage);
  
}

void draw() {
  if (_passportPage.isActive()) {
    _passportPage.display();
    _homePage.hide();    
  }
  
  if (_homePage.isActive()) {
    _homePage.display();
  }
}

void drawButtons() {
  for (int i = 0; i < _countries.size(); i++) {
    println("Countries size: " + _countries.size());
    if (i < 20) { //TODO: for test purposes
      Country currentCountry = _countries.get(i);
      Hover newHoverItem = new Hover(currentCountry); 
      newHoverItem.display();
    }
  }
}