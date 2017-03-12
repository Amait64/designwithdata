/**
 * Created by ppavlides on 11/03/2017.
 */

import java.util.ArrayList;


public class Country {
    String name;
    int code;
    double latitude;
    double longitude;
    double gdp;
    double dataCosting;
    ArrayList<Country> connectedWith = new ArrayList<Country>();
    ArrayList<Country> mediumRisk = new ArrayList<Country>();
    ArrayList<Country> highRisk = new ArrayList<Country>();

    public Country(String [] countryInfo){
        this.name = countryInfo[0];
        this.code = Integer.parseInt(countryInfo[1]);
//        this.latitude
//        this.latitude
        this.gdp = Double.parseDouble(countryInfo[4]);
        this.dataCosting = Double.parseDouble(countryInfo[5]);
    }

    public void setConnectedWith(String [] countryInfo){
        String tmpString = countryInfo[6];
        String [] indexes = tmpString.split(",");

        for (int i=0; i<indexes.length; i++){
            int countryIndex = Integer.parseInt(indexes[i]);
            connectedWith.add(Handler.allCountries.get(countryIndex));
        }
    }

    public void printConnections(){
        for (int i=0; i<connectedWith.size(); i++){
//            System.out.println(connectedWith.get(i).name);
            System.out.println(connectedWith.get(i).code);
        }
    }

    public void setMediumRisk(String [] countryInfo){
        String tmpString = countryInfo[7];
        String [] indexes = tmpString.split(",");

        for (int i=0; i<indexes.length; i++){
            int countryIndex = Integer.parseInt(indexes[i]);
            if (countryIndex != -1){
                mediumRisk.add(Handler.allCountries.get(countryIndex));
            }
        }
    }

    public void printMediumRisk(){
        if (mediumRisk.size() == 0){
            System.out.println("No medium risk countries found.");
        }else {
            for (int i = 0; i < mediumRisk.size(); i++) {
                System.out.println(mediumRisk.get(i).name);
//                System.out.println(mediumRisk.get(i).code);
            }
        }
    }

    public void setHighRisk(String [] countryInfo){
        String tmpString = countryInfo[8];
        String [] indexes = tmpString.split(",");

        for (int i=0; i<indexes.length; i++){
            int countryIndex = Integer.parseInt(indexes[i]);
            if (countryIndex != -1) {
                highRisk.add(Handler.allCountries.get(countryIndex));
            }
        }
    }

    public void printHighRisk(){
        if (highRisk.size() == 0){
            System.out.println("No high risk countries found.");
        }else {
            for (int i = 0; i < highRisk.size(); i++) {
                System.out.println(highRisk.get(i).name);
//                System.out.println(highRisk.get(i).code);
            }
        }
    }

}
