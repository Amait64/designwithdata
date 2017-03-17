import controlP5.*;

HomePage _homePage;
PassportPage _passportPage;
MapPage _mapPage;
Player _player;

void setup() {
  background(0);  
  size(1280, 800);
  
  ArrayList<Country> countries = new Handler().getCountries();
  _player = Player.Initialize(countries);  
  
  _mapPage = new MapPage(this, countries);
  _passportPage = new PassportPage(this, _mapPage);  
  _homePage = new HomePage(this, _passportPage);
}

void draw() {
  if (_passportPage.isActive()) {
    _passportPage.display();
    _homePage.hide();
  }

  if (_mapPage.isActive()) {
    _mapPage.display();
    _passportPage.hide();
  }

  if (_homePage.isActive()) {
    _homePage.display();
  }
}