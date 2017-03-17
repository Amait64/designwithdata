import controlP5.*;

HomePage _homePage;
PassportPage _passportPage;
MapPage _mapPage;
StoryPage _storyPage;

void setup() {
  fullScreen();
  background(0);
  String path = sketchPath("data\\dataset.csv");
  Handler.Initialize(path);
  Player.Initialize(Handler.allCountries);
  _mapPage = new MapPage(this, Handler.allCountries);
  _storyPage = new StoryPage(this, _mapPage);
  _passportPage = new PassportPage(this, _storyPage);  
  _homePage = new HomePage(this, _passportPage);
}

void draw() {
  background(0);  
  println("Passport is active:" + _passportPage.isActive());
  if (_passportPage.isActive()) {
    _passportPage.display();
    _homePage.hide();
  }

  if (_mapPage.isActive()) {
    _mapPage.display();
    _storyPage.hide();
  }

  if (_homePage.isActive()) {
    _homePage.display();
  }
  
  if (_storyPage.isActive()) {
    _storyPage.display();
    _passportPage.hide();
  }
}