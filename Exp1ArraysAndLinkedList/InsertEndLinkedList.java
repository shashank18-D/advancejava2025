// 3. Write a Java program to insert the specified element at the end of a linked list.( using
// l_listobj.offerLast("Pink"))
import java.util.*;
public class InsertEndLinkedList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		LinkedList<String> ls = new LinkedList<>();
		ls.add("saffron");
		ls.add("brown");
		ls.add("Black");
		ls.add("red");
		ls.add("yellow");
		System.out.println(ls);
		ls.addLast("pink");
		//add element at the last
		System.out.println(ls);
	
	}

}
