package com.cs336.pkg;

public class CarNode {
	public String carID;//car's LISTING NUMBER NOT CAR ID
	int parameters; //the number of parameters fulfilled
	public CarNode prev,next;
	
	public CarNode(String listing_number) {
		carID = listing_number;
		parameters = 0;
		prev = null;
		next = null;
	}
	
	public void add(int num) { parameters+=num;}
	
	public int count() { return parameters;}
}
