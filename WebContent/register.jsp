<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
<link href="./css/form-validation.css" rel="stylesheet">
<title>Register</title>
</head>
<body class="bg-light">
    <div class="container">
      <div class="py-5 text-center">
        <!-- <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
        <h2>Registration Form</h2>
        <!-- <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
      </div>

      <div class="row">
        <div class="col-md-12 order-md-1">
          <form class="needs-validation" novalidate method="post">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">First name</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" name="first_name" pattern="^[A-Za-z]{0,20}$" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Last name</label>
                <input type="text" class="form-control" id="lastName" placeholder="" value="" name="last_name" pattern="^[A-Za-z]{0,20}$" required>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="userName">Username</label>
                <input type="text" class="form-control" id="userName" placeholder="" value="" name="username" pattern="^[a-z0-9]{6,15}$" required>
                <div class="invalid-feedback">
                  Valid username is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="" value="" name="password" pattern="^.{6,20}$" required>
                <div class="invalid-feedback">
                  Valid password is required.
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com" value="" name="email" required>
                <div class="invalid-feedback">
                  Please enter a valid email address.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" placeholder="" value="" name="phone" pattern="^[0-9]{10}$" maxlength="10" required>
                <div class="invalid-feedback">
                  Please enter a valid phone number.
                </div>
              </div>
              <div class="col-md-2 mb-3">
                <label for="age">Age</label>
                <input type="text" class="form-control" id="age" placeholder="" value="" name="age" pattern="^[0-9]{2,3}$" maxlength="3" required>
                <div class="invalid-feedback">
                  Please enter a valid age.
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-5 mb-3">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" placeholder="1234 Main St" value="" name="address" pattern="^\d+\s[A-z]+\s[A-z]+$" required>
                <div class="invalid-feedback">
                  Please enter a valid address.
                </div>
                </div>
              <div class="col-md-3 mb-3">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city" placeholder="" value="" name="city" pattern="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" required>
                <div class="invalid-feedback">
                  Please provide a valid city.
                </div>
              </div>
              <div class="col-md-2 mb-3">
                <label for="state">State</label>
                <input type="text" class="form-control" id="state" placeholder="" value="" name="state" pattern="^[A-Z]{2}$" maxlength="2" required>
                <div class="invalid-feedback">
                  Please provide a valid state.
                </div>
              </div>
              <div class="col-md-2 mb-3">
                <label for="zip">Zip</label>
                <input type="text" class="form-control" id="zip" placeholder="" value="" name="zip" pattern="^[0-9]{5}$" maxlength="5" required>
                <div class="invalid-feedback">
                  Zip code required.
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" name="register" type="submit">Submit</button>
          </form>
        </div>
      </div>

	<%
		if (request.getParameter("register") != null) {
			try {

				//Get the database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();

				//Create a SQL statement
				Statement stmt = con.createStatement();

				String newFirstname = request.getParameter("first_name");
				String newLastname = request.getParameter("last_name");
				String newUsername = request.getParameter("username");
				String newUserpassword = request.getParameter("password");
				String newEmail = request.getParameter("email");
				String newPhone = request.getParameter("phone");
				String newAge = request.getParameter("age");
				String newAddress = request.getParameter("address");
				String newCity = request.getParameter("city");
				String newState = request.getParameter("state");
				String newZipcode = request.getParameter("zip_code");
				boolean successful = true;

				String str = "SELECT username FROM User";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				while (result.next()) {
					if (result.getString("username").equals(newUsername)) {
						out.print("<div class=\"row\">");
						out.print("<div class=\"col-md-12 my-3\">");
						out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
						out.print("<strong>Registration Failed</strong>. Try a different username and submit again!");
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
					String insert = "INSERT INTO User(first_name, last_name, username, userpassword, email, phone, age, address, city, state, zip_code, creation_date)"
							+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);

					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, newFirstname);
					ps.setString(2, newLastname);
					ps.setString(3, newUsername);
					ps.setString(4, newUserpassword);
					ps.setString(5, newEmail);
					ps.setString(6, newPhone);
					ps.setString(7, newAge);
					ps.setString(8, newAddress);
					ps.setString(9, newCity);
					ps.setString(10, newState);
					ps.setString(11, newZipcode);
					DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
					Date date = new Date();
					ps.setString(12, dateFormat.format(date)); //2016/11/16 12:08
					//Run the query against the DB
					ps.executeUpdate();

					out.print("<div class=\"row\">");				
					out.print("<div class=\"col-md-12 my-3\">");				
					out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>Registration Successful</strong>! Click <a href=\"index.jsp\" class=\"alert-link\">here</a> to log in.");
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
				out.print("<strong>Registration Failed</strong>!");
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
          <li class="list-inline-item"><a href="index.jsp">Go to sign in page</a></li>
        </ul>
        <p class="mb-1">&copy; 2018 Mehtallica</p>
      </footer>
    </div>

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