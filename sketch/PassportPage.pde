import processing.video.*;

class PassportPage extends BasePage { 
  PImage photo;
  Button _button;
  Textlabel _label;
  MapPage _mapPage;
  Capture cam;  
  Player _player;
  StoryPage _storyPage;
  
  PassportPage(PApplet thePApplet, StoryPage storyPage) {
    super(thePApplet);
    _storyPage = storyPage;
    _player = Player.getInstance();    
    
    addButtonTest();
    String[] cameras = Capture.list();
    
    if (cameras.length == 0) {
      println("There are no cameras available for capture.");
      exit();
    } else {
      println("Available cameras:");
      for (int i = 0; i < cameras.length; i++) {
        println(cameras[i]);
      }
      
      cam = new Capture(thePApplet);//,90,160,cameras[0], 30);
      //cam.start();
    }   
    photo = loadImage("passportphoto.jpg");
  }
  
  void addButtonTest()
  {
     _button = cp5.addButton("ENTER");
    _button.setValue(0)
      .setPosition(width/2-100, height*3/5)
      .setFont(font)  
      .setColorForeground(color(255))
      .setColorActive(color(255))
      .setColorLabel(color(0))
      .setColorBackground(color(255))     
      .setSize(200, 60)      
      .setVisible(isActive);



    _button.onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {             
        hide();            
        isActive = false;        
        _storyPage.setActive();
      }
    }
    );
  }
  void display() {
    background(0);
    image(photo,0, 0, width, height);//, 240, 80, 800, 560);
    textFont(font);
    fill(0);
    textSize(20);
    text("Q000034", 770, 180);
    text("KOR", 650, 180);
 
    
  
    String playerName = _player.getName();  
    println("Player name:" + playerName);
    textSize(32);
    text(playerName, 497, 260);
    text("300", 497, 335);
    if (cam.available()) {
      cam.read();
    }
    image(cam, 60, 180);
  }

  void hide() {
    _label.setVisible(false);    
    _button.hide();
  }

  void setActive() {
    println("set Active");
    isActive = true;
  }

  boolean isActive() {
    return isActive;
  }
}