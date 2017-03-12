/**
 * Created by ppavlides on 11/03/2017.
 */

import java.util.ArrayList;


public class Route {
    Country from;
    Country to;
    ArrayList<Country> route;
    double cost;
    boolean mediumRiskFlag;
    boolean highRiskFlag;
    ArrayList<Country> whyMedium;
    ArrayList<Country> whyHigh;

    public Route(int from, int to){
        this.from= Handler.allCountries.get(from);
        this.to= Handler.allCountries.get(to);
        this.route = new ArrayList<Country>();
        this.mediumRiskFlag=false;
        this.highRiskFlag=false;
        this.whyMedium = new ArrayList<Country>();
        this.whyHigh = new ArrayList<Country>();
    }


    public void calculateCosts(){
        double cost=0.0;
        for (Country tmp: this.route){
            cost+= tmp.dataCosting;
        }
        this.cost=cost;
    }

    public void findWhyMedium() {
        for (Country routeCountry : this.route) {
            for (Country mediumRiskCountry : this.from.mediumRisk) {
                if (routeCountry.code==mediumRiskCountry.code){
                    this.mediumRiskFlag=true;
                    this.whyMedium.add(routeCountry);
                }
            }
        }
    }

    public void findWhyHigh() {
        for (Country routeCountry : this.route) {
            for (Country highRiskCountry : this.from.highRisk) {
                if (routeCountry.code==highRiskCountry.code){
                    this.highRiskFlag=true;
                    this.whyHigh.add(routeCountry);
                }
            }
        }
    }

    /**
     * This method is only for unit testing. Used for hard-coded route.
     */
    public void hypotheticalRoute(){
        //  SPAIN, UK, SWEDEN, RUSSIA
        // 6, 5, 4, 10
        this.route.add(Handler.allCountries.get(6));
        this.route.add(Handler.allCountries.get(5));
        this.route.add(Handler.allCountries.get(4));
        this.route.add(Handler.allCountries.get(10));
    }

    public String toString(){
        String from = this.from.name;
        String to = this.to.name;

        //Stringify route
        String theRoute=this.from.name+", ";
        for(Country tmp: this.route){
            theRoute+= tmp.name+", ";
        }
        theRoute = theRoute.substring(0,theRoute.length()-2);

        //Stringify whyMedium
        String whyMediumString="";
        if (this.mediumRiskFlag==true){

            for(Country medium: this.whyMedium){
                whyMediumString+= medium.name+", ";
            }
            whyMediumString = whyMediumString.substring(0,whyMediumString.length()-2);
        }else{
            whyMediumString= "No country listed.";
        }

        //Stringify whyHigh
        String whyHighString="";
        if (this.highRiskFlag==true){

            for(Country high: this.whyHigh){
                whyHighString+= high.name+", ";
            }
            whyHighString = whyHighString.substring(0,whyHighString.length()-2);
        }else{
            whyHighString= "No country listed.";
        }


        return "Send data from: "+from+" to: "+to+"\n\nRoute: "+theRoute+"\nCost: "+this.cost+"\n\nMedium Risk Flag: "+this.mediumRiskFlag+"\nBecause of: "+whyMediumString+"\n\nHigh Rish Flag: "+this.highRiskFlag+"\nBecause of: "+whyHighString;
    }


    public static void main (String [] args){
        Handler.unitTesting();
        Route testRoute = new Route(2,10);

        //Add countries to the route
        testRoute.hypotheticalRoute();

        //Calculate costs
        testRoute.calculateCosts();

        //Find risks
        testRoute.findWhyMedium();
        testRoute.findWhyHigh();

        System.out.println(testRoute.toString());

    }
}
