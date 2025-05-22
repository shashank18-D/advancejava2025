// 5. Write a Java program that swaps two elements ( first and third elements ) in a linked list ( using
// Collections.swap(l_list, 0, 2))
import java.util.*;
public class SwapElementsLinkedList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList<String> ls = new LinkedList<>();
		ls.add("blue");
		ls.add("Yellow");
		ls.add("REd");
		ls.add("saffron");
		ls.add("Violet");
		System.out.println("Before swapping");
		System.out.println(ls);
		//this is used to swap the elements
		Collections.swap(ls, 2, 3);
		System.out.println("After swapping");
		System.out.println(ls);
	}

}

