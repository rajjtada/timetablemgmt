<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, com.google.gson.Gson, jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<meta charset="UTF-8">
		<title>Delete TimeTable</title>
	</head>
	
	<body>
		<a href="admin_timetable.jsp"><button>Go back to TimeTable Management Area!</button></a><br><br>
		<form method="post">
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
			<input type="submit">
		</form><br><br>
		<p id ="show" hidden>TimeTable is deleted!</p>
		
		<%
			String sem = request.getParameter("sem");
			String div = request.getParameter("div");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
			Statement stmt = con.createStatement();
			
			String sql = "DELETE FROM timetables where sem="+sem+" AND division='"+div+"'";
			boolean executionStatus = stmt.execute(sql);

			if(executionStatus == true){
			%>
			<script>
				document.getElementById("show").style.display = "block";
			</script>
			<%}
			
		%>

		
	</body>
</html>