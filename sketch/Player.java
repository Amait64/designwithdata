import java.util.*;
import java.lang.*;
import java.io.IOException;

public class Player {
  double _budget;
  String _name;
  Country _origin;  
  ArrayList<Country> _destinations;
  ArrayList<Country> _countries;

  private static Player player = null;
  
  public static void Initialize(ArrayList<Country> countries)
  {
     player = new Player(countries);
  }
  
  public static Player getInstance()
  {    
    return player;
  }

  protected Player(ArrayList<Country> countries)
  {
    _countries = countries;
    _destinations = new ArrayList<Country>();
    setOriginCountry();
    setBudget();
  }

  public void setName(String name)
  {
    _name = name;
  }
  
  private void setOriginCountry() {
    Random rand = new Random();
    int countryCode = rand.nextInt(14);   
    for (Country country : _countries) { 
      if (country.getCode() == countryCode) { 
        _origin = country;
      }
    }
  }
  
  private void setBudget() {
    int low = -1;
    int high = 2;
    Random random = new Random();
    int fate = random.nextInt(high + 1 -low) - low;
    if(_origin == null)
      return;
    double tmpBudget = _origin.getGdp();
    _budget = tmpBudget * 0.7 + 0.3 *fate;
    _budget = Math.round(_budget * 100.0) / 100.0;
  }

  public void addDestination(Country destination) {
    _destinations.add(destination);
  }
  public String getName()
  {
    return _name;
  }
  public void updateBudget(double budget)//TODO: check
  {
    _budget = budget;
  } 
}