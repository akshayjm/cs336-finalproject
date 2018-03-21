<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Status</title>
</head>
<body>
	<%
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
			/* 			String str = "SELECT * FROM Log_in"; */
			//Run the query against the database.
			/* 			ResultSet result = stmt.executeQuery(str); */

			//Get parameters from the HTML form at the HelloWorld.jsp
			String newUsername = request.getParameter("username");
			String newUserPassword = request.getParameter("password");

			if (newUsername.equals("") || newUsername.equals(null) || newUserPassword.equals("")
					|| newUserPassword.equals(null)) {
				out.print("<h3>");
				out.print("Register Failed.");
				out.print("</h3>");
			} else {
				String str = "SELECT username FROM Log_in";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				while (result.next()) {
					if (result.getString("username").equals(newUsername)) {
						out.print("<h3>");
						out.print("Register Failed.");
						out.print("</h3>");
						break;
					}
				}
				
				//Make an insert statement for the Sells table:
				String insert = "INSERT INTO Log_in(username, userpassword)" + "VALUES (?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newUsername);
				ps.setString(2, newUserPassword);
				//Run the query against the DB
				ps.executeUpdate();

				out.print("<h3>");
				out.print("Register Successful!");
				out.print("</h3>");
			}

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

<!-- 	<form
		action="http://ec2-18-219-160-115.us-east-2.compute.amazonaws.com:8080/cs336-website/">
		<input type="submit" value="Back" />
	</form> -->
</body>
</html>