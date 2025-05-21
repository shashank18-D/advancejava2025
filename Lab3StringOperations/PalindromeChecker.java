/*
 Q4. Write a Java Program for Checking if a string reads the same backward as forward (ignoring case
and punctuation) using user defined function isPalindrome():
 */
package strings;

public class PalindromeChecker{
		    public static boolean isPalindrome(String str) {
		        if (str == null) {
		            return false;
		        }
		        String newString = str.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
		        int left = 0;
		        int right = newString.length() - 1;
				// this is used to check the palindrome or not 
		        while (left < right) {
		            if (newString.charAt(left) != newString.charAt(right)) {
		                return false;
		            }
		            left++;
		            right--;
		        }
		        return true;
		    }

		    public static void main(String[] args) {
		        String str1 = "Malayalam";
		        String str2 = "Hello";
		        System.out.println(  str1 + " is a palindrome: " + isPalindrome(str1)); 
		        System.out.println( str2 + " is a palindrome: " + isPalindrome(str2)); 
		    }
}


