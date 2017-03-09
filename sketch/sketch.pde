

// LIBRARIES

// GLOBAL VARIABLES
PShape baseMap;
String csv[];
String myData[][];
PFont f;


// SETUP
void setup() {
  size(1800, 900);
  //noLoop();
  f = createFont("Avenir-Medium", 12);
  baseMap = loadShape("WorldMap.svg");
  csv = loadStrings("WorldCoordinates.csv");
  myData = new String[csv.length][6];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
}


// DRAW
void draw() { 
  shape(baseMap, 0, 0, width, height);
  noStroke();
  
  for(int i=0; i<myData.length; i++){
    fill(255, 0, 0, 50);
    textMode(MODEL);
    noStroke();
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][2]), 90, -90, 0, height);    
    float markerSize = 20;
    //println("MarketSize:" + markerSize);
    //println(myData[i][0] + "-" + myData[i][2] + "-" + myData[i][3]);
   
    
    if(i<20){
      //ellipse(graphLong, graphLat, markerSize, markerSize);
      ShowRoute showroute = new ShowRoute(graphLong,graphLat); 
      fill(0);
      textFont(f);
      text(myData[i][0], graphLong + markerSize + 5, graphLat + 4);
      noFill();
      stroke(0);
     // line(graphLong+markerSize/2, graphLat, graphLong+markerSize, graphLat);
      //hover
      //put in the center
      //show routes
      showroute.display();
    }
  }
}