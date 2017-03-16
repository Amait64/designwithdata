class MapPage extends BasePage {
  PShape baseMap;
  String csv[];
  String myData[][];
  ArrayList<Country> _countries;

  MapPage(PApplet thePApplet) {
    super(thePApplet);    
    loadMap();
    loadCSV();
    loadData();
    parseCountries();   
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
      Country newCountry = new Country(latitude, longitude, 0, countryName); //TODO: hardcoded gdp
      _countries.add(newCountry);
    }
  }

  void loadMap() {
    baseMap = loadShape("WorldMap.svg");
  }

  void display() { 
    background(0);
    drawMap();
  }

  void hide() {
    //_label.setVisible(false);
  }

  void setActive() {
    _isActive = true;
  }

  void drawMap() {
    shape(baseMap, 0, 0, width, height);
  }

  boolean isActive() {
    return _isActive;
  }
}