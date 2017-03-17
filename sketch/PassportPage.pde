import processing.video.*;

class PassportPage extends BasePage { 
  PImage photo;
  Button _button2;
  Textlabel _label;
  MapPage _mapPage;
  boolean isActive;
  Capture cam;  
  Player _player;
  StoryPage _storyPage;
  
  PassportPage(PApplet thePApplet, StoryPage storyPage) {
    super(thePApplet);
    isActive = _isActive;
    _storyPage = storyPage;
    _player = Player.getInstance();    
    String[] cameras = Capture.list();
    if (cameras.length == 0) {
      println("There are no cameras available for capture.");
      exit();
    } else {
      println("Available cameras:");
      for (int i = 0; i < cameras.length; i++) {
        println(cameras[i]);
      }
      
      cam = new Capture(thePApplet, 320, 240, cameras[0], 30);
      cam.start();
    }   
    photo = loadImage("passportphoto.jpg");
  }

  void display() {
    background(0);
    image(photo,0, 0, width, height);//, 240, 80, 800, 560);
    textFont(font);
    fill(0);
    textSize(20);
    text("Q000034", 770, 180);
    text("KOR", 650, 180);
    textSize(32);
    text("PM", 497, 260);
  
    String playerName = _player.getName();  
    //println("Player name:" + playerName);
    text("300", 497, 335);
    if (cam.available()) {
      cam.read();
    }
    image(cam, 200, 180);
  }

  void hide() {
    _label.setVisible(false);    
    _button2.hide();
  }

  void setActive() {
    println("set Active");
    _isActive = true;
  }

  boolean isActive() {
    return _isActive;
  }
}