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
	<link rel="icon" href="./images/favicon.ico">
	<title>My Cars</title>
</head>

	<%!
		public String username;
		public String home;
	%>
	
	<% 
		username = request.getParameter("username");
		home = "login.jsp?name="+username;
	%>

<% if (username != null) { %>
<body>
<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<!-- <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h2>My Cars</h2>
			<!-- <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
		</div>


		<div class="pb-1 text-left">
			<!-- <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h4>Current Selling</h4>
			<!-- <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
		</div>

		<div class="row">
			<div class="col-md-12" style="overflow-x: scroll">


				<!-- <div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-12 col-sm-offset-2 col-md-offset-3">
				<h1>My Cars</h1>
				
			 -->
				<% 
				try{
					//Get the database connection
					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection();

					//Create a SQL statement
					Statement stmt = con.createStatement();
					Statement stmt2 = con.createStatement();
					
					String str = "SELECT C.car_id, C.imageURL, C.make, C.model, C.color, C.carYear, C.cond, C.carType, L.sale_num, L.price, L.date_posted ";
					str += "FROM Car As C, Listing As L WHERE C.car_id = L.car_id AND L.seller_id = \"";
					str += username + "\" ORDER BY date_posted";
					
					ResultSet result = stmt.executeQuery(str);
					
					//out.print("<p>Currently Selling</p>");
					
					out.print("<table class=\"table\">");
					out.print("<thead>");
					out.print("<tr>");
					out.print("<th scope=\"col\">Listing Number</th>");
					out.print("<th scope=\"col\">VIN Number</th>");
					out.print("<th scope=\"col\">Logo</th>");
					out.print("<th scope=\"col\">Make</th>");
					out.print("<th scope=\"col\">Model</th>");
					out.print("<th scope=\"col\">Color</th>");
					out.print("<th scope=\"col\">Year</th>");
					out.print("<th scope=\"col\">Condition</th>");
					out.print("<th scope=\"col\">Type</th>");
					out.print("<th scope=\"col\">Price</th>");
					out.print("<th scope=\"col\">Date Posted</th>");
					out.print("</tr></thead>");
					
					out.print("<tbody>");
					while(result.next()){
						//Row
						out.print("<tr>");
						//Columns
						out.print("<td>");
						out.print(result.getString("sale_num"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("car_id"));
						out.print("</td>");
						
						out.print("<td>");
						out.print("<img src=\""+result.getString("imageURL")+"\" alt=\"\" height=50 width=50>");
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("make"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("model"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("color"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("carYear"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("cond"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("carType"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("price"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("date_posted"));
						out.print("</td>");
						
						out.print("</tr>");
					}
					
					out.print("</thead>");
					out.print("</table>");
					
					%>

			</div>
		</div>

		<div class="pb-1 text-left">
			<!-- <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h4>Current Renting</h4>
			<!-- <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
		</div>

		<div class="row">
			<div class="col-md-12" style="overflow-x: scroll">

				<%
					
					String str2 = "SELECT C.car_id, C.imageURL, C.make, C.model, C.color, C.carYear, C.cond, C.carType, R.rental_num, R.out_date ";
					str2 += "FROM Car As C, Rental As R WHERE C.car_id = R.car_id AND R.renter_id = \"";
					str2 += username + "\" ORDER BY out_date";
					
					ResultSet result2 = stmt2.executeQuery(str2);
					
					out.print("<table class=\"table\">");
					out.print("<thead>");
					out.print("<tr>");
					out.print("<th scope=\"col\">Rental Number</th>");
					out.print("<th scope=\"col\">VIN Number</th>");
					out.print("<th scope=\"col\">Logo</th>");
					out.print("<th scope=\"col\">Make</th>");
					out.print("<th scope=\"col\">Model</th>");
					out.print("<th scope=\"col\">Color</th>");
					out.print("<th scope=\"col\">Year</th>");
					out.print("<th scope=\"col\">Condition</th>");
					out.print("<th scope=\"col\">Type</th>");
					out.print("<th scope=\"col\">Start Date</th>");
					out.print("</tr></thead>");
					
					out.print("<tbody>");
					
					//result2.next();
					
					while(result2.next()){
						//Row
						out.print("<tr>");
						//Columns
						out.print("<td>");
						out.print(result2.getString("rental_num"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("car_id"));
						out.print("</td>");
						
						out.print("<td>");
						out.print("<img src=\""+result2.getString("imageURL")+"\" alt=\"\" height=50 width=50>");
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("make"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("model"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("color"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("carYear"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("cond"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("carType"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("out_date"));
						out.print("</td>");
						
						out.print("</tr>");
					}
					
					out.print("</tbody></table>");
					con.close();
				}catch (Exception e) {
					System.out.println(e);
				}
				%>

			</div>
		</div>

		<hr class="mb-4">

		<form method="post">
			<div class="row">
				<div class="col-md-12">
					<h4><label for="listing">Enter the Listing Number you wish to delete below:</label></h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-4">
					<input type="text" class="form-control" id="listing" placeholder=""
						value="" name="sale_num" required>
				</div>
				<div class="col-md-6">
					<input type="submit" name="delete" class="btn btn-danger btn-block"
						value="Remove Listing">
				</div>

			</div>
		</form>
		<form method="post">
			<div class="row">
				<div class="col-md-12">
					<h4><label for="rental">Enter the Renting Number you wish to delete below:</label></h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<input type="text" class="form-control" id="rental" placeholder=""
						value="" name="rental_num" required>
				</div>
				<div class="col-md-6">
					<input type="submit" name="delete_rental" class="btn btn-danger btn-block"
						value="Remove Rental">
				</div>
			</div>
		</form>
	
	<%
		if(request.getParameter("delete") != null){
			try{
				//Get the database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
	
				//Create a SQL statement
				
				
				String saleNum = request.getParameter("sale_num");
				String deletion = "DELETE FROM Car WHERE Car.car_id IN (SELECT car_id FROM Listing WHERE sale_num = ? AND seller_id = ?)";
				
				PreparedStatement ps = con.prepareStatement(deletion);
				
				ps.setInt(1, Integer.parseInt(saleNum));
				ps.setString(2, username);
				
				int succ = ps.executeUpdate();
				
				
				if(succ > 0){
					out.print("<div class=\"row\">");
					out.print("<div class=\"col-md-12 my-3\">");
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Listing Removal Successful!</strong>");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				else{
					out.print("<div class=\"row\">");
					out.print("<div class=\"col-md-12 my-3\">");
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Listing Removal Failed!</strong> Listing entry not found.");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				con.close();
			}catch(Exception e){
				System.out.println(e);
			}
		}
	
	if(request.getParameter("delete_rental") != null){
		try{
			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			
			java.util.Formatter formatter = new java.util.Formatter();
			
			int sedan = 45;
			int coupe = 60;
			int suv = 75;
			int minivan = 90;
			int truck = 115;
			int rental_days = -1;
			float tax = -1;
			String carType = "";
			
			String rentalNum = request.getParameter("rental_num");
			String deletion_rental = "DELETE FROM Rental WHERE Rental.rental_num = ? AND Rental.renter_id = ?";
			String days = "SELECT DATEDIFF(now(), (SELECT out_date from Rental WHERE rental_num = ?)) AS days";
			String taxes = "SELECT tax_rate FROM State WHERE State.name in(SELECT User.state from User WHERE username = ?)";
			String addToInventory = "UPDATE Car SET inventory = inventory +1 WHERE car_id IN(SELECT car_id FROM Rental where rental_num = ?)";
			String type = "SELECT carType FROM Car Where car_id in(SELECT car_id from Rental where rental_num = ?)";
			
			PreparedStatement ps = con.prepareStatement(deletion_rental);
			PreparedStatement ps2 = con.prepareStatement(addToInventory);
			PreparedStatement ps3 = con.prepareStatement(days);
			PreparedStatement ps4 = con.prepareStatement(taxes);
			PreparedStatement ps5 = con.prepareStatement(type);
					
			ps.setInt(1, Integer.parseInt(rentalNum));
			ps.setString(2, username);
			ps2.setInt(1, Integer.parseInt(rentalNum));
			ps3.setInt(1, Integer.parseInt(rentalNum));
			ps4.setString(1, username);
			ps5.setString(1, rentalNum);
			//ps.setString(2, username);
			
			ResultSet days_rented = ps3.executeQuery();
			ResultSet tax_rate = ps4.executeQuery();
			ResultSet car_type = ps5.executeQuery();
			
			int succ2 = ps2.executeUpdate();
			int succ = ps.executeUpdate();
			
			
			if(succ > 0 && succ2 > 0){
				while(days_rented.next()){
					rental_days = Integer.parseInt(days_rented.getString("days"));
				}
				
				while(tax_rate.next()){
					tax = Float.parseFloat(tax_rate.getString("tax_rate"));
				}
				while(car_type.next()){
					carType = car_type.getString("carType");
				}
				
				if(carType.equals("Sedan")){
					float finalPrice = sedan*rental_days;
					finalPrice = finalPrice + finalPrice*tax;

					
					if(rental_days == 0){
						finalPrice = sedan + sedan*tax;
					}

					out.print("<div class=\"row\">");
					out.print("<div class=\"col-md-12 my-3\">");
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Your Amount Due Is: </strong>$");
					out.print(formatter.format("%.2f", finalPrice));
					out.print(".<br>Click <a href=\"mycars.jsp?username="+username+"\" class=\"alert-link\">here</a> to refresh.");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				if(carType.equals("Coupe")){
					float finalPrice = coupe*rental_days;
					finalPrice = finalPrice + finalPrice*tax;

					
					if(rental_days == 0){
						finalPrice = coupe + coupe*tax;
					}
					
					out.print("<div class=\"row\">");
					out.print("<div class=\"col-md-12 my-3\">");
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Your Amount Due Is: </strong>$");
					out.print(formatter.format("%.2f", finalPrice));
					out.print(".<br>Click <a href=\"mycars.jsp?username="+username+"\" class=\"alert-link\">here</a> to refresh.");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				if(carType.equals("SUV")){
					float finalPrice = suv*rental_days;
					finalPrice = finalPrice + finalPrice*tax;
					
					if(rental_days == 0){
						finalPrice = suv + suv*tax;
					}
					
					
					out.print("<div class=\"row\">");
					out.print("<div class=\"col-md-12 my-3\">");
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Your Amount Due Is: </strong>$");
					out.print(".<br>Click <a href=\"mycars.jsp?username="+username+"\" class=\"alert-link\">here</a> to refresh.");
					out.print(formatter.format("%.2f", finalPrice));
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				if(carType.equals("Minivan")){
					float finalPrice = minivan*rental_days;
					finalPrice = finalPrice + finalPrice*tax;

					
					if(rental_days == 0){
						finalPrice = minivan + minivan*tax;
					}
					

					out.print("<div class=\"row\">");
					out.print("<div class=\"col-md-12 my-3\">");
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Your Amount Due Is: </strong>$");
					out.print(formatter.format("%.2f", finalPrice));
					out.print(".<br>Click <a href=\"mycars.jsp?username="+username+"\" class=\"alert-link\">here</a> to refresh.");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				if(carType.equals("Truck")){
					float finalPrice = truck*rental_days;
					finalPrice = finalPrice + finalPrice*tax;

					
					if(rental_days == 0){
						finalPrice = truck + truck*tax;
					}
					

					out.print("<div class=\"row\">");
					out.print("<div class=\"col-md-12 my-3\">");
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Your Amount Due Is: </strong>$");
					out.print(formatter.format("%.2f", finalPrice));
					out.print(".<br>Click <a href=\"mycars.jsp?username="+username+"\" class=\"alert-link\">here</a> to refresh.");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
			}
			else{
				out.print("<div class=\"row\">");
				out.print("<div class=\"col-md-12 my-3\">");
				out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Renting Removal Failed!</strong> Renting entry not found.");
				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
				out.print("<span aria-hidden=\"true\">&times;</span>");
				out.print("</button>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
			}
			
			formatter.close();
			con.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	%>
	
		<footer class="mt-5 pt-5 text-muted text-center text-small">
      <ul class="list-inline">
          <li class="list-inline-item"><a href="<%=home%>">Go to home page</a></li>
        </ul>
        <p class="mb-1">&copy; 2018 Mehtallica</p>
      </footer>
		</div>
	
	<% } else { %>
	
	    <body class="text-center" style="height: 100%; display: -ms-flexbox;
  display: -webkit-box;
  display: flex;
  -ms-flex-align: center;
  -ms-flex-pack: center;
  -webkit-box-align: center;
  align-items: center;
  -webkit-box-pack: center;
  justify-content: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;">
    <form class="form-signin" method="post" action="index.jsp">
      <h1 class="h3 mb-3 font-weight-normal">Please log in before viewing your cars</h1>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Click here to log in</button>
    </form>
    
    
    <% } %>

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>