import java.util.*;

public class Country {
  float _latitude;
  float _longitude;
  double _gdp;
  String _name;
  int _code;
  double _dataCosting;

  ArrayList<Country> connectedWith = new ArrayList<Country>();
  ArrayList<Country> mediumRisk = new ArrayList<Country>();
  ArrayList<Country> highRisk = new ArrayList<Country>();
  
  Country(float latitude, float longitude, double gdp, String name, int code, double dataCosting)
  {
    _latitude = latitude;
    _longitude = longitude;
    _gdp = gdp;
    _name = name;
    _code = code;
    _dataCosting = dataCosting;
  }

  float getLatitude()
  {
    return _latitude;
  }

  float getLongitude()
  {
    return _longitude;
  }

  String getName()
  {
    return _name;
  }
  
  int getCode()
  {
    return _code;
  }
  
  public double getGdp()
  {
    return _gdp;
  }
  
  void setConnectedWith(String [] countryInfo) {
    String tmpString = countryInfo[6];
    String [] indexes = tmpString.split(",");

    for (int i=0; i<indexes.length; i++) {
      int countryIndex = Integer.parseInt(indexes[i]);
      connectedWith.add(Handler.allCountries.get(countryIndex));
    }
  }

  void setMediumRisk(String [] countryInfo) {
    String tmpString = countryInfo[7];
    String [] indexes = tmpString.split(",");

    for (int i=0; i<indexes.length; i++) {
      int countryIndex = Integer.parseInt(indexes[i]);
      if (countryIndex != -1) {
        mediumRisk.add(Handler.allCountries.get(countryIndex));
      }
    }
  }

  void setHighRisk(String [] countryInfo) {
    String tmpString = countryInfo[8];
    String [] indexes = tmpString.split(",");

    for (int i=0; i<indexes.length; i++) {
      int countryIndex = Integer.parseInt(indexes[i]);
      if (countryIndex != -1) {
        highRisk.add(Handler.allCountries.get(countryIndex));
      }
    }
  }
}