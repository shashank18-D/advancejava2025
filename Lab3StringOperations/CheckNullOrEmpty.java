/*
 Q1. Write a Java Program for Checking if a given string is null or contains only whitespace using user
defined function isNullOrEmpty().
*/
package strings;

public class CheckNullOrEmpty {
		    public static boolean isNullOrEmpty(String str) {
		        return str == null || str.trim().isEmpty();
		    }
		    public static void main(String[] args) {
		        String str1 = null;
		        String str2 = "Hello";
		        String str3 = "   ";
				//to check whether the string is empty or not 
		        System.out.println("String 1 is null or empty: " + isNullOrEmpty(str1)); 
		        System.out.println("String 2 is null or empty: " + isNullOrEmpty(str2)); 
		        System.out.println("String 3 is null or empty: " + isNullOrEmpty(str3));   
		    }
}
 