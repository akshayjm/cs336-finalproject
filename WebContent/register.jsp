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
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" method="post">
					<fieldset>
						<h3>Register Here</h3>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="username" name="username" placeholder="Username" pattern="^[a-z0-9]{6,15}$" required/>
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-lg" id="password" name="password" placeholder="Password" pattern="^.{6,20}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="first_name" name="first_name" placeholder="First Name" pattern="^[A-Za-z]{0,20}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="last_name" name="last_name" placeholder="Last Name" pattern="^[A-Za-z]{0,20}$" required/>
						</div>
						<div class="form-group">
							<input type="email" class="form-control input-lg" id="email" name="email" placeholder="Email" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="phone" name="phone" placeholder="Phone" pattern="^[0-9]{10}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="age" name="age" placeholder="Age" pattern="^[0-9]{2,3}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="address" name="address" placeholder="Address" pattern="^\d+\s[A-z]+\s[A-z]+$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="city" name="city" placeholder="City" pattern="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="state" name="state" placeholder="State" pattern="^[A-Z]{2}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="zip_code" name="zip_code" placeholder="Zip Code" pattern="^[0-9]{5}$" required/>
						</div>						
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="register" class="btn btn-lg btn-success btn-block" value="Submit">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
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
					out.print("<div class=\"container\">");
					out.print("<div class=\"row\" style=\"margin-top: 20px\">");
					out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Registration Failed</strong>. Try a different username and submit again!");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");   
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
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

/* 				out.print("<br>");
				out.print("Registration Successful! Click the button below to log in.");
				out.print("<form method=\"post\" action=\"index.jsp\">");
				out.print("<input type=\"submit\" value=\"Log In\" />");
				out.print("</form>"); */
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Registration Successful</strong>! Click <a href=\"index.jsp\" class=\"alert-link\">here</a> to log in.");
				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
				out.print("<span aria-hidden=\"true\">&times;</span>");   
				out.print("</button>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
			}

		//close the connection.
		con.close();

		} catch (Exception e) {
			out.print("<div class=\"container\">");
			out.print("<div class=\"row\" style=\"margin-top: 20px\">");
			out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
			out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
			out.print("<strong>Registration Failed</strong>!");
			out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.print("<span aria-hidden=\"true\">&times;</span>");   
			out.print("</button>");
			out.print("</div>");
			out.print("</div>");
			out.print("</div>");
			out.print("</div>");
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