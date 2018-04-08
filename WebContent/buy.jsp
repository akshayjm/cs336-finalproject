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
	boolean found = false;
	CarNode temp;
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
%>

<%
	if (username != null) {
%>
<body>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-6 col-xs-offset-2">
				<form role="form" method="post">
					<fieldset>
						<h3>Search for a car to buy</h3>
						<div class="form-group">
							<p>Select your car's make below</p>
							<select name="make" id="make"> 
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
								name="model" placeholder="Model" pattern="^.{0,15}$" required />
						</div>
						<div class="form-group">
							<p>Select your car's color below</p>
							<select name="color" id="color">
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
							<select name="carYear" id="carYear">
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
							<select name="cond" id="cond">
								<option value="New">New</option>
								<option value="Like New">Like New</option>
								<option value="Good">Good</option>
								<option value="Fair">Fair</option>
								<option value="Poor">Poor</option>
								<option value="For Parts">For Parts</option>
							</select>
						</div>
						<div class="form-group">
							<p>Select your car's type below</p>
							<select name="carType" id="carType">
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
				System.out.println("Pressed List button");
				try {

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
					temp = null;
					while (result.next()) {
						CarNode node = new CarNode(result.getString("sale_num"));
						//System.out.println("DOES "+result.getString("make")+" EQUAL "+newMake+"????");
						if (result.getString("make").equals(newMake)){
							node.add(11);
						}
						if (result.getString("model").equals(newModel)){
							node.add(9);
						}
						if (result.getString("color").equals(newColor)){
							node.add(2);
						}
						int year = Integer.parseInt(result.getString("carYear"));
						int newYear = Integer.parseInt(newCarYear);
						if (year % newYear < 3 || newYear % year < 3){
							node.add(3);
						}
						if (result.getString("cond").equals(newCond)){
							node.add(2);
						}
						if (result.getString("carType").equals(newCarType)){
							node.add(3);
						}
						if (result.getString("price").equals(newPrice)){
							node.add(1);
						}

						//add to list
						if (head == null) {
							head = node;
						}

						//compare to head
						else if (node.count() > head.count()) {
							node.next = head;
							head = node;
						}

						else {
							temp = head.next;
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
					out.print("<th scope=\"col\">Sale Number</th>");
					out.print("<th scope=\"col\">Make</th>");
					out.print("<th scope=\"col\">Model</th>");
					out.print("<th scope=\"col\">Color</th>");
					out.print("<th scope=\"col\">Year</th>");
					out.print("<th scope=\"col\">Condition</th>");
					out.print("<th scope=\"col\">Type</th>");
					out.print("<th scope=\"col\">Price</th>");
					out.print("<th scope=\"col\">Date Posted</th>");
					out.print("</tr></thead>");

					temp = head;
					CarNode temp2;
					result.close();
					int count = 0;

					ArrayList<String> arr = new ArrayList<String>();
					out.print("<tbody>");
					while (count < 30 && temp != null) {
						
						//add to String array to store temporarily
						arr.add(temp.carID);
						
						str = "SELECT make, model, color, carYear, cond, carType, price, date_posted, sale_num FROM Car NATURAL JOIN Listing WHERE Listing.sale_num = "
								+ "'" + temp.carID + "'";

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
						//System.out.println(temp.carID);

						//Row
						out.print("<tr>");
						//Columns				
						out.print("<td>");
						out.print(temp.carID);
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
					
					//store into file called storage.txt
					TextStorage storage = new TextStorage();
					storage.saveToFile(arr);
					
	%>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div
				class="col-xs-12 col-sm-8 col-md-12 col-sm-offset-2 col-md-offset-3">
				<form role="form" method="post">
					<fieldset>
						<h3>Enter the Sale Number of the car you wish to buy:</h3>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" class="form-control input-lg" id="sale_num"
										name="sale_num" placeholder="Sale Number" pattern="^.{1,}$"
										required />
								</div>
							</div>

							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="buy"
									class="btn btn-sm btn-danger btn-block" value="Buy Listing">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<%
				if (head == null) {
						out.print("<div class=\"container\">");
						out.print("<div class=\"row\" style=\"margin-top: 20px\">");
						out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
						out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
						out.print("<strong>Sorry, no cars exist in the database :(</strong>");
						out.print(
								"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
						out.print("<span aria-hidden=\"true\">&times;</span>");
						out.print("</button>");
						out.print("</div>");
						out.print("</div>");
						out.print("</div>");
						out.print("</div>");
					}
					result.close();

				} catch (Exception e) {
					out.print("<div class=\"container\">");
					out.print("<div class=\"row\" style=\"margin-top: 20px\">");
					out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Purchase Failed</strong>!");
					out.print(e);
					out.print(
							"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}

			} else if (request.getParameter("buy") != null) {
				
				String saleNum = request.getParameter("sale_num");
				System.out.println("Sale Num: "+saleNum);
				
				TextStorage storage = new TextStorage();
				if (true/*storage.check(saleNum)*/){
				
				String str2 = "SELECT email,phone FROM User NATURAL JOIN Listing WHERE username = seller_id AND sale_num = "
						+ saleNum;
				
				String sellerEmail = "";
				String sellerPhone = "";
			
				try{
				Statement stmt2 = con.createStatement();
				ResultSet result = stmt2.executeQuery(str2);
				result.next();
				sellerEmail = result.getString("email");
				sellerPhone = result.getString("phone");
				con.close();
				result.close();
				}
				catch (Exception e){
					System.out.println("Exception found");
					e.getStackTrace();
				}
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Found!</strong> Here's the seller's contact information.<br>");
				out.print("Email: "+sellerEmail+"<br>");
				out.print("Phone: "+sellerPhone);
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
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Please choose a car from the list.</strong>");
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

	<%
		} else {
	%>

<body class="text-center"
	style="height: 100%; display: -ms-flexbox; display: -webkit-box; display: flex; -ms-flex-align: center; -ms-flex-pack: center; -webkit-box-align: center; align-items: center; -webkit-box-pack: center; justify-content: center; padding-top: 40px; padding-bottom: 40px; background-color: #f5f5f5;">
	<form class="form-signin" method="post" action="index.jsp">
		<h1 class="h3 mb-3 font-weight-normal">Please log in before
			buying</h1>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Click
			here to log in</button>
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