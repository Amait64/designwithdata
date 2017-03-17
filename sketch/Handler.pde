public class Handler
{
  String csv[];
  String myData[][];
  Handler() {
    
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
    loadCSV();
    loadData();    
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
}