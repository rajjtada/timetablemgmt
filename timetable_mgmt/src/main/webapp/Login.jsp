<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script>
	        var message = "${message}";
	        if (message) {
	            alert(message);
	        }
	        else{
	        	
	        }
    	</script>
	
		<link rel="stylesheet" href="loginn.css">
		<meta charset="UTF-8">
		<title>Time Table Management</title>
	</head>
	
	<body>
		<div id="div_login" >	
			
			<h3 id="title_form">TimeTable Management</h3><br>
			<form method="POST" action="login_check" id="login" >
				 <input type="text" name="u_name" class="form-control" placeholder="Username" required><br>
				 <input type="password" name="pass" class="form-control" placeholder="Password" required><br>
				<button type="submit" class="btn btn-primary btn-block" style="width: 250px">Sign in</button>
			</form>
			
			
		</div>
		
  
	</body>
</html>