<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

</body>
</html>