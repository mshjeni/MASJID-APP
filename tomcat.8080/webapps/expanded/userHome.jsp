<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head> 
	<% //In case, if Admin session is not set, redirect to Login page
	if((request.getSession(false).getAttribute("user")== null) ){%>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%} %>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<title>Masjid App</title>
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
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="?action=userBookList">My Booking</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/LogoutController">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav><br>
	<!-- end of HEADER -->
	
	

	<!-- Slot Category Menu -->
	<div align="center">
	<h4>Slot Category</h4><br>
	  <div class="col-sm-6">
	    <div class="card text-bg-dark">
	      <div class="card-body">
	        <h5 class="card-title">Jumaat Prayer</h5>
	        <a href="UserJumaatController?action=userViewJumaat" class="btn btn-primary">View Slot</a>
	      </div>
	    </div>
	  </div><br>
	  <div class="col-sm-6">
	    <div class="card text-bg-dark">
	      <div class="card-body">
	        <h5 class="card-title">Mengaji Class</h5>
	        <a href="UserMengajiController?action=userViewMengaji" class="btn btn-primary">View Slot</a>
	      </div>
	    </div>
	  </div><br>
	  <div class="col-sm-6">
	    <div class="card text-bg-dark">
	      <div class="card-body">
	        <h5 class="card-title">Umrah</h5>
	        <a href="UserUmrahController?action=userViewUmrah" class="btn btn-primary">View Slot</a>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- End Slot Category Menu -->
	</div><br><br>
</body>
</html>