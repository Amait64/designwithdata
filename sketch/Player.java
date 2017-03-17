import java.util.*;
import java.lang.*;

public class Player {
  double _budget;
  String _name;
  Country _origin;  
  ArrayList<Country> _destinations;
  ArrayList<Country> _countries;

  private static Player player = null;
  
  public static Player getInstance(ArrayList<Country> countries)
  {
   if (player == null)
      player = new Player(countries);
    return player;
  }
  public static Player getInstance()
  {
    if (player == null)
      //throw new Exception("Initialize before");
      player = new Player(null); //<>//
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
  } //<>//
  
  public void setCountries(ArrayList<Country> countries)
  {
    _countries = countries;
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
    double tmpBudget = _origin.getGdp();
    _budget = tmpBudget * 0.7 + 0.3 *fate;
    _budget = Math.round(_budget * 100.0) / 100.0;
  }

  public void addDestination(Country destination) {
    _destinations.add(destination);
  }

  void updateBudget(double budget)//TODO: check
  {
    _budget = budget;
  }
}