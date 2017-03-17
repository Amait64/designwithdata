import controlP5.*;

PShape baseMap;
String csv[];
String myData[][];
ArrayList<Country> _countries;
HomePage _homePage;
PassportPage _passportPage;
MapPage _mapPage;

Player _player;

void setup() {
  background(0);  
  size(1280, 800);
  loadCSV();
  loadData();
  _countries = getCountries(); 
  _player = Player.getInstance(_countries);
  _mapPage = new MapPage(this);
  _passportPage = new PassportPage(this, _mapPage);  
  _homePage = new HomePage(this, _passportPage);
}

void loadCSV() {
  csv = loadStrings("dataset.csv");
}

void loadData() {
  myData = new String[csv.length][9];//TODO:hardcoded, columns in dataset.
  for (int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
}

ArrayList<Country> getCountries() {
  ArrayList<Country> countries = new ArrayList<Country>();
  
  for (int i = 1; i < myData.length; i++) {
    float longitude = map(float(myData[i][3]), -180, 180, 0, width);
    float latitude = map(float(myData[i][2]), 90, -90, 0, height);
    String countryName = myData[i][0];
    int code = int(myData[i][1]);
    double gdp = float(myData[i][4]);
    double dataCosting =  float(myData[i][5]);
    Country newCountry = new Country(latitude, longitude, gdp, countryName, code, dataCosting);
    countries.add(newCountry);
  }  
  return countries;
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
    if (i < 20) { //TODO: for test purposes
      Country currentCountry = _countries.get(i);
      Hover newHoverItem = new Hover(currentCountry); 
      newHoverItem.display();
    }
  }
}