<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html>
<head>
<% //In case, if User session is not set, redirect to Login page
	if((request.getSession(false).getAttribute("user")== null) ){%>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%} %>
<meta charset="ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Masjid Appointment System</title>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">
	</script>
</head>

<body>
	<!-- HEADER -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">MasApp</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="userHome.jsp">Home</a></li> 
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="UserBookJumaatController?action=userBookList">My Booking</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/LogoutController">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav><br>
	<!-- end of HEADER -->
	
	
	
	
	<br><h2 align="center"><font><strong>Book Jumaat Prayer Slot</strong></font></h2>
	<br><br><br>
	
	<!-- Create Account  form -->	
	<div class="mx-auto" style="width: 800px;">
	<form class="row g-3" action="UserBookJumaatController" method="POST">
		<div class="col-12">
			<label for="slotID" class="form-label">Slot ID</label>
			<input type="text" class="form-control" name="slotID" id="slotID" value="<c:out value="${jumaatPrayer.slotID}"/>" readonly>
		</div>
		<div class="col-12">
			<label for="date" class="form-label">Date</label>
			<input type="date" class="form-control" name="date" id="date" value="<c:out value="${jumaatPrayer.date}"/>" readonly>
		</div>
		<div class="col-12">
			<label for="khutbahTitle" class="form-label">Khutbah Title</label>
			<input type="text" class="form-control" name="khutbahTitle" id="khutbahTitle" value="<c:out value="${jumaatPrayer.khutbahTitle}"/>" readonly>
		</div>
		<div class="col-12">
			<label for="userID" class="form-label">user ID</label>
			<input type="text" class="form-control" name="userID" id="userID" placeholder="User IC" required>
		</div>
		<div class="col-6 d-grid gap-3">
			<button type="submit" class="btn btn-primary">Book Now!</button>
		</div>
		<div class="col-6 d-grid gap-3">
			<button type="reset" class="btn btn-outline-primary">Reset</button>
		</div>
	</form><br>
	</div>
	
	
	<!-- BACK BUTTON -->
	<div class="mx-auto" style="width: 300px;">
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link active" aria-current="page" href="UserJumaatController?action=userViewJumaat">Back</a></li>
	</ul><br><br>
	</div>
	<!-- BACK BUTTON -->
</body>
</html>
