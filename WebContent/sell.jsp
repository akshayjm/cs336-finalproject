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
	<title>Listing Page</title>
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
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" method="post">
					<fieldset>
						<h3>Sell your car here</h3>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="car_id" name="car_id" placeholder="Enter VIN" pattern="^[a-zA-Z0-9]{17}$" maxlength="17" required/>
						</div>
						<div class="form-group">
							<!--<input type="text" class="form-control input-lg" id="make" name="make" placeholder="Make" pattern="^[A-Za-z]{0,20}$" required/>-->
							<p>Select Make</p>
							<select name="make" class="form-control">
								<option value="Audi">Audi</option>
								<option value="BMW">BMW</option>
								<option value="Ferrari">Ferrari</option>
								<option value="Ford">Ford</option>
								<option value="Honda">Honda</option>
								<option value="Hyundai">Hyundai</option>
								<option value="Infiniti">Infiniti</option>
								<option value="Jaguar">Jaguar</option>
								<option value="Jeep">Jeep</option>
								<option value="Kia">Honda</option>
								<option value="Lexus">Lexus</option>
								<option value="Mazda">Mazda</option>
								<option value="Mercedes">Mercedes</option>
								<option value="Porsche">Porsche</option>
								<option value="Subaru">Subaru</option>
								<option value="Tesla">Tesla</option>
								<option value="Toyota">Toyota</option>
								<option value="Volkswagon">Volkswagon</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="model" name="model" placeholder="Model" pattern="^.{0,15}$" required/>
						</div>
						<div class="form-group">
							<!--<input type="text" class="form-control input-lg" id="color" name="color" placeholder="Color" pattern="^[A-Za-z]{0,20}$" required/>-->
							<p>Select Color</p>
							<select name="color" class="form-control">
								<option value="Blue">Blue</option>
								<option value="Red">Red</option>
								<option value="Yellow">Yellow</option>
								<option value="Green">Green</option>
								<option value="Black">Black</option>
								<option value="Grey">Grey</option>
								<option value="White">White</option>
								<option value="Brown">Brown</option>
								<option value="Pink">Pink</option>
							</select>
							
						</div>
						<div class="form-group">
							<!--<input type="text" class="form-control input-lg" id="carYear" name="carYear" placeholder="Year" pattern="^[0-9]{4}$" required/>-->
							<p>Select Year</p>
							<select name="carYear" class="form-control">
								<option value="2000">2000</option>
								<option value="2001">2001</option>
								<option value="2002">2002</option>
								<option value="2003">2003</option>
								<option value="2004">2004</option>
								<option value="2005">2005</option>
								<option value="2006">2006</option>
								<option value="2007">2007</option>
								<option value="2008">2008</option>
								<option value="2009">2009</option>
								<option value="2010">2010</option>
								<option value="2011">2011</option>
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
							</select>
						</div>
						<div class="form-group">
							<!--<input type="text" class="form-control input-lg" id="cond" name="cond" placeholder="Condition" pattern="^[A-Za-z]{0,20}$" required/>-->
							<p>Select Condition</p>
							<select name="cond" class="form-control">
								<option value="New">New</option>
								<option value="Like New">Like New</option>
								<option value="Good">Good</option>
								<option value="Fair">Fair</option>
								<option value="Poor">Poor</option>
								<option value="For Parts">For Parts</option>
							</select>
						</div>
						<div class="form-group">
							<!--<input type="text" class="form-control input-lg" id="carType" name="carType" placeholder="Type" pattern="^[A-Za-z]{0,20}$" required/>-->
							<p>Select Type</p>
							<select name="carType" class="form-control">
								<option value="Sedan">Sedan</option>
								<option value="Hatchback">Hatchback</option>
								<option value="SUV">SUV</option>
								<option value="Truck">Truck</option>
								<option value="Minivan">Minivan</option>
								<option value="Coupe">Coupe</option>
								<option value="Wagon">Wagon</option>
								<option value="Convertible">Convertible</option>
								<option value="Sport">Sport</option>
								<option value="Crossover">Crossover</option>
								<option value="Luxury">Luxury</option>
								<option value="Hybrid">Hybrid</option>
							</select>
						</div>			
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="price" name="price" placeholder="Price" pattern="^[0-9]{0,10}$" required/>
						</div>			
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="List" class="btn btn-lg btn-success btn-block" value="Submit">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	<%
	if (request.getParameter("List") != null) {
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
			String newCar_id = request.getParameter("car_id");
			String newMake = request.getParameter("make");
			String newModel = request.getParameter("model");
			String newColor = request.getParameter("color");
			String newCarYear = request.getParameter("carYear");
			String newCond = request.getParameter("cond");
			String newCarType = request.getParameter("carType");
			String newPrice = request.getParameter("price");
			String newInventory = "-1";
			boolean successful = true;
			
			String str = "SELECT car_id FROM Car";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			while (result.next()) {
				if (result.getString("car_id").equals(newCar_id)) {
					out.print("<div class=\"container\">");
					out.print("<div class=\"row\" style=\"margin-top: 20px\">");
					out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Registration Failed</strong>. Your car is already in the database!");
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
				String carInsert = "INSERT INTO Car(car_id, make, model, color, carYear, cond, carType, inventory)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(carInsert);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newCar_id);
				ps.setString(2, newMake);
				ps.setString(3, newModel);
				ps.setString(4, newColor);
				ps.setString(5, newCarYear);
				ps.setString(6, newCond);
				ps.setString(7, newCarType);
				ps.setString(8, newInventory);
				
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
				Date date = new Date();
				//2016/11/16 12:08
				//Run the query against the DB
				ps.executeUpdate();
				
				String listingInsert = "INSERT INTO Listing(sale_num, car_id, seller_id, price, date_posted, sale_date) VALUES(?, ?, ?, ?, ?, ?)";
				PreparedStatement ps2 = con.prepareStatement(listingInsert);
				
				String counter = "SELECT COUNT(car_id) As Counter FROM Listing";
				ResultSet countInit = stmt.executeQuery(counter);
				countInit.next();
				int sale_num = Integer.parseInt(countInit.getString("Counter"));
				sale_num++;
				
				
				ps2.setString(1, Integer.toString(sale_num)); 
				ps2.setString(2, newCar_id);
				ps2.setString(3, username);
				ps2.setString(4, newPrice);
				ps2.setString(5, dateFormat.format(date));
				ps2.setString(6, dateFormat.format(date));
				
				ps2.executeUpdate();
				
/* 				out.print("<br>");
				out.print("Listing Successful!");
				out.print("<form method=\"post\" action=\"index.jsp\">");
				out.print("<input type=\"submit\" value=\"Log In\" />");
				out.print("</form>"); */
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Listing Successful</strong>! Click <a href=\"login.jsp?name="+username+"\" class=\"alert-link\">here</a> to return home.");
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
			out.print("<strong>Listing Failed</strong>!");
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
      <h1 class="h3 mb-3 font-weight-normal">Please log in before renting</h1>
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