<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<% //In case, if Admin session is not set, redirect to Login page
	if((request.getSession(false).getAttribute("admin")== null) ){%>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%} %>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<title>Masjid App</title>
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
			<a class="navbar-brand" href="#">MasjidApps</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="AdminJumaatController?action=adminListJumaat">Manage Slot</a></li> 
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="AdminController?action=adminList">Manage Admin</a></li> 
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/LogoutController">Logout</a></li>
					<li class="nav-item"><a class="nav-link">Welcome <%=request.getAttribute("userID") %></a></li>
				</ul>
			</div>
		</div>
	</nav><br>
	<!-- end of HEADER -->
	
	
	
	<!-- NAVBAR FOR SLOT CATEGORY -->
	<div class="mx-auto" style="width: 800px;">
	<h3 class="text-center">MASJID SLOT</h3><br><br>
	<ul class="nav nav-tabs nav-justified">
	<li class="nav-item"><a class="nav-link" href="AdminJumaatController?action=adminListJumaat">Jumaat Prayer</a></li>
	<li class="nav-item"><a class="nav-link active" aria-current="page" href="AdminMengajiController?action=adminListMengaji">Mengaji Class</a></li>
	<li class="nav-item"><a class="nav-link" href="AdminUmrahController?action=adminListUmrah">Umrah/Haji</a></li>
	</ul><br><br>
	</div>
	<!-- END OF NAVBAR -->
	
	
	<!-- BACK BUTTON -->
	<div class="mx-auto" style="width: 300px;">
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link active" aria-current="page" href="adminAddMengaji.jsp">Create New Slot</a></li>
	</ul><br><br>
	</div>
	<!-- END OF BACK BUTTON -->
	
	<div class="mx-auto" style="width: 800px;">
	<!-- MENGAJI LIST TABLE -->
	<table class="table" id="totalSlot">
	  <thead>
	    <tr>
	      <th scope="col">ID</th>
	      <th scope="col">Slot Date</th>
	      <th scope="col">Slot Time</th>
	      <th scope="col">Guru Name</th>
	      <th scope="col">Venue</th>
	      <th colspan="3">Actions</th>
	    </tr>
	  </thead>
	  <c:forEach items="${mcslots}" var="mc" varStatus="mcslots">
	  <tbody>
	    <tr>
	      <td><c:out value="${mc.slotID}" /></td>
	      <td><c:out value="${mc.date}" /></td>
	      <td><c:out value="${mc.time}" /></td>
	      <td><c:out value="${mc.guruname}" /></td>
	      <td><c:out value="${mc.venue}" /></td>
    	  <td><a href="AdminMengajiController?action=adminUpdateMengaji&slotID=<c:out value="${mc.slotID}" />" class="btn btn-primary">Update</a></td>
          <td><input type="hidden" id="slotID-${mcslots.index}" value="<c:out value="${mc.slotID}"/>"><button class="btn btn-danger" onclick="confirmation('${mcslots.index}')">Delete</button></td>    
	    </tr>
	  </tbody>
	  </c:forEach>
	  <tfoot>
       	<tr><td colspan="4">Total of Mengaji Class slots : <script>countItems()</script></td></tr>
      </tfoot>
	</table>
	<!-- END OF MENGAJI LIST TABLE -->
	</div>
	
	<script>
		function confirmation(index){
			  var slotID = $("#slotID-" + index).val();
			 
			  console.log(slotID);
			  var r = confirm("Are you sure you want to delete?");
			  if (r == true) {				 		  
				  location.href = 'AdminMengajiController?action=deleteMengaji&slotID=' + slotID;
				  alert("Slot successfully deleted");			
			  } else {				  
			      return false;	
			  }
		}
	</script>
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</body>
</html>