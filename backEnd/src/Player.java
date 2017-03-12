/**
 * Created by ppavlides on 11/03/2017.
 */


import java.util.ArrayList;
import java.util.Random;

public class Player {
    String name;
    int countryCode;
    double budget;
    ArrayList<Integer> destinations = new ArrayList<Integer>();

    public Player(String name){
        this.name = name;
        setCountryCode();
        setBudget();
        addDestination();
    }

    /**
     * We only use the country code and not a Country object because we don't
     * want to have references to the Country objects. Thus we use the code as
     * a country id number.
     */
    public void setCountryCode(){
        //initialize country
        Random rand = new Random();
        this.countryCode = rand.nextInt(15);
    }

    /**
     * setBudget is responsible for assigning a budget to the player. We don't
     * want all players for the same country to have the same budget. We create
     * a randomness of 30%, in case our player is above or lower the average
     * gdp level.
     */
    public void setBudget(){
        int low = -1;
        int high = 2;

        Random random = new Random();
        int fate = random.nextInt(high + 1 -low) - low;


        double tmpBudget = Handler.allCountries.get(this.countryCode).gdp;
        this.budget = tmpBudget * 0.7 + 0.3 *fate;
        this.budget = Math.round(this.budget * 100.0) / 100.0;
    }

    /**
     * This method adds randomly a new destination for the player. We need to
     * check if he visited again the place, or if the new destination is his
     * origin country.
     */
    public void addDestination(){
        Random rand = new Random();
        int destinationIndex = rand.nextInt(15);


        while (destinationIndex == this.countryCode || this.destinations.contains(destinationIndex)){
            destinationIndex = rand.nextInt(15);
        }

        this.destinations.add(destinationIndex);
    }

    public String toString(){
        String destinationsString="";
        for (int i=0; i<this.destinations.size(); i++){
            destinationsString+= Handler.allCountries.get(this.destinations.get(i)).name+", ";
        }
        destinationsString = destinationsString.substring(0,destinationsString.length()-2);
        return "Player: "+this.name+"\nFrom: "+ Handler.allCountries.get(this.countryCode).name+"\nBudget: "+this.budget+"\nDestinations: "+destinationsString;
    }



    /**
     * The main method works as a unit testing method for the class.
     * @param args
     */
    public static void main(String [] args){
        Handler.unitTesting();
        Player a = new Player("Costis");
        a.addDestination();
        a.addDestination();
        a.addDestination();
        System.out.println(a.toString());
    }
}