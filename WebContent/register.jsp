<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<title>Register Page</title>
</head>
<body>
	<h1>Register Here</h1>
	
	<form method="post" action="register.jsp"><br>
		Username: <input type="text" name="username" pattern="^[a-z0-9]{6,15}$" required /><br>
		Password: <input type="password" name="password" pattern="^.{6,20}$" required /><br>
		First Name: <input type="text" name="first_name" pattern="^[A-Za-z]{0,20}$" required /><br>
		Last Name: <input type="text" name="last_name" pattern="^[A-Za-z]{0,20}$" required /><br>
		Email: <input type="email" name="email" required /><br>
		Phone: <input type="text" name="phone" pattern="^[0-9]{10}$" required /><br>
		Age: <input type="text" name="age" pattern="^[0-9]{2,3}$" required /><br>
		Address: <input type="text" name="address" pattern="^\d+\s[A-z]+\s[A-z]+$" required /><br>
		City: <input type="text" name="city" pattern="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" required /><br>
		State: <input type="text" name="state" pattern="^[A-Z]{2}$" required /><br>
		Zip Code: <input type="text" name="zip_code" pattern="^[0-9]{5}$" required /><br>
		<input type="submit" value="Submit" name="register" />
	</form>
	
	<%
	if (request.getParameter("register") != null) {
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			/* 			String entity = request.getParameter("price"); */
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			/* 			String str = "SELECT * FROM Log_in"; */
			//Run the query against the database.
			/* 			ResultSet result = stmt.executeQuery(str); */

			//Get parameters from the HTML form at the HelloWorld.jsp
			String newFirstname = request.getParameter("first_name");
			String newLastname = request.getParameter("last_name");
			String newUsername = request.getParameter("username");
			String newUserpassword = request.getParameter("password");
			String newEmail = request.getParameter("email");
			String newPhone = request.getParameter("phone");
			String newAge = request.getParameter("age");
			String newAddress = request.getParameter("address");
			String newCity = request.getParameter("city");
			String newState = request.getParameter("state");
			String newZipcode = request.getParameter("zip_code");
			boolean successful = true;
			
			
			String str = "SELECT username FROM User";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			while (result.next()) {
				if (result.getString("username").equals(newUsername)) {
					out.print("Registration Failed. Try a different username and submit again!");
					successful = false;
					break;
				}
			}
			
			if (successful) {
				//Make an insert statement for the Sells table:
				String insert = "INSERT INTO User(first_name, last_name, username, userpassword, email, phone, age, address, city, state, zip_code, creation_date)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newFirstname);
				ps.setString(2, newLastname);
				ps.setString(3, newUsername);
				ps.setString(4, newUserpassword);
				ps.setString(5, newEmail);
				ps.setString(6, newPhone);
				ps.setString(7, newAge);
				ps.setString(8, newAddress);
				ps.setString(9, newCity);
				ps.setString(10, newState);
				ps.setString(11, newZipcode);
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
				Date date = new Date();
				ps.setString(12, dateFormat.format(date)); //2016/11/16 12:08
				//Run the query against the DB
				ps.executeUpdate();

				out.print("<br>");
				out.print("Registration Successful! Click the button below to log in.");
				out.print("<form method=\"post\" action=\"index.jsp\">");
				out.print("<input type=\"submit\" value=\"Log In\" />");
				out.print("</form>");
			}

		//close the connection.
		con.close();

		} catch (Exception e) {
			out.print("Registration Failed.");
		}
	}
	%>

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>