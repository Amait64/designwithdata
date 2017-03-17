class StoryPage extends BasePage { 
  MapPage _mapPage;
  StoryPage(PApplet thePApplet, MapPage mapPage) {
    super(thePApplet);    
    _mapPage = mapPage;
  }
}