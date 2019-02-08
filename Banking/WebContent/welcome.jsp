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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Welcome to FIRST HORIZON BANK</title>
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
		<li class="nav-item active"><a class="nav-link" href="#">MENU</a>
		</li>

		<form action="transfer.jsp">
			<input type="submit" value="MONEY TRANSFER"
				class="btn btn-danger navbar-btn"><br>
		</form>
		<form action="passbook" method="POST">
			<input type="submit" value="PASSBOOK!"
				class="btn btn-danger navbar-btn"><br>
		</form>
		<form action="balance1.jsp">
			<input type="submit" value="BALANCE"
				class="btn btn-danger navbar-btn"><br>
		</form>

		<form action="logout">
			<input type="submit" value="LOGOUT" class="btn btn-danger navbar-btn"><br>
		</form>

	</ul>
	</nav>
	<h3 class="text-center">Hello ${account.name}</h3>

</body>
</html>