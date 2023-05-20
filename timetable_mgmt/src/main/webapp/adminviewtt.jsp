<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="loginn.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<meta charset="UTF-8">
		<title>Student View</title>
	</head>
	<body>
		
		<a href="admin_timetable.jsp"><button>Go back TimeTable Management Area</button></a>
		<div id="div_login">
		<h3>TimeTable View Facility</h3><br>
		
		<form action="get_tt_admin.jsp" method="post">
			Select Semester: <select id="semester" name="sem"  required>
								  <option value="">Select an option</option>	
								  <option value="1">1</option>
								  <option value="2">2</option>
								  <option value="3">3</option>
								  <option value="4">4</option>
								  <option value="5">5</option>
								  <option value="6">6</option>
								  <option value="7">7</option>
								  <option value="8">8</option>
							</select><br><br>
		
			Select Division: <select id="division" name="div" required>
								  <option value="">Select an option</option>	
								  <option value="A">A</option>
								  <option value="B">B</option>
								  <option value="C">C</option>  
							</select><br><br>
			<input type="submit">
			
		</form>
		</div>
	</body>
</html>