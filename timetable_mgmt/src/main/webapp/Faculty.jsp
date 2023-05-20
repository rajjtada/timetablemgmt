<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*, com.google.gson.Gson, jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<meta charset="UTF-8">
		<title>Faculty Area</title>
	</head>
<body>
	<h3 style="display:inline-block">Hello Faculty, here is your timetable for this semester!</h3>
	<a href="Login.jsp"><button>LogOut</button></a><br><br>
	
	
	<table class="table table-striped table-dark" border="1">
	    <thead class="thead-dark">
		      <tr>
		        <th>Day/Time</th>
		        <th id ="1">10:30 - 11:30</th>
		        <th id ="2">11:30 - 12:30</th>
		        <th id ="3">01:00 - 02:00</th>
		        <th id ="4">02:00 - 03:00</th>
		        <th id ="5">03:15 - 04:15</th>
		        <th id ="6">04:15 - 05:15</th>
		      </tr>
	    </thead>
	    
	    <tbody>
	    	<tr>
	    		<th>Monday</th>
	    		<td id="1.1"></td>
	    		<td id="1.2"></td>
	    		<td id="1.3"></td>
	    		<td id="1.4"></td>
	    		<td id="1.5"></td>
	    		<td id="1.6"></td>
	    	</tr>
	    	<tr>
	    		<th>Tuesday</th>
	    		<td id="2.1"></td>
	    		<td id="2.2"></td>
	    		<td id="2.3"></td>
	    		<td id="2.4"></td>
	    		<td id="2.5"></td>
	    		<td id="2.6"></td>
	    	</tr>
	    	<tr>
	    		<th>Wednesday</th>
	    		<td id="3.1"></td>
	    		<td id="3.2"></td>
	    		<td id="3.3"></td>
	    		<td id="3.4"></td>
	    		<td id="3.5"></td>
	    		<td id="3.6"></td>
	    	</tr>
	    	<tr>
	    		<th>Thursday</th>
	    		<td id="4.1"></td>
	    		<td id="4.2"></td>
	    		<td id="4.3"></td>
	    		<td id="4.4"></td>
	    		<td id="4.5"></td>
	    		<td id="4.6"></td>
	    	</tr>
	    	<tr>
	    		<th>Friday</th>
	    		<td id="5.1"></td>
	    		<td id="5.2"></td>
	    		<td id="5.3"></td>
	    		<td id="5.4"></td>
	    		<td id="5.5"></td>
	    		<td id="5.6"></td>
	    	</tr>
	    	<tr>
	    		<th>Saturday</th>
	    		<td id="6.1"></td>
	    		<td id="6.2"></td>
	    		<td id="6.3"></td>
	    		<td id="6.4"></td>
	    		<td id="6.5"></td>
	    		<td id="6.6"></td>
	    	</tr>
	    </tbody>
	</table>
				        
				        
		<%
			
			String sem = request.getParameter("sem");
			String div = request.getParameter("div");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
				Statement stmt = con.createStatement();
				
				HttpSession session1 = request.getSession();
				String fac_id = (String) session1.getAttribute("userid");
				System.out.println(fac_id);
				String sql2 = "SELECT name FROM users where user_name='"+fac_id+"'";
				Statement stmt2 = con.createStatement();
				ResultSet rs2 = stmt2.executeQuery(sql2);
				String username = "";
				while(rs2.next())
				{
					
					username = rs2.getString("name");
				}
				
				System.out.println(username);
				String sql = "SELECT * FROM timetables where faculty='"+username+"'";
				
				ResultSet rs = stmt.executeQuery(sql);
				boolean[] done = new boolean[7];
				 
					while (rs.next()) {
						String subject_code = rs.getString("subject");
						String faculty = rs.getString("faculty");
						String sem1 = rs.getString("sem");
						String div2 = rs.getString("division");
						String sql1 = "SELECT subject_name FROM subjects where subject_code="+subject_code;
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(sql1);
						String day = rs.getString("day");
						String slot = rs.getString("slot");
						String subject = "";
						while(rs1.next())
						{
							subject = rs1.getString("subject_name")+"("+subject_code+")    ("+sem1+div2+")";
						}
						
						if(day.equals("Monday")){
							if(slot.equals("10301130")){
								%><script>
										console.log("<%= day %>")
										document.getElementById("1.1").innerText = "<%= subject %>";
								</script><%	
							}
							else if(slot.equals("11301230")){
								%><script>
								document.getElementById("1.2").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("01000200")){
								%><script>
								document.getElementById("1.3").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("02000300")){
								%><script>
								document.getElementById("1.4").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("03150415")){
								%><script>
								document.getElementById("1.5").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("04150515")){
								%><script>
								document.getElementById("1.6").innerText = "<%= subject %>";
								</script><%
							}
							
						}
						else if(day.equals("Tuesday")){
							if(slot.equals("10301130")){
								%><script>
										
										document.getElementById("2.1").innerText = "<%= subject %>";
								</script><%	
							}
							else if(slot.equals("11301230")){
								%><script>
								document.getElementById("2.2").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("01000200")){
								%><script>
								document.getElementById("2.3").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("02000300")){
								%><script>
								document.getElementById("2.4").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("03150415")){
								%><script>
								document.getElementById("2.5").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("04150515")){
								%><script>
								document.getElementById("2.6").innerText = "<%= subject %>";
								</script><%
							}
							
						}
						else if(day.equals("Wednesday")){
							if(slot.equals("10301130")){
								%><script>
										document.getElementById("3.1").innerText = "<%= subject %>";
								</script><%	
							}
							else if(slot.equals("11301230")){
								%><script>
								document.getElementById("3.2").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("01000200")){
								%><script>
								document.getElementById("3.3").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("02000300")){
								%><script>
								document.getElementById("3.4").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("03150415")){
								%><script>
								document.getElementById("3.5").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("04150515")){
								%><script>
								document.getElementById("3.6").innerText = "<%= subject %>";
								</script><%
							}
							
						}
						else if(day.equals("Thursday")){
							if(slot.equals("10301130")){
								%><script>
										document.getElementById("4.1").innerText = "<%= subject %>";
								</script><%	
							}
							else if(slot.equals("11301230")){
								%><script>
								document.getElementById("4.2").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("01000200")){
								%><script>
								document.getElementById("4.3").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("02000300")){
								%><script>
								document.getElementById("4.4").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("03150415")){
								%><script>
								document.getElementById("4.5").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("04150515")){
								%><script>
								document.getElementById("4.6").innerText = "<%= subject %>";
								</script><%
							}
							
						}
						else if(day.equals("Friday")){
							if(slot.equals("10301130")){
								%><script>
										document.getElementById("5.1").innerText = "<%= subject %>";
								</script><%	
							}
							else if(slot.equals("11301230")){
								%><script>
								document.getElementById("5.2").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("01000200")){
								%><script>
								document.getElementById("5.3").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("02000300")){
								%><script>
								document.getElementById("5.4").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("03150415")){
								%><script>
								document.getElementById("5.5").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("04150515")){
								%><script>
								document.getElementById("5.6").innerText = "<%= subject %>";
								</script><%
							}
							
						}
						else if(day.equals("Saturday")){
							if(slot.equals("10301130")){
								%><script>
										document.getElementById("6.1").innerText = "<%= subject %>";
								</script><%	
							}
							else if(slot.equals("11301230")){
								%><script>
								document.getElementById("6.2").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("01000200")){
								%><script>
								document.getElementById("6.3").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("02000300")){
								%><script>
								document.getElementById("6.4").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("03150415")){
								%><script>
								document.getElementById("6.5").innerText = "<%= subject %>";
								</script><%
							}
							else if(slot.equals("04150515")){
								%><script>
								document.getElementById("6.6").innerText = "<%= subject %>";
								</script><%
							}
							
						}
				
					}
				rs.close();
			    stmt.close();
			    con.close();
					
						}	
						catch(Exception e) {
							System.out.println(e);
						}
		
			%>
			 
				     
 
	</body>
</body>
</html>