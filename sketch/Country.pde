class Country{
  float _latitude;
  float _longitude;
  double _gdp;
  String _name;
  
  Country(float latitude, float longitude, double gdp, String name)
  {
    _latitude = latitude;
    _longitude = longitude;
    _gdp = gdp;
    _name = name;
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
}