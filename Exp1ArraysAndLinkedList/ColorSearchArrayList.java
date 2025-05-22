// 1. Write a java program for getting different colors through ArrayList interface and search whether
// the color "Red" is available or not
// ( Hint : Use ArrayListObj.contains() )
// package Exp1ArraysAndLinkedList;

import java.util.*;
public class ColorSearchArrayList {

	public static void main(String[] args) {
		
		List<String> ls = new ArrayList<>();
		ls.add("green");
		ls.add("blue");
		ls.add("yellow");
		ls.add("white");
		System.out.println(ls);
		//Contanins or not
		if(ls.contains("red")) {
			System.out.println("Contains Red");
		}else {
			System.out.println("Does Not contain Red");
		}
	}

}
