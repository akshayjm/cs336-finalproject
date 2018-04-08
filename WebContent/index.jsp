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
	<link href="./css/signin.css" rel="stylesheet">
	<title>Mehtallica</title>
</head>
<body class="text-center">
    <form class="form-signin">
      <!-- <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
      <h1 class="h1 mb-3 font-weight-bold">Mehtallica</h1>
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="inputEmail" class="sr-only">Username</label>
      <input type="text" id="username" class="form-control" name="username" placeholder="Username" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
      <!-- <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div> -->
      <button class="btn btn-lg btn-success btn-block" name="login" type="submit">Sign In</button>
      <button class="btn btn-lg btn-primary btn-block" name="register" type="button" onclick="location.href = 'register.jsp';">Register</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2018 Mehtallica</p>
	
	<%
	if (request.getParameter("login") != null) {
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
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
				out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" style=\"text-align: left\">");
				out.print("<strong>Login Failed.</strong> Incorrect Credentials!");
				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
				out.print("<span aria-hidden=\"true\">&times;</span>");   
				out.print("</button>");
				out.print("</div>");
			}

			//close the connection.
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		
	} 
	%>
	
	</form>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>