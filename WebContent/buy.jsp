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

<% if (username != null) { %>
<body>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-6 col-xs-offset-2">
				<form role="form" method="post">
					<fieldset>
						<h3>Search for a car to buy</h3>
						<div class="form-group">
							<p>Select your car's type below</p>
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
							<p>Select your car's make below</p>
							<select>
								<option value="Acura">Acura</option>
								<option value="Alpha Romeo">Alpha Romeo</option>
								<option value="Aptera">Aptera</option>
								<option value="Aston Martin">Aston Martin</option>
 								<option value="Audi">Audi</option>
								<option value="Bentley">Bentley</option>
 								<option value="BMW">BMW</option>
								<option value="Buick">Buick</option>
								<option value="Cadillac">Cadillac</option>
								<option value="Chevrolet">Chevrolet</option>
								<option value="Chevy">Chevy</option>
								<option value="Chrysler">Chrysler</option>
								<option value="Corbin">Corbin</option>
								<option value="Dodge">Dodge</option>
								<option value="Eagle">Eagle</option>
 								<option value="Ferrari">Ferrari</option>
 								<option value="Ford">Ford</option>
								<option value="Geo">Geo</option>
								<option value="GMC">GMC</option>
								<option value="Holden">Holden</option>
 								<option value="Honda">Honda</option>
								<option value="Hummer">Hummer</option>
 								<option value="Hyundai">Hyundai</option>
 								<option value="Infiniti">Infiniti</option>
								<option value="Isuzu">Isuzu</option>
 								<option value="Jaguar">Jaguar</option>
 								<option value="Jeep">Jeep</option>
								<option value="Kia">Kia</option>
								<option value="Land Rover">Land Rover</option>
								<option value="Kia">Honda</option>
 								<option value="Lexus">Lexus</option>
								<option value="Lincoln">Lincoln</option>
								<option value="Lotus">Lotus</option>
								<option value="Maserati">Maserati</option>
								<option value="Maybach">Maybach</option>
 								<option value="Mazda">Mazda</option>
								<option value="Mercedes-Benz">Mercedes-Benz</option>
								<option value="Mercury">Mercury</option>
								<option value="Mitsubishi">Mitsubishi</option>
								<option value="Nissan">Nissan</option>
								<option value="Oldsmobile">Oldsmobile</option>
								<option value="Panoz">Panoz</option>
								<option value="Plymouth">Plymouth</option>
								<option value="Pontiac">Pontiac</option>
								<option value="Mercedes">Mercedes</option>
 								<option value="Porsche">Porsche</option>
								<option value="Ram">Ram</option>
								<option value="Renault">Renault</option>
								<option value="Rolls-Royce">Rolls-Royce</option>
								<option value="Saab">Saab</option>
								<option value="Saturn">Saturn</option>
								<option value="Scion">Scion</option>
								<option value="Spyker">Spyker</option>
								<option value="Studebaker">Studebaker</option>
 								<option value="Subaru">Subaru</option>
								<option value="Suzuki">Suzuki</option>
 								<option value="Tesla">Tesla</option>
 								<option value="Toyota">Toyota</option>
 								<option value="Volkswagon">Volkswagon</option>
								<option value="Volvo">Volvo</option>
							</select>
						</div>
						<div class="form-group">
							<p>Enter your car's model below</p>
							<input type="text" class="form-control input-lg" id="model"
								name="model" placeholder="Model" pattern="^.{0,15}$"
								required />
						</div>
						<div class="form-group">
							<!--<input type="text" class="form-control input-lg" id="color" name="color" placeholder="Color" pattern="^[A-Za-z]{0,20}$" required/>-->
							<p>Select your car's color below</p>
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
							<p>Select your car's make below</p>
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
							<p>Select your car's condition below</p>
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
							<p>Enter your desired price below</p>
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
				head = null;
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
					
					//compare to head
					else if (node.count() > head.count()){
						node.next = head;
						head = node;
					}
					
					else {
						CarNode temp = head.next;
						CarNode prev = head;
						while (temp != null) {

						//insert between
						if (node.count() > temp.count()) {
							node.next = temp;
							prev.next = node;
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
				//NOW PRINT
				
				out.print("<table class=\"table\">");
					out.print("<thead>");
					out.print("<tr>");
					out.print("<th scope=\"col\">Listing Number</th>");
					out.print("<th scope=\"col\">Make</th>");
					out.print("<th scope=\"col\">Model</th>");
					out.print("<th scope=\"col\">Color</th>");
					out.print("<th scope=\"col\">Year</th>");
					out.print("<th scope=\"col\">Condition</th>");
					out.print("<th scope=\"col\">Type</th>");
					out.print("<th scope=\"col\">Price</th>");
					out.print("<th scope=\"col\">Date Posted</th>");
					out.print("</tr></thead>");
					
					
				CarNode temp = head;
				CarNode temp2;
				result.close();
				int count = 0;
				
				out.print("<tbody>");
				while(count < 30 && temp != null){
					
					str = "SELECT Car.car_id, make, model, color, carYear, cond, carType, price, date_posted, Listing.sale_num FROM Car NATURAL JOIN Listing WHERE Listing.car_id = \""
							+ temp.carID + "\" AND Car.car_id = \"" + temp.carID + "\"";
					//String str = "SELECT C.car_id, C.make, C.model, C.color, C.carYear, C.cond, C.carType, L.sale_num, L.price, L.date_posted ";
					/*str += "FROM Car As C, Listing As L WHERE C.car_id = L.car_id AND L.seller_id = \"";
					str += username + "\" ORDER BY date_posted";*/
					//Run the query against the database.
					result = stmt.executeQuery(str);
					result.next();
					
					String tempMake = result.getString("make");
					String tempModel = result.getString("model");
					String tempColor = result.getString("color");
					String tempCarYear = result.getString("carYear");
					String tempCond = result.getString("cond");
					String tempCarType = result.getString("carType");
					String tempPrice = result.getString("price");
					String tempDate = result.getString("date_posted");
					String tempSaleNum = result.getString("Listing.sale_num");

					//System.out.println(temp.carID);
					
					//Row
					out.print("<tr>");
					//Columns				
					out.print("<td>");
					out.print(tempSaleNum);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempMake);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempModel);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempColor);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempCarYear);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempCond);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempCarType);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempPrice);
					out.print("</td>");
					
					out.print("<td>");
					out.print(tempDate);
					out.print("</td>");
					
					out.print("</tr>");
					
					temp = temp.next;
					
					count++;
				}
				out.print("</tbody></table>");
				
/* 				while (temp != null) {

					str = "SELECT make, model, color, carYear, cond, carType, price FROM Car NATURAL JOIN Listing WHERE Listing.car_id = "
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
					String tempPrice = result.getString("price");

					System.out.println(temp.carID);
					
					out.print("<div class=\"card\" style=\"width: 18rem;\">");
					out.print("<img class=\"card-img-top\" src=\"...\" alt=\"Card image cap\">");
					out.print("<div class=\"card-body\">");
					out.print("<h5 class=\"card-title\">" + tempMake + " " + tempModel + "</h5>");
					out.print("<p class=\"card-text\">Color: "+tempColor+"<br/>Year: "+tempCarYear+"<br/>");
					out.print("Condition: "+tempCond+"<br/>Type: "+tempCarType+"<br/>Price: "+tempPrice+"</p>");
				    out.print("<input type=\"submit\" name=\"buy\" class=\"btn btn-primary\" value=\"Buy\">");
				    out.print("</div>");
					out.print("</div>");

				} */
	%>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-12 col-sm-offset-2 col-md-offset-3">
				<form role="form" method="post">
					<fieldset>
						<h3>Enter the Listing Number of the car you wish to buy:</h3>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" class="form-control input-lg" id="sale_num" name="sale_num" placeholder="Listing Number" pattern= "^.{1,}$" required/>
								</div>
							</div>
							
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="buy" class="btn btn-sm btn-danger btn-block" value="Buy Listing">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<%
	if (head == null){
		out.print("<div class=\"container\">");
		out.print("<div class=\"row\" style=\"margin-top: 20px\">");
		out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
		out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
		out.print("<strong>Sorry, no car fits those parameters :(</strong>");
		out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
		out.print("<span aria-hidden=\"true\">&times;</span>");
		out.print("</button>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
	}
	else if (request.getParameter("buy") != null) {
		String saleNum = request.getParameter("sale_num");
		String str2 = "SELECT car_id FROM Car WHERE car_id IN (SELECT car_id FROM Listing WHERE sale_num = \"" + saleNum + "\")";
		Statement stmt2 = con.createStatement();
		ResultSet res = stmt2.executeQuery(str2);
		String vinNum = res.getString("car_id");
		boolean found = false;
		temp = head;
		
		while(temp != null){
			if (temp.carID.equals(vinNum)){
				found = true;
				break;
			}
			temp = temp.next;
		}
		
		if (found) {
					//System.out.println("Are you being pressed");
					//Make a select statement for the Car table:
					String carDelete = "DELETE FROM Car WHERE car_id = '"+vinNum+"'";

					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(carDelete);
					ps.executeUpdate();

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
		}
		else{
			
		}
				//close the connection.
				result.close();
				con.close();

			} catch (Exception e) {
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Purchase Failed</strong>!");
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
      <h1 class="h3 mb-3 font-weight-normal">Please log in before buying</h1>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Click here to log in</button>
    </form>
    
    
    <% } %>

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