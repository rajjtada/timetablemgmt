<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, com.google.gson.Gson, jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<meta charset="UTF-8">
		<title>View Subjects</title>
	</head>
	
	<body>
		<a href="subjectpanel.jsp"><button>Go back to Subject Panel!</button></a>
		<h3>View Subjects!</h3><br>
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
		<table class="table table-striped table-dark" border="1">
	    <thead class="thead-dark">
		      <tr>
		        <th>Day/Time</th>
		        <th id ="1">Subject Name</th>
		        <th id ="2">Subject Code</th>
		        
		      </tr>
	    </thead>
	    
	    <tbody>
	    	
	    
		<%
			String sem = request.getParameter("sem");
			String div = request.getParameter("div");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
			Statement stmt = con.createStatement();
			
			String sql = "SELECT * FROM subjects where semester="+sem+" AND division='"+div+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			int i = 1;
			
			while(rs.next()){
				%><tr>
					<th><%= i %></th>
					<td><%= rs.getString("subject_name") %></td>
					<td><%= rs.getString("subject_code") %></td>
				</tr>
				<%
				i++;
			}
		%>
		</tbody>
	</table>
	</body>
</html>