<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FIRST HORIZON BANK</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies.
	%>
	<%
		if (session.getAttribute("u") == null) {
			response.sendRedirect("start.html");
		}
	%>
	<h1 class="text-center">FIRST HORIZON BANK</h1>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item active"><a class="nav-link" href="#">BALANCE</a>
		</li>

		<form action="welcome.jsp">
			<input type="submit" value="MENU" class="btn btn-danger navbar-btn"><br>
		</form>
		<form action="passbook" method="POST">
			<input type="submit" value="PASSBOOK!"
				class="btn btn-danger navbar-btn"><br>
		</form>
		<form action="transfer.jsp">
			<input type="submit" value="TRANSFER"
				class="btn btn-danger navbar-btn"><br>
		</form>

		<form action="logout">
			<input type="submit" value="LOGOUT" class="btn btn-danger navbar-btn"><br>
		</form>

	</ul>
	</nav>
	<br>Hello ${account.name}
	<br>
	<%
		if (request.getAttribute("transfer").equals("Transaction successful")) {
	%>
	<div class="alert alert-success">
		<strong>Transaction Successful!</strong>
	</div>
	<%
		} else if (request.getAttribute("transfer").equals("Error")) {
	%>
	<div class="alert alert-warning">
		<strong> Error: Your account is not having sufficient funds!</strong>
	</div>
	<%
		} else if (request.getAttribute("transfer").equals("ErrorReceiver")) {
	%>
	<div class="alert alert-danger">
		<strong>Invalid account!</strong> The entered Account number doesn't
		exist in FIRST HORIZON BANK.
	</div>

	<%
		}
	%>
	<h5 class="text-center">Your account balance is ${account.balance}</h5>
	<br>
	<br>



</body>
</html>