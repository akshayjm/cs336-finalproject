<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<title>Mehtallica</title>
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<h2>Buying/Selling/Renting</h2>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form">
					<fieldset>
						<h3>Please Sign In</h3>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="username" name="username" placeholder="Username" pattern= "^.{1,}$" required/>
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-lg" id="password" name="password" placeholder="Password" pattern= "^.{1,}$" required/>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="login" class="btn btn-lg btn-success btn-block" value="Sign In">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="register.jsp" class="btn btn-lg btn-primary btn-block">Register</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
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
					String redirectURL = "login.jsp?name="+result.getString("username");
					response.sendRedirect(redirectURL);
					successful = true;
					break;
				}
			}

			if (!successful) {
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Login Failed.</strong> Please try again!");
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