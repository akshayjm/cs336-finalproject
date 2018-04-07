<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>User Portal</title>
</head>
	
	<%!
		public String name;
		public String username;
		public String sell;
		public String mycars;
		public String rent;
		public String buy;
	%>

	<%
		username = request.getParameter("name");
		sell = "sell.jsp?username=" + username;
		mycars = "mycars.jsp?username=" + username;
		rent = "rent.jsp?username=" + username;
		buy = "buy.jsp?username=" + username;
	%>
	
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the index.jsp
		/* 			String entity = request.getParameter("price"); */
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT username, first_name FROM User";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);

		while (result.next()) {
			if (result.getString("username").equals(username)) {
				name = result.getString("first_name");
			}
		}
	} catch (Exception e) {
	}
	%>

	<% if (username != null) { %>
	<body>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<%
					out.print("<h1>");
						out.print("Welcome Back, ");
						out.print(name);
						out.print("!</h1>");
				%>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<br>
				<h2>
					<a style="color: MEDIUMSEAGREEN;" href="<%=buy%>">Buy</a>
				</h2>
				<br>
				<h2>
					<a style="color: MEDIUMSEAGREEN;" href="<%=sell%>">Sell</a>
				</h2>
				<br>
				<h2>
					<a style="color: MEDIUMSEAGREEN;" href="<%=mycars%>">My Cars</a>
				</h2>
				<br>
				<h2>
					<a style="color: MEDIUMSEAGREEN;" href="<%=rent%>">Rent</a>
				</h2>
				<br>
				<h2>
					<a style="color: crimson;" href="index.jsp">Log out!</a>
				</h2>
			</div>
		</div>
	</div>

	<%
		} else {
	%>

	<body class="text-center"
	style="height: 100%; display: -ms-flexbox; display: -webkit-box; display: flex; -ms-flex-align: center; -ms-flex-pack: center; -webkit-box-align: center; align-items: center; -webkit-box-pack: center; justify-content: center; padding-top: 40px; padding-bottom: 40px; background-color: #f5f5f5;">
	<form class="form-signin" method="post" action="index.jsp">
		<h1 class="h3 mb-3 font-weight-normal">Please log in before viewing user portal</h1>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Click here to log in</button>
	</form>


	<%
		}
	%>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>