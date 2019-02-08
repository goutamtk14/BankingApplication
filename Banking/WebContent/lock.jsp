<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Horizon Bank</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies.
	%>
	<h1 class="text-center">FIRST HORIZON BANK</h1>
	<div class="alert alert-danger">
		<strong>Your account is locked!</strong>Please contact the bank!
	</div>
<div class="form-group">
							<div class="d-flex justify-content-center mt-3 login_container">
	<form action="start.html">
		<pre>
	Login with a different account? <input type="submit" value="LOGIN" class="btn btn-info">
	</pre>
	</form>
	</div></div>
	<br>
	<div class="form-group">
							<div class="d-flex justify-content-center mt-3 login_container">
	<form action="register.jsp">
		Don't have a account?<input type="submit" value="REGISTER" class="btn btn-info">

	</form>
	</div></div>
</body>
</html>