<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
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
<title>Buying Page</title>
</head>
<%!CarNode head;
	String newMake;
	String newModel;
	String newColor;
	String newCarYear;
	String newCond;
	String newCarType;
	String newPrice;%>

<%!public String username;%>

<%
	username = request.getParameter("username");
%>
<body>

	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-6 col-xs-offset-2">
				<form role="form">
					<fieldset>
						<h3>Search for a car to buy</h3>
						<div class="form-group">
							<p>Select Type</p>
							<select>
								<option value="Convertible">Convertible</option>
								<option value="Coupe">Coupe</option>
								<option value="Crossover">Crossover</option>
								<option value="Hatchback">Hatchback</option>
								<option value="Hybrid">Hybrid</option>
								<option value="Luxury">Luxury</option>
								<option value="Minivan">Minivan</option>
								<option value="Sedan">Sedan</option>
								<option value="Sport">Sport</option>
								<option value="SUV">SUV</option>
								<option value="Truck">Truck</option>
								<option value="Wagon">Wagon</option>
							</select>
						</div>
						<div class="form-group">
							<p>Select Make</p>
							<select>
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
							<p>Type Model</p>
							<input type="text" class="form-control input-lg" id="model"
								name="model" placeholder="Model" pattern="^[A-Za-z]{0,20}$"
								required />
						</div>
						<div class="form-group">
							<!--<input type="text" class="form-control input-lg" id="color" name="color" placeholder="Color" pattern="^[A-Za-z]{0,20}$" required/>-->
							<p>Select Color</p>
							<select name="color">
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
							<p>Select Make</p>
							<select>
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
							<p>Select Condition</p>
							<select>
								<option value="New">New</option>
								<option value="Like New">Like New</option>
								<option value="Good">Good</option>
								<option value="Fair">Fair</option>
								<option value="Poor">Poor</option>
								<option value="For Parts">For Parts</option>
							</select>
						</div>
						<div class="form-group">
							<p>Type Price</p>
							<input type="text" class="form-control input-lg" id="price"
								name="price" placeholder="Price" pattern="^[0-9]{0,10}$"
								required />
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="List"
									class="btn btn-lg btn-success btn-block" value="Submit">
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

				//Get parameters from the HTML form at the HelloWorld.jsp
				newMake = request.getParameter("make");
				newModel = request.getParameter("model");
				newColor = request.getParameter("color");
				newCarYear = request.getParameter("carYear");
				newCond = request.getParameter("cond");
				newCarType = request.getParameter("carType");
				newPrice = request.getParameter("price");
				boolean successful = true;

				String str = "SELECT * FROM Car NATURAL JOIN Listing";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);

				while (result.next()) {
					CarNode node = new CarNode(result.getString("car_id"));
					if (result.getString("make").equals(newMake))
						node.add();
					if (result.getString("model").equals(newModel))
						node.add();
					if (result.getString("color").equals(newColor))
						node.add();
					if (result.getString("carYear").equals(newCarYear))
						node.add();
					if (result.getString("cond").equals(newCond))
						node.add();
					if (result.getString("carType").equals(newCarType))
						node.add();
					if (result.getString("price").equals(newPrice))
						node.add();

					//add to list
					if (head == null) {
						head = node;
					}
					else {
						CarNode temp = head.next;
						CarNode prev = head;
						while (temp != null) {

						//insert between
						if (node.count() > temp.count()) {
							node.prev = temp.prev;
							node.next = temp;
							temp.prev.next = node;
							temp.prev = node;
							break;
						}

						//move on
						else {
							prev = temp;
							temp = temp.next;
						}
						}
						if (temp == null)
							prev.next = node;
						
					}
				}
				//NOW PRINT THE SHIT
				CarNode temp = head;
				result.close();
				while (temp != null) {

					str = "SELECT make, model, color, carYear, cond, carType FROM Car, Listing WHERE Listing.car_id = "
							+ temp.carID + " AND Car.car_id = " + temp.carID;
					//Run the query against the database.
					result = stmt.executeQuery(str);
					result.next();
					
					String tempMake = result.getString("make");
					String tempModel = result.getString("model");
					String tempColor = result.getString("color");
					String tempCarYear = result.getString("carYear");
					String tempCond = result.getString("cond");
					String tempCarType = result.getString("carType");

					System.out.println(temp.carID);
					
					out.print("<div class=\"card\" style=\"width: 18rem;\">");
					out.print("<img class=\"card-img-top\" src=\"...\" alt=\"Card image cap\">");
					out.print("<div class=\"card-body\">");
					out.print("<h5 class=\"card-title\">" + tempMake + " " + tempModel + "</h5>");
					out.print("<p class=\"card-text\">Color: "+tempColor+"<br/>Year: "+tempCarYear+"<br/>");
					out.print("Condition: "+tempCond+"<br/>Type: "+tempCarType+"</p>");
				    out.print("<input type=\"submit\" name=\"buy\" class=\"btn btn-primary\" value=\"Buy\">");
				    out.print("</div>");
					out.print("</div>");
					temp = temp.next;
				}
	%>
	<%
	if (request.getParameter("buy") != null) {
					System.out.println("Are you being pressed");
					//Make a select statement for the Car table:
					String carDelete = "DELETE FROM Car WHERE car_id = '"+head.carID+"'";

					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(carDelete);
					ps.executeUpdate();
					
					String listingDelete = "DELETE FROM Listing WHERE car_id = '"+head.carID+"'";


					PreparedStatement ps2 = con.prepareStatement(listingDelete);

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
					out.print("<strong>Buying Successful</strong>! Click <a href=\"login.jsp?name=" + username
							+ "\" class=\"alert-link\">here</a> to return home.");
					out.print(
							"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");

				}

				//close the connection.
				result.close();
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