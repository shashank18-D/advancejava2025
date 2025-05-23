//Q7. Write a Java Program for Shortening a string to a specified length and adds an ellipsis using user defined function truncate()

package String;

public class StringTruncate {
    public static String truncate(String input, int length) {
        if (input.length() <= length) return input;
        return input.substring(0, length) + "...";
    }

    public static void main(String[] args) {
        String input = "This is a long sentence for truncation.";
        System.out.println("Truncated: " + truncate(input, 15));
    }
}
