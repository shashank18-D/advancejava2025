/*
 Q2. Write a Java Program for Counting how many times a substring appears in a main string
using user defined function countOccurrences()
 */
package strings;

public class CountSubstringOccurrences {
		    public static int countOccurrences(String mainString, String subString) {
		        if (mainString == null || subString == null || subString.isEmpty()) {
		            return 0;
		        }
		        int count = 0;
		        int index = 0;
				//to count the occurenace of the substing inside the string 
		        while ((index = mainString.indexOf(subString, index)) != -1) {
		            count++;
		            index += subString.length(); 
		        }
		        return count;
		    }

		    public static void main(String[] args) {
		        String mainStr = "string string string";
		        String subStr = "string";
		        String subStr2 = "nothing is present";
		        System.out.println("Occurrences of '" + subStr + "': " + countOccurrences(mainStr, subStr)); 
		        System.out.println("Occurrences of '" + subStr2 + "': " + countOccurrences(mainStr, subStr2)); 
		    }
		

}
