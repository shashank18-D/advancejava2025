/*
 Q9. Write a Java Program for Creating a random string of a specified length using user defined
function generateRandomString()
 */

import java.util.Random;
public class RandomStringGenerator {
    public static String RandomString(int length) {
     
        String charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        Random rand = new Random();
        StringBuilder sb = new StringBuilder(length);
        // this is susedd to create a random string 
        for (int i = 0; i < length; i++) {
            int randomIndex = rand.nextInt(charset.length());
            sb.append(charset.charAt(randomIndex));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        int length = 10;


        System.out.println("length " + length + ": " + RandomString(length));
    
    }

}
