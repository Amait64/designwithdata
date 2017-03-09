class ShowRoute {

  float fx;//long
  float fy;//lat

  float flong;
  float flat;

  boolean bhover = false;

  ShowRoute(float tlong, float tlat) {

    flong = tlong;
    flat = tlat;

    fx = map(flong, -180, 180, 0, width);
    fy = map(flat, 90, -90, 0, height);
  }

  void display() {
    
   if (bhover) {
      fill(255, 0, 0);
      ellipse(flong, flat, 20, 20);
   }
   else{  fill(255, 0, 0, 50);
      ellipse(flong, flat, 20, 20);
   }
  }

  void checkMouse() {
    if (dist(mouseX, mouseY, flong, flat) < 10) {
      bhover = true;
   } else bhover = false;
     display();
  }
}