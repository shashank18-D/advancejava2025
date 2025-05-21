/*
 Q8. Write a Java Program for Verifying if a string contains only numeric characters using user defined
function isNumeric()
 */
package strings;

public class CheckNumeric {
	  public static boolean isNullOrEmpty(String str) {
	        return str == null || str.trim().isEmpty();
	    }
	  public static boolean isNumeric(String str) {
	        if (isNullOrEmpty(str)) {
	            return false;
	        }
			// converts it to numeric values 
	        for (int i = 0; i < str.length(); i++) {
	            if (!Character.isDigit(str.charAt(i))) {
	                return false;
	            }
	        }
	        return true;
	    }
	    public static void main(String[] args) {
	        String str1 = "12345";
	      String str2 ="tarun";
	        System.out.println(str1 + "' is numeric: " + isNumeric(str1)); 
	        System.out.println(str2 + "' is numeric: " + isNumeric(str2)); 
	    }
	   
	  
}
