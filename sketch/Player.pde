import java.util.Random;

public class Player {
  double _budget;
  String _name;
  Country _origin;  
  ArrayList<Country> _destinations;
  ArrayList<Country> _countries;

  static Player player = null;

  public static Player getInstance()
  {
    if (player == null)
      player = new Player();
    return player;
  }

  protected Player()
  {
    _countries = new ArrayList<Country>();
    _destinations = new ArrayList<Country>();
    setOriginCountry();
    setBudget();
  }

  void setName(String name)
  {
    _name = name;
  }
  
  void setCountries(ArrayList<Country> countries)
  {
    _countries = countries;
  }
  
  void setOriginCountry() {
    Random rand = new Random();
    int countryCode = rand.nextInt(14);   
    for (Country country : _countries) { 
      if (country.getCode() == countryCode) { 
        _origin = country;
      }
    }
  }
  void setBudget() {
    int low = -1;
    int high = 2;
    Random random = new Random();
    int fate = random.nextInt(high + 1 -low) - low;
    double tmpBudget = _origin.getGdp();
    _budget = tmpBudget * 0.7 + 0.3 *fate;
    _budget = Math.round(_budget * 100.0) / 100.0;
  }

  void addDestination(Country destination) {
    _destinations.add(destination);
  }

  void updateBudget(double budget)//TODO: check
  {
    _budget = budget;
  }
}