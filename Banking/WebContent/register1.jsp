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
		String r = (String) request.getAttribute("registerError");
	%>
	<%
		if (r.equals("usernameexists")) {
	%>

	<div class="alert alert-info">
		<strong>The username already exists!</strong> Please enter another
		username.
	</div>

	<%
		} else if (r.equals("NoName")) {
	%>
	<div class="alert alert-info">
		<strong>Please enter Name</strong>
	</div>
	<%
		} else if (r.equals("NoEmail")) {
	%>
	<div class="alert alert-info">
		<strong>Please enter Email</strong>
	</div>
	<%
		} else if (r.equals("NoMobile")) {
	%>
	<div class="alert alert-info">
		<strong>Please enter Mobile Number</strong>
	</div>
	<%
		} else if (r.equals("NoUserName")) {
	%>
	<div class="alert alert-info">
		<strong>Please enter Username</strong>
	</div>
	<%
		} else if (r.equals("NoPassword")) {
	%>
	<div class="alert alert-info">
		<strong>Please enter Password</strong>
	</div>
	<%
		} else if (r.equals("errorEmail")) {
	%>
	<div class="alert alert-warning">
		<strong>Invalid Email!</strong>
	</div>
	<%
		} else if (r.equals("errorMobile")) {
	%>
	<div class="alert alert-warning">
		<strong>Invalid Mobile Number</strong>
	</div>
	<%
		} else if (r.equals("errornewPassword")) {
	%>
	<div class="alert alert-warning">
		<strong>Weak Password</strong>
		<ul>
			<li>Must be atleast 8 characters</li>
			<li>Must have atleast one number</li>
			<li>Must have atleast one special character(!,@,#,$,%,^)</li>
			<li>Must have atleast one UPPERCASE character</li>
			<li>Must have atleast one LOWERCASE character</li>

		</ul>
	</div>
	<%
		}
	%>

	<h1 class="text-center">FIRST HORIZON BANK</h1>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header ">
					<h3 class="text-center">Register FH Account</h3>
				</div>
				<div class="card-body">
					<form action="register" method="POST">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-user-plus"></i></span>
							</div>

							<input type="text" name="name" placeholder="Full Name">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-envelope"></i></span>
							</div>
							<input type="text" name="emailid" placeholder="EmailId">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-mobile"></i></span>
							</div>
							<input type="number" name="mobile" placeholder="Mobile Number">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="newusername" placeholder="Username">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="text" name="newpassword" placeholder="Password">
						</div>
						<div class="form-group">
							<div class="d-flex justify-content-center mt-3 login_container">
								<input type="submit" value="REGISTER" class="btn btn-info">
							</div>
						</div>
					</form>

					<div class="card-footer">
						<div class="d-flex justify-content-center links">
							Already have an Account? <a href="start.html">Login</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>