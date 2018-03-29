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
	<title>Buying Page</title>
</head>
<body>

<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form">
					<fieldset>
						<h3>Search for a car to buy</h3>
						<div class="form-group">
							<select>
								<option value="hello">Hello</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="make" name="make" placeholder="Make" pattern="^[A-Za-z]{0,20}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="model" name="model" placeholder="Model" pattern="^[A-Za-z]{0,20}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="color" name="color" placeholder="Color" pattern="^[A-Za-z]{0,20}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="carYear" name="carYear" placeholder="Year" pattern="^[0-9]{4}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="cond" name="cond" placeholder="Condition" pattern="^[A-Za-z]{0,20}$" required/>
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg" id="carType" name="carType" placeholder="Type" pattern="^[A-Za-z]{0,20}$" required/>
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
	
	

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>