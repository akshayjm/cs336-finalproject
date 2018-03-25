<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Mehtallica</title>
</head>
<body>
	<br>
	<h1>Mehtallica Buying/Selling/Renting</h1>
	<form method="post">
		<h3>Log into your Mehtallica Account</h3>
		Username: <input type="text" name="username" pattern="^.{1,}$" required /><br>
		Password: <input type="password" name="password" pattern="^.{1,}$" required /><br>
		<input type="submit" value="Submit" name="login" />
	</form>
	
	<%
	if (request.getParameter("login") != null) {
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			/* 			String entity = request.getParameter("price"); */
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT username, userpassword, first_name FROM User";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			String newUsername = request.getParameter("username");
			String newUserPassword = request.getParameter("password");
			boolean successful = false;
			
			while (result.next()) {
				if (result.getString("username").equals(newUsername)
						&& result.getString("userpassword").equals(newUserPassword)) {
					String redirectURL = "login.jsp?name="+result.getString("first_name");
					response.sendRedirect(redirectURL);
					successful = true;
					break;
				}
			}

			if (!successful) {
				out.print("Login Failed. Please try again!");
			}

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
		
	}
	 %>
	
	<br>
	<br>
	
	Need an Account?
	<form method="post" action="register.jsp">
		<input type="submit" value="Register Here!" />
	</form>
	
</body>
</html>