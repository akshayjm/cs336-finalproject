package com.cs336.pkg;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class TextStorage {

	public TextStorage() {
	}

	public void saveToFile(ArrayList<String> arr) {
		try {
			FileWriter writer = new FileWriter("./storage.txt");

			for (int i = 0; i < arr.size(); i++) {
				writer.write(arr.get(i));

				// newline character
				writer.write(String.format("%n"));
			}
			writer.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean check(String sale_num) {
		try {
			Scanner s = new Scanner(new File("./storage.txt"));

			while (s.hasNext()) {
				String str = s.next();
				System.out.println(str);
				if (str.equals(sale_num))
					return true;
			}

			s.close();
			System.out.println("Loaded Successfully");

		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
