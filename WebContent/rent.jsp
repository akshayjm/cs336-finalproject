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
<body>
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Renting</h1>
      <p class="lead">Car Types</p>
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
            <button type="button" class="btn btn-lg btn-block btn-primary">Select</button>
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
            <button type="button" class="btn btn-lg btn-block btn-primary">Select</button>
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
            <button type="button" class="btn btn-lg btn-block btn-primary">Select</button>
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
            <button type="button" class="btn btn-lg btn-block btn-primary">Select</button>
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
            <button type="button" class="btn btn-lg btn-block btn-primary">Select</button>
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
            <button type="button" class="btn btn-lg btn-block btn-primary">Contact us</button>
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