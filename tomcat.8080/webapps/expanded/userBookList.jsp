<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Masjid Appointment System</title>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">
	</script>
	
	<script type='text/javascript'>
	function countItems(){
	var rows = document.getElementById('totalSlot');
	var i=0, itemCount=0;
		while(rows.getElementsByTagName('tbody')[i++]){ 
			itemCount++;
		}
	document.write(itemCount);
	}
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
	
	<br><h2 align="center"><font><strong>Booked List</strong></font></h2>
	<br>

	<br><br>
	
	<!-- Create Account  form -->
	<div class="row justify-content-center">
    <div class="col-auto">
	<table id="list" class="table table-striped" id="totalSlot" style="width:100%">
  	<tr>
    <th>Book Id</th>
    <th>Slot</th>
    <th>Booked By</th>
    <th>Booking Date</th>
    <th colspan="2"></th>
  	</tr>
 	<c:forEach items="${bookedSlots}" var="bookedSlot" varStatus="bookedSlots">
  	<tr>
    <td><c:out value="${bookedSlot.bookID}" /></td>
    <td><c:out value="${bookedSlot.slotID}" /></td>
    <td><c:out value="${bookedSlot.userID}" /></td>
    <td><c:out value="${bookedSlot.bookDate}" /></td>    
    <td><a href="delBookingController?bookID=<c:out value="${bookedSlot.bookID}" />" class="btn btn-danger">Cancel Booking</a></td>    
   
	</tr></c:forEach>
	
	<tfoot>
       	<tr><td colspan="4">Total of booked slots: <script>countItems()</script></td></tr>
    </tfoot>
	
	</table>
	</div>
	</div><br>
	
	
	<!-- BACK BUTTON -->
	<div class="mx-auto" style="width: 300px;">
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link active" aria-current="page" href="userHome.jsp">Back to Home</a></li>
	</ul><br><br>
	</div>
	<!-- BACK BUTTON -->
</body>
</html>
