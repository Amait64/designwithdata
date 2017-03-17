class StoryPage extends BasePage { 
  MapPage _mapPage;
  StoryPage(PApplet thePApplet, MapPage mapPage) {
    super(thePApplet);    
    _mapPage = mapPage;        
  }
  
  void setActive()
  {
    isActive = true;
  }
  
  void hide()
  {
    
  }
  
  void display()
  {  
    background(0);
    textFont(font);
    fill(color(255));
     text("YOU LIVE IN A WORLD IN", width/2-300, height/2-200);
     text("WHICH YOUR DATA SHARES", width/2-300, height/2-150);
     text("YOUR NATIONALAITY...", width/2-300, height/2-100);
     text("AND ITS RESTRICTIONS.", width/2-300, height/2-50);
 
     text("SEND MESSAGED ABROAD,", width/2-300, height/2+50);
     text("BUT TAKE CAUTION, NET", width/2-300, height/2+100);
     text("NEUTRALITY IS NO ", width/2-300, height/2+150);
     text("LONGER.", width/2-300, height/2+200);
  }
  
  boolean isActive()
  {
    return isActive;
  }
}