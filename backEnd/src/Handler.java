/**
 * Created by ppavlides on 10/03/2017.
 */

import com.opencsv.CSVReader;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Handler {
    ArrayList<String []> lines = new ArrayList<String []>();
    ArrayList<Player> allPlayers = new ArrayList<Player>();
    static ArrayList<Country> allCountries = new ArrayList<Country>();

    public Handler(){
        try {
            CSVReader reader = new CSVReader(new FileReader("dataset.csv"));
            int i=0;
            String [] nextLine;
            while ((nextLine = reader.readNext()) != null) {
                lines.add(nextLine);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Unit testing method. Use this method if you need to test if the
     * initialisation of all the ArrayList was correct.
     *
     * @return: void
     */
    public void testInitialisation(){
        int b=2;
        System.out.println(allCountries.get(b).name);
        System.out.println("############");
        allCountries.get(b).printConnections();
        System.out.println("############");
        allCountries.get(b).printMediumRisk();
        System.out.println("############");
        allCountries.get(b).printHighRisk();
    }


    public static void main(String [] args){
        Handler game = new Handler();

        //Initialize all countries
        for (int countryIndex=1; countryIndex<game.lines.size(); countryIndex++){
            Country tmp = new Country(game.lines.get(countryIndex));
            allCountries.add(tmp);
        }

        //Initialize the connections
        for (int countryIndex=0; countryIndex<allCountries.size(); countryIndex++){
            allCountries.get(countryIndex).setConnectedWith(game.lines.get(countryIndex+1));
            allCountries.get(countryIndex).setMediumRisk(game.lines.get(countryIndex+1));
            allCountries.get(countryIndex).setHighRisk(game.lines.get(countryIndex+1));
        }

        System.out.println("Welcome to the borders game!");
        System.out.println("Please enter your name: ");

        Scanner s = new Scanner(System.in);
        String name = s.nextLine();

        Player newPlayer = new Player(name);
        System.out.println(newPlayer.toString());




    }

    /**
     * This method works as a unit testing for other classes. No need for Handler
     * instantiation.
     */
    public static void unitTesting(){
        Handler game = new Handler();

        //Initialize all countries
        for (int countryIndex=1; countryIndex<game.lines.size(); countryIndex++){
            Country tmp = new Country(game.lines.get(countryIndex));
            allCountries.add(tmp);
        }

        //Initialize the connections
        for (int countryIndex=0; countryIndex<allCountries.size(); countryIndex++){
            allCountries.get(countryIndex).setConnectedWith(game.lines.get(countryIndex+1));
            allCountries.get(countryIndex).setMediumRisk(game.lines.get(countryIndex+1));
            allCountries.get(countryIndex).setHighRisk(game.lines.get(countryIndex+1));
        }

//        game.testInitialisation();
    }

}
