// 4. Write a Java program to display elements and their positions in a linked list ( using
// l_listobj.get(p) )
import java.util.*;

public class DisplayWithPositionsLinkedList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList<String> ls = new LinkedList<>();
		ls.add("red");
		ls.add("green");
		ls.add("black");
		ls.add("saffron");
		ls.add("yellow");
		//using for each loop for iteration
		for(int i=0;i<ls.size();i++) {
			System.out.println("index: "+i+" value:"+ls.get(i));
		}
	}

}
