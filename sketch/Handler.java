import com.opencsv.CSVReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Handler
{
  String[] _csv;
  ArrayList<String []> lines = new ArrayList<String []>(); 
  static ArrayList<Country> allCountries = new ArrayList<Country>();

  static void Initialize(String path) {
    new Handler(path);
  }

  protected Handler(String path) {
    loadCSV(path);
    loadData();
  }

  void loadCSV(String path) {
    try {
      CSVReader reader = new CSVReader(new FileReader(path));
      int i=0;
      String [] nextLine;
      while ((nextLine = reader.readNext()) != null) {
        lines.add(nextLine);
      }
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  void loadData() {
    //Initialize all countries
    for (int countryIndex=1; countryIndex< lines.size(); countryIndex++) {

      String [] countryInfo = lines.get(countryIndex);
      float longitude = Float.parseFloat(countryInfo[3]);
      float latitude = Float.parseFloat(countryInfo[2]);
      String countryName = countryInfo[0];
      int code = Integer.parseInt(countryInfo[1]);
      double gdp = Double.parseDouble(countryInfo[4]);
      double dataCosting = Double.parseDouble(countryInfo[5]);
      Country newCountry = new Country(latitude, longitude, gdp, countryName, code, dataCosting);
      System.out.println("Country name:" + countryName);
      allCountries.add(newCountry);
    }

    //Initialize the connections
    for (int countryIndex=0; countryIndex<allCountries.size(); countryIndex++) {
      allCountries.get(countryIndex).setConnectedWith(lines.get(countryIndex+1));
      allCountries.get(countryIndex).setMediumRisk(lines.get(countryIndex+1));
      allCountries.get(countryIndex).setHighRisk(lines.get(countryIndex+1));
    }
  }
}