<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log-In</title>
</head>
<body>
	<br>
	<h1>Car Buying/Selling/Renting</h1>
	<form method="post" action="query.jsp">
		<!-- note the show.jsp will be invoked when the choice is made -->
		<!-- The next lines give HTML for radio buttons being displayed -->
		Enter username: <input type="text" name="username"> <br>
		Enter password: <input type="password" name="password"><br>
		<input type="submit" value="Submit" />
	</form>

	<br> If you are not a user, please register here:
	<form method="post" action="register.jsp">
		Choose username: <input type="text" name="username"> <br>
		Choose password: <input type="password" name="password"><br>
		<input type="submit" value="Register" />
	</form>

</body>
</html>