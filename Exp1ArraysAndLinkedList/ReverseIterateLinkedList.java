// 2. Write a Java program to iterate a linked list in reverse order (using
// objlist.descendingIterator())
import java.util.*;
public class ReverseIterateLinkedList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList<String>	ls = new LinkedList<>();
		ls.add("Blue");
		ls.add("Brown");
		ls.add("black");
		ls.add("red");
		ls.add("yellow");
		ListIterator<String> listIterator = ls.listIterator(ls.size());
       while (listIterator.hasPrevious()) {
           System.out.println(listIterator.previous());
       }

		
	}

}
