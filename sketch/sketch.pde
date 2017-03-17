import controlP5.*;

HomePage _homePage;
PassportPage _passportPage;
MapPage _mapPage;
StoryPage _storyPage;

void setup() {
  fullScreen();
  background(0); //<>//
  String path = sketchPath("data\\dataset.csv");   //<>//
  Handler.Initialize(path);
  Player.Initialize(Handler.allCountries);
  _mapPage = new MapPage(this, Handler.allCountries);
  _storyPage = new StoryPage(this, _mapPage);
  _passportPage = new PassportPage(this, _storyPage);  
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