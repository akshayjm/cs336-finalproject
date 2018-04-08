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
	<link href="./css/form-validation.css" rel="stylesheet">
	<link rel="icon" href="./images/favicon.ico">
	<title>Listing Page</title>
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
<body class="bg-light">
    <div class="container">
      <div class="py-5 text-center">
        <!-- <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
        <h2>Selling Form</h2>
        <!-- <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
      </div>

      <div class="row">
        <div class="col-md-12 order-md-1">
          <form class="needs-validation" novalidate method="post">
            <div class="row">
              <div class="col-md-12 mb-3">
                <label for="car_id">Enter VIN</label>
                <input type="text" class="form-control" id="car_id" name="car_id" placeholder="Enter VIN" pattern="^[a-zA-Z0-9]{17}$" maxlength="17" value="" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
            </div>

            <div class="row">
            <div class="col-md-6 mb-3">
                <label for="make">Select Make</label>
                <select name="make" class="custom-select d-block w-100" id="make" required>
                  <option value="">Choose...</option>
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
                <div class="invalid-feedback">
                  Please select a make.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="mode">Enter Model</label>
                <input type="text" class="form-control" id="model" placeholder="" value="" name="model" pattern="^.{0,15}$" required>
                <div class="invalid-feedback">
                  Valid model is required.
                </div>
              </div>
            </div>

            <div class="row">
             <div class="col-md-3 mb-3">
                <label for="color">Select Color</label>
                <select name="color" class="custom-select d-block w-100" id="color" required>
                  <option value="">Choose...</option>
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
                <div class="invalid-feedback">
                  Please select a color.
                </div>
              </div>
              <div class="col-md-3 mb-4">
                <label for="year">Select Year</label>
                <select name="carYear" class="custom-select d-block w-100" id="year" required>
                  <option value="">Choose...</option>
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
                <div class="invalid-feedback">
                  Please select a year.
                </div>
              </div>
            	<div class="col-md-3 mb-4">
                <label for="condition">Select Condition</label>
                <select name="cond" class="custom-select d-block w-100" id="condition" required>
                  <option value="">Choose...</option>
                  <option value="New">New</option>
								<option value="Like New">Like New</option>
								<option value="Good">Good</option>
								<option value="Fair">Fair</option>
								<option value="Poor">Poor</option>
								<option value="For Parts">For Parts</option>
                </select>
                <div class="invalid-feedback">
                  Please select a condition.
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="type">Select Type</label>
                <select name="carType" class="custom-select d-block w-100" id="type" required>
                  <option value="">Choose...</option>
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
                <div class="invalid-feedback">
                  Please select a type.
                </div>
              </div>
            </div>
            <div class="row">
            		<div class="col-md-12 mb-3">
            			<label for="price">Enter Price</label>
            			<div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">$</span>
                </div>
                <input type="text" class="form-control" id="price" placeholder="" value="" name="price" pattern="^[0-9]{0,10}$" required>
                <div class="invalid-feedback" style="width: 100%;">
                  Valid price required.
                </div>
              </div>
            		</div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-success btn-lg btn-block" name="List" type="submit">Submit</button>
          </form>
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
					out.print("<div class=\"row\">");				
					out.print("<div class=\"col-md-12 my-3\">");				
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Listing Failed!</strong> Your car is already in the database.");
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");
					out.print("</button>");
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
				
				String listingInsert = "INSERT INTO Listing(sale_num, car_id, seller_id, price, date_posted) VALUES(?, ?, ?, ?, ?)";
				PreparedStatement ps2 = con.prepareStatement(listingInsert);
				
				String counter = "SELECT MAX(sale_num) As Counter FROM Listing";
				ResultSet countInit = stmt.executeQuery(counter);
				countInit.next();
				int sale_num = Integer.parseInt(countInit.getString("Counter"));
				sale_num++;
				
				
				ps2.setString(1, Integer.toString(sale_num)); 
				ps2.setString(2, newCar_id);
				ps2.setString(3, username);
				ps2.setString(4, newPrice);
				ps2.setString(5, dateFormat.format(date));
				
				ps2.executeUpdate();
				
				out.print("<div class=\"row\">");				
				out.print("<div class=\"col-md-12 my-3\">");				
				out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Listing Successful!</strong>");
				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
				out.print("<span aria-hidden=\"true\">&times;</span>");
				out.print("</button>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
			}

		//close the connection.
		con.close();

		} catch (Exception e) {
			System.out.println(e);
			/* out.print("<div class=\"row\">");
			out.print("<div class=\"col-md-12 my-3\">");
			out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
			out.print("<strong>Listing Failed!</strong>");
			out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.print("<span aria-hidden=\"true\">&times;</span>");
			out.print("</button>");
			out.print("</div>");
			out.print("</div>");
			out.print("</div>"); */
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
      <h1 class="h3 mb-3 font-weight-normal">Please log in before selling</h1>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Click here to log in</button>
    </form>
    
    
    <% } %>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
</body>
</html>