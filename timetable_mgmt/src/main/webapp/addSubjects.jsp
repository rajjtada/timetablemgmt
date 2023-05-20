<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<title>Add Subjects</title>
	</head>
		
	<body>
		<a href="admin_timetable.jsp"><button>Go back to Main Menu!</button></a>
		<h3>Add Subjects!</h3>
		<h3 style="display:inline-block">If you want to see and add subjects side by side!</h3>&nbsp;<a href="addorViewsub.jsp" target="_blank">Click here!</a><br>
		<h2>NOTE: SELECT ALL OPTIONS AND THEN SUBMIT THE FORM!</h2><br>
		
		<form method="post" action="SubjectsUp">
			Select Semester: <select id="semester" name="sem" required>
								  <option value="">Select an option</option>	
								  <option value="1">1</option>
								  <option value="2">2</option>
								  <option value="3">3</option>
								  <option value="4">4</option>
								  <option value="5">5</option>
								  <option value="6">6</option>
							</select><br><br>
		
			Select Division: <select id="div" name="div" required>
								  <option value ="">Select an option</option>	
								  <option value="A">A</option>
								  <option value="B">B</option>
								  <option value="C">C</option>  
							</select><br><br>
			
			Enter Subject Code(GTU): <input type="number" name="gtu_code" required><br><br>
			Enter subject Name(GTU): <input type="text" name="gtu_name" required>  
			*only initials (ADVANCED JAVA = AJAVA)<br><br>
			
			<input type="submit" onclick="return confirm('Are your details confirmed?')">
		</form>
	</body>
</html>