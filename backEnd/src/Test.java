/**
 * Created by ppavlides on 11/03/2017.
 */

public class Test {
    public static void main(String []args){
//        try {
//            CSVReader reader = new CSVReader(new FileReader("dataset.csv"));
//            String [] nextLine;
//
//            while ((nextLine = reader.readNext()) != null) {
//                // nextLine[] is an array of values from the line
//                System.out.println(nextLine[0] + nextLine[1] + "etc...");
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        String value = "\"10,5,11,3,1,2\"";
        value = value.substring(1,value.length()-1);
        System.out.println(value);

    }
}
