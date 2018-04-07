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
	<link href="./css/renting.css" rel="stylesheet">
	<title>Mehtallica</title>
</head>

	<%! 
		public int sedanInventory;
	%>

<body>
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Renting</h1>
      <p class="lead">Please select a car type:</p>
    </div>
    
    <div class="container">
      <div class="card-deck mb-3 text-center">
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Sedan</h4>
          </div>
          <img class="card-img-top" src="./images/sedan_cropped.png" alt="Card image sedan">
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$45 <small class="text-muted">/ day</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Up to 4 passengers</li>
              <li>Automatic Drive</li>
              <li>For short commutes</li>
              <li>Up to 200 HP</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#sedanModal">Select</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Coupe</h4>
          </div>
          <img class="card-img-top" src="./images/coupe.png" alt="Card image coupe">
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$60 <small class="text-muted">/ day</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Up to 3 passengers</li>
              <li>Automatic or Manual Drive</li>
              <li>For sporty commutes</li>
              <li>Up to 300 HP</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#coupeModal">Select</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">SUV</h4>
          </div>
          <img class="card-img-top" src="./images/suv.png" alt="Card image coupe">
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$75 <small class="text-muted">/ day</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Up to 4 passengers</li>
              <li>Automatic Drive</li>
              <li>For comfortable commutes</li>
              <li>Up to 250 HP</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#SUVModal">Select</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Minivan</h4>
          </div>
          <img class="card-img-top" src="./images/minivan.png" alt="Card image coupe">
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$90 <small class="text-muted">/ day</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Up to 6 passengers</li>
              <li>Automatic Drive</li>
              <li>For spacious commutes</li>
              <li>Up to 225 HP</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#minivanModal">Select</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Pick-up Truck</h4>
          </div>
          <img class="card-img-top" src="./images/pickup.png" alt="Card image coupe">
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$115 <small class="text-muted">/ day</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Up to 4 passengers</li>
              <li>Automatic or Manual Drive</li>
              <li>For tough jobs</li>
              <li>Up to 450 HP</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#pickupModal">Select</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Luxury</h4>
          </div>
          <img class="card-img-top" src="./images/luxury.png" alt="Card image coupe">
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$150+ <small class="text-muted">/ day</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Up to 1 passengers</li>
              <li>Automatic or Manual Drive</li>
              <li>For the ultimate experience</li>
              <li>Up to 600 HP</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#luxuryModal">Contact us</button>
          </div>
        </div>
      </div>
    </div>
    
<!--     Button trigger modal
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>
 -->
	<!--Sedan Modal -->
	<div class="modal fade" id="sedanModal" tabindex="-1" role="dialog" aria-labelledby="sedanModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="sedanModalLabel">Sedan</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
					
					<div class="container">
						<div class="row">
							<div class="col">
								<p class="lead">Current Inventory: 
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
						    			String str = "SELECT inventory FROM Car WHERE Car.car_id=\"sedanforrent11111\"";
						    			//Run the query against the database.
						    			ResultSet result = stmt.executeQuery(str);
						    			
						    			result.next();
						    		
						    			sedanInventory = Integer.parseInt(result.getString("inventory"));
						    			out.print(sedanInventory);
					
						    			//close the connection.
						    			
						    			con.close();
					
						    		} catch (Exception e) {
						    		}
						      	%>
						      	</p>
						      	</div>
						      	</div>
						      	<div class="row">
						      	<div class="col">
						      		<%
							    			if (sedanInventory > 0) {
							    				out.print("<form role=\"form\" onsubmit=\"return false\" method=\"post\">");
							    				out.print("<button type=\"submit\" class=\"btn btn-info\" name=\"sedan_submit\">Click here to book!</button>");
							    				out.print("</form>");
							    			}
							    			else {
							    				out.print("<p class=\"lead\">Sorry, we are all out of this rental type.</p>");
							    			}
						      		
						      		if (request.getParameter("sedan_submit") != null) {
						    			try {
						    			System.out.println("I sdran");
						    			//Get the database connection
						    			ApplicationDB db = new ApplicationDB();
						    			Connection con = db.getConnection();

						    			//Create a SQL statement
						    			Statement stmt = con.createStatement();
						    			//Get the combobox from the index.jsp
						    			/* 			String entity = request.getParameter("price"); */
						    			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
						    			String str = "UPDATE Car Set inventory = inventory - 1 WHERE Car.car_id=\"sedanforrent11111\"";
						    			//Run the query against the database.
						    			stmt.executeUpdate(str);
						    			
						    			out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
										out.print("<strong>Booking Succeed</strong>");
										out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
										out.print("<span aria-hidden=\"true\">&times;</span>");   
										out.print("</button>");
										out.print("</div>");
						    			
						    			//close the connection.
						    			
						    			con.close();

						    		} catch (Exception e) {
						    			out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
										out.print("<strong>Booking Failed.</strong> Please try again!");
										out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
										out.print("<span aria-hidden=\"true\">&times;</span>");   
										out.print("</button>");
										out.print("</div>");
						    			System.out.println(e);
						    		}
						    		}
						      		%>
						      	</div>
						      	</div>
							</div>
						</div>
					
	      	<!-- </p> -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%
	
	%>
	
	<!--Coupe Modal -->
	<div class="modal fade" id="coupeModal" tabindex="-1" role="dialog" aria-labelledby="coupeModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="coupeModalLabel">Coupe</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<p class="lead">Current Inventory: 
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
	    			String str = "SELECT inventory FROM Car WHERE Car.car_id=\"sedanforrent11111\"";
	    			//Run the query against the database.
	    			ResultSet result = stmt.executeQuery(str);
	    			
	    			int inventory;
	    			
	    			while (result.next()) {
	    				inventory = Integer.parseInt(result.getString("inventory"));
	    				out.print(inventory);
	    			}

/* 	    			if (!successful) {
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
	    			} */

	    			//close the connection.
	    			con.close();

	    		} catch (Exception e) {
	    		}
	      	%>
	      	</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--SUV Modal -->
	<div class="modal fade" id="SUVModal" tabindex="-1" role="dialog" aria-labelledby="SUVModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="SUVModalLabel">SUV</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!--Minivan Modal -->
	<div class="modal fade" id="minvanModal" tabindex="-1" role="dialog" aria-labelledby="minivanModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="minivanModalLabel">Minivan</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--Pickup Truck Modal -->
	<div class="modal fade" id="truckModal" tabindex="-1" role="dialog" aria-labelledby="truckModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="truckModalLabel">Pickup Truck</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--Luxury Modal -->
	<div class="modal fade" id="luxuryModal" tabindex="-1" role="dialog" aria-labelledby="luxuryModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="luxuryModalLabel">Luxury Option</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<p class="lead">Please contact us at: (732)-997-9395 to book a Luxury Rental.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--Coupe Modal -->
	<div class="modal fade" id="sedanModal" tabindex="-1" role="dialog" aria-labelledby="sedanModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="sedanModalLabel">Sedan</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
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