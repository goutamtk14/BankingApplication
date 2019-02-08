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
<title>First Horizon Bank</title>
</head>
<body>
	<h1 class="text-center">FIRST HORIZON BANK</h1>
	<%
		String pass = (String) request.getAttribute("t");

		if (pass.equals("Invalid Password")) {
	%>
	<div class="alert alert-danger">
		<strong>Invalid Password!</strong> ${remainingattempts} attempts left.
	</div>
	<%
		} else if (pass.equals("Invalid Username")) {
	%>
	<div class="alert alert-danger">
		<strong>Invalid Username!</strong>
	</div>
	<%
		} else if (pass.equals("Success")) {
	%>
	<div class="alert alert-success">
		<strong>Registration Successful!</strong>
	</div>
	<%
		} else if (pass.equals("NoUserName")) {
	%>
	<div class="alert alert-danger">
		<strong>Please enter Username!</strong>
	</div>
	<%
		}else if (pass.equals("NoPassword")) {
	%>
	<div class="alert alert-danger">
		<strong>Please enter Password</strong>
	</div>
	<%} %>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header ">
					<h3 class="text-center">Login</h3>
				</div>
				<div class="card-body">

					<form action="login" method="POST">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="username" placeholder="Username*">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="password" placeholder="Password*">
						</div>
						<div class="form-group">
							<div class="d-flex justify-content-center mt-3 login_container">
								<input type="submit" value="LOGIN" class="btn btn-primary">
							</div>
						</div>
					</form>

					<div class="card-footer">
						<div class="d-flex justify-content-center links">
							New user? <a href="register.jsp">Register your account</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>