<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<title>My Cars</title>
</head>

	<%!
		public String username;
	%>
	
	<% 
		username = request.getParameter("username");
	%>

<% if (username != null) { %>
<body>
<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-12 col-sm-offset-2 col-md-offset-3">
				<h1>My Cars</h1>
				
			
				<% 
				try{
					//Get the database connection
					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection();

					//Create a SQL statement
					Statement stmt = con.createStatement();
					Statement stmt2 = con.createStatement();
					
					String str = "SELECT C.car_id, C.make, C.model, C.color, C.carYear, C.cond, C.carType, L.sale_num, L.price, L.date_posted ";
					str += "FROM Car As C, Listing As L WHERE C.car_id = L.car_id AND L.seller_id = \"";
					str += username + "\" ORDER BY date_posted";
					
					ResultSet result = stmt.executeQuery(str);
					
					//out.print("<p>Currently Selling</p>");
					
					out.print("<table class=\"table\">");
					out.print("<thead>");
					out.print("<p>Currently Selling</p>");
					out.print("<tr>");
					out.print("<th scope=\"col\">Listing Number</th>");
					out.print("<th scope=\"col\">VIN Number</th>");
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
					
					String str2 = "SELECT C.car_id, C.make, C.model, C.color, C.carYear, C.cond, C.carType, R.rental_num, R.out_date ";
					str2 += "FROM Car As C, Rental As R WHERE C.car_id = R.car_id AND R.renter_id = \"";
					str2 += username + "\" ORDER BY out_date";
					
					ResultSet result2 = stmt2.executeQuery(str2);
					
					System.out.println(username);
					
					//out.print("<p>Currently Renting</p>");
					
					out.print("<table class=\"table\">");
					out.print("<thead>");
					out.print("<p>Currently Renting</p>");
					out.print("<tr>");
					out.print("<th scope=\"col\">Rental Number</th>");
					out.print("<th scope=\"col\">VIN Number</th>");
					out.print("<th scope=\"col\">Make</th>");
					out.print("<th scope=\"col\">Model</th>");
					out.print("<th scope=\"col\">Color</th>");
					out.print("<th scope=\"col\">Year</th>");
					out.print("<th scope=\"col\">Condition</th>");
					out.print("<th scope=\"col\">Type</th>");
					//out.print("<th scope=\"col\">Price</th>");
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
						
						//out.print("<td>");
						//out.print(result.getString("price"));
						//out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("out_date"));
						out.print("</td>");
						
						out.print("</tr>");
					}
					
					out.print("</tbody></table>");
					con.close();
				}catch (Exception e) {
					out.print("<div class=\"container\">");
					out.print("<div class=\"row\" style=\"margin-top: 20px\">");
					out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>No cars to display!</strong>!");
					out.print(e);
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");   
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				
				
				%>
				
				
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-12 col-sm-offset-2 col-md-offset-3">
				<form role="form" method="post">
					<fieldset>
						<h3>Enter the Listing Number you wish to delete below:</h3>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" class="form-control input-lg" id="sale_num" name="sale_num" placeholder="Listing Number" pattern= "^.{1,}$" required/>
								</div>
							</div>
							
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="delete" class="btn btn-sm btn-danger btn-block" value="Remove Listing">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
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
					out.print("<div class=\"container\">");
					out.print("<div class=\"row\" style=\"margin-top: 20px\">");
					out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Listing Removal Successful</strong>!");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");   
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				else{
					out.print("<div class=\"container\">");
					out.print("<div class=\"row\" style=\"margin-top: 20px\">");
					out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Listing Removal Failed</strong>!");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");   
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				con.close();
			}catch(Exception e){
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Listing Removal Failed</strong>!");
				out.print(e);
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