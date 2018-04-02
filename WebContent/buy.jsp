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
							<p>Select Type</p>
							<select>
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
							<input type="text" class="form-control input-lg" id="model" name="model" placeholder="Model" pattern="^[A-Za-z]{0,20}$" required/>
						</div>
						<div class="form-group">
							<p>Type Color</p>
							<input type="text" class="form-control input-lg" id="color" name="color" placeholder="Color" pattern="^[A-Za-z]{0,20}$" required/>
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