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
      
      cam = new Capture(thePApplet,90,160,cameras[0], 30);
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
    text("Q000034", 2.5*width/5,18*height/100);
    text("KOR", 1.7*width/5, 18*height/100);
 
    
  
    String playerName = _player.getName();  
    println("Player name:" + playerName);
     println(width,height);
    textSize(32);
    text(playerName,4*width/10, 3.2*height/10);
    text("300",4*width/10, 4.5*height/10);
    if (cam.available()) {
      cam.read();
    }
    image(cam, 60, 180);
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