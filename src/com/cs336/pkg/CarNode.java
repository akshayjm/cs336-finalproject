package com.cs336.pkg;

public class CarNode {
	public String carID;//car's ID
	int parameters; //the number of parameters fulfilled
	public CarNode prev,next;
	
	public CarNode(String car_id) {
		carID = car_id;
		parameters = 0;
	}
	
	public void add() { parameters++;}
	
	public int count() { return parameters;}
}
