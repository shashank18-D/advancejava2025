// Write a java program for getting different colors through ArrayList interface and extract the
// elements 1st and 2nd from the ArrayList object by using SubList()


import java.util.*;
public class SubListColorsArrayList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> ls = new ArrayList<>();
		ls.add("white");
		ls.add("black");
		ls.add("Brown");
		ls.add("blue");
		ls.add("green");
		System.out.println(ls);
		System.out.println("using sublist:");
		//to obtain a sublist
		System.out.println(ls.subList(0,2));
	}

}
