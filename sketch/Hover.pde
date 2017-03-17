class Hover {
  float _longitude;
  float _latitude;
  int _size;
  boolean bhover = false;
  String _countryName;
  Country _country;
  int _markerSize = 20; //TODO: hardcoded

  Hover(Country country) {
    _country = country;
    _latitude = country.getLatitude();
    _longitude = country.getLongitude();
    _countryName = country.getName();
  }

  void display() {
    if (dist(mouseX, mouseY, _longitude, _latitude) < 10) { //TODO: hardcoded code
      fill(255, 0, 0);
    } else {
      fill(255, 0, 0, 50);
    }
    noStroke();
    ellipse(_longitude, _latitude, _markerSize, _markerSize);
    fill(0);
    text(_countryName, _longitude + _markerSize + 5, _latitude + 4);
    noFill();
    stroke(0);
  }

  void onClick() {
  }
}