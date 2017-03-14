import controlP5.*;

PShape baseMap;
String csv[];
String myData[][];
ArrayList<Country> _countries;
HomePage _homePage;
PassportPage _passportPage;
int page = 0;

void setup() {
  size(1280, 720);
  loadMap();
  loadCSV();
  loadData();
  parseCountries();
  _homePage = new HomePage(this);
  _passportPage = new PassportPage(this);
  noLoop();
}

void draw() {
<<<<<<< HEAD
  //if (_passportPage.isActive() == false) {
  //  _passportPage.display();
  //}

  //if (_homePage.isActive()) {
  //  _homePage.display();
  //}

  if (_homePage.isActive()) {
    _homePage.display();
    loop();
    //_homePage.hide();
    //_passportPage.display();
    //drawMap();
    //drawButtons();
=======
   
        
      
  if(page == 1){
    _passportPage.display();
  }
  
  if (_homePage.isActive() == false) {
    _homePage.hide();
    drawMap();
    drawButtons();
>>>>>>> 604f74a104bcc84caed4a366efff26e4dbd15e44
  }
  //if (_passportPage.isActive()) {
  //  _passportPage.display();
  //}
}

void loadMap() {
  baseMap = loadShape("WorldMap.svg");
}

void loadCSV() {
  csv = loadStrings("WorldCoordinates.csv");
}

void loadData() {
  myData = new String[csv.length][6];//TODO:hardcoded
  for (int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
}

void parseCountries() {
  _countries = new ArrayList<Country>();
  for (int i = 1; i < myData.length; i++) {
    float longitude = map(float(myData[i][3]), -180, 180, 0, width);
    float latitude = map(float(myData[i][2]), 90, -90, 0, height);
    String countryName = myData[i][0];
    //println("Country name:" + countryName + " Longitude:" + longitude + " Latitude:" + latitude);
    Country newCountry = new Country(latitude, longitude, 0, countryName); //TODO: hardcoded gdp
    _countries.add(newCountry);
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
void colorA(int theValue) {
  _homePage.onClick(theValue);
}

void drawMap() {
  shape(baseMap, 0, 0, width, height);
}

void renderPage0() {
  _homePage.display();
}

//TODO:
//add validation to the user that needs to specify name