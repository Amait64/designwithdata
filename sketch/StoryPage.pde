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
    
  }
  
  boolean isActive()
  {
    return isActive;
  }
}