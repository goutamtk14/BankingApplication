<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>First Horizon Passbook</title>
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
		<li class="nav-item active"><a class="nav-link" href="#">PASSBOOK</a>
		</li>

		<form action="welcome.jsp">
			<input type="submit" value="MENU" class="btn btn-danger navbar-btn"><br>
		</form>
		<form action="balance.jsp" method="POST">
			<input type="submit" value="BALANCE"
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
	<br>
	<h3 class="text-center">Hello ${account.name}</h3>
	<br>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Date and Time</th>
					<th>Particulars</th>
					<th>Withdrawal</th>
					<th>Deposit</th>
					<th>Balance</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${entries}" var="e">
					<tr>
						<td>${e.dateandtime}</td>
						<td>${e.particulars}</td>
						<td>${e.withdrawal}</td>
						<td>${e.deposit}</td>
						<td>${e.balance}</td>
					</tr>
				</c:forEach>
			</tbody>


		</table>
	</div>
	<br>

</body>
</html>