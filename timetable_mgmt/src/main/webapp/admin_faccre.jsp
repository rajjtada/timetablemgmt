<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="loginn.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<meta charset="UTF-8">
		<title>Student User Creation</title>
	</head>
	
	<body>
		<a href="AdminPanel.jsp"><button>Go back to Main Menu!</button></a>
		<div id="div_login">
		<h3>Create Faculty User</h3><br>
		<form method="post" action="std_usercr">
			<input type="hidden" name="hid" value="F">
			<input type="text" name="std_name" class="form-control" placeholder="Faculty's Name" style="width:250px"><br>
			<input type="number" name="eno" class="form-control" placeholder="Faculty's Login ID" style="width:250px"><br>
			<input type="password" name="pass" class="form-control" placeholder="Password" style="width:250px"><br>
			<button type="submit" onclick="return confirm('Are your details confirmed?')" class="btn btn-primary btn-block" style="width: 250px">Create Student</button>
			
		</form>
		</div>
	</body>
</html>