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
<title>First Money Transfer</title>
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
		<li class="nav-item active"><a class="nav-link" href="#">TRANSFER</a>
		</li>

		<form action="welcome.jsp">
			<input type="submit" value="MENU" class="btn btn-danger navbar-btn"><br>
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
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header ">
					<h3 class="text-center">First Money Transfer</h3>
				</div>
				<div class="card-body">
					<form action="transfer" method="POST">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-user-plus"></i></span>
							</div>



							<input type="number" name="bankaccount"
								placeholder="Receiver's Bank Account Number">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fas fa-money-bill-alt"></i></span>
							</div>
							<input type="number" name="amount" placeholder="Amount">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-comments"></i></span>
							</div>
							<input type="text" name="particular"
								placeholder="What's this for?">
						</div>
						<div class="form-group">
							<div class="d-flex justify-content-center mt-3 login_container">
								<input type="submit" value="SEND" class="btn btn-info">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<br>

</body>
</html>