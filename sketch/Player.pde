class Player{
  double _budget;
  Country _origin;
  
  Player()
  {
    _budget = 500; //todo, remove hardcode
  }
  
  void updateBudget(double budget)
  {
    _budget = budget;
  }
}