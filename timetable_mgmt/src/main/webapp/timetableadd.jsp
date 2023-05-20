<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<meta charset="UTF-8">
		<title>Make TimeTable Entries</title>
	</head>
	
	<body onload = "loadFacval()">
		<a href="admin_timetable.jsp"><button>Go to back TimeTable Management Area!</button></a>
		<h3>Timetable creation entries!</h3>
		<h4 style="display:inline-block">Note: You can add entries from timetable entry form and view here directly! (Open in another tab)</h4>
		<a href="adminviewtt.jsp" target="_blank"><button>Click here</button></a><br>
		<h2>NOTE: SELECT ALL OPTIONS AND THEN SUBMIT THE FORM! IN TOP-DOWN FORMAT</h2><br>
		
		<form method="post" action="timeTableEntry">
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
		
			Select Division: <select id="division" name="div" required onchange="subAsperSEM()">
								  <option value="">Select an option</option>	
								  <option value="A">A</option>
								  <option value="B">B</option>
								  <option value="C">C</option>  
							</select><br><br>
			
			Select Subject: <select id="Subject" name="sub" required hidden>
								    <option value="">Select an option</option>
							</select><br><br>
			
			Select Faculty: <select id="faculty" name="fac" required onchange="slotGET()">
									<option value="">Select an option</option>
							</select><br><br>
			
			Select Day: <select id="day" name="weekday" required onchange="slotGET()">
								<option value="">Select an option</option>	
								<option value="Monday">Monday</option>
								<option value="Tuesday">Tuesday</option>
								<option value="Wednesday">Wednesday</option>
								<option value="Thursday">Thursday</option>	
								<option value="Friday">Friday</option>
								<option value="Saturday">Saturday</option>
									
						</select><br><br>
			
			Select Time-Slot: <select id="slot" name="time_slot" required hidden>

									
						</select><br><br>	
			<input type="submit">						
			
		</form>
		
		<script>
			//subjects as per semester loading
			function subAsperSEM() {
	            var sem = document.getElementById("semester").value;
	            var div = document.getElementById("division").value;
	            console.log("subjectssss");
	            var subject = document.getElementById("Subject");
        	    
	            subject.options.length = 0;
	            var option = document.createElement("option");
      	      	option.value = "";
      	      	option.textContent = "Select an option";
      	      	subject.appendChild(option);
	            
	            var xhr = new XMLHttpRequest();
	            xhr.onreadystatechange = function() {
	              if (this.readyState == 4 && this.status == 200) {
	            	  	var options = JSON.parse(this.responseText);
	            	  	console.log(options)
	            	    
	            	  	if(options.length > 0){
		            	    for (var i = 0; i < options.length; i++) {
		            	      var option = document.createElement("option");
		            	      option.value = options[i];
		            	      option.textContent = options[i];
		            	      subject.appendChild(option);
		            	    }
	            	  	}
	            	    subject.style.display = "inline-block"
	            	    options = "";
	              }
	            };
	            console.log("raj");
	            xhr.open("GET", "FetchSubjects?sem=" + sem + "&div="+ div, true);
	            xhr.send();
	        }
			
			function loadFacval(){
				var faculty = document.getElementById("faculty");
        	    
				faculty.options.length = 0;
	            var option = document.createElement("option");
      	      	option.value = "";
      	      	option.textContent = "Select an option";
      	      	faculty.appendChild(option);
      	      	
				var xhr = new XMLHttpRequest();
	            xhr.onreadystatechange = function() {
	              if (this.readyState == 4 && this.status == 200) {
	            	  	var options = JSON.parse(this.responseText);
	            	  	console.log(options)
	            	    
	            	    if(options.length > 0){
		            	    for (var i = 0; i < options.length; i++) {
		            	      var option = document.createElement("option");
		            	      option.value = options[i];
		            	      option.textContent = options[i];
		            	      faculty.appendChild(option);
		            	    }
	              }		}
	            };
	            xhr.open("GET", "getFacform", true);
	            xhr.send();
			}
			
		  function slotGET(){
			  var sem = document.getElementById("semester").value;
			  var div = document.getElementById("division").value;
	          var sub = document.getElementById("Subject").value;
	          var fac = document.getElementById("faculty").value;
	          var day = document.getElementById("day").value;
	          console.log(div);
	          
	          if(sem != '' && div != '' && sub != '' && fac != '' && day != ''){
		          var slot = document.getElementById("slot");
		          slot.options.length = 0;
		          var option = document.createElement("option");
	    	      option.value = "";
	    	      option.textContent = "Select an option";
	    	      slot.appendChild(option);
	    	      
	    	      option = document.createElement("option");
	    	      option.value = "10301130";
	    	      option.textContent = "10:30-11:30";
	    	      option.id = "slot1"
	    	      slot.appendChild(option);
	    	      
	    	      option = document.createElement("option");
	    	      option.value = "11301230";
	    	      option.textContent = "11:30-12:30";
	    	      option.id = "slot2"
	    	      slot.appendChild(option);
	    	      
	    	      option = document.createElement("option");
	    	      option.value = "01000200";
	    	      option.textContent = "01:00-02:00";
	    	      option.id = "slot3"
	    	      slot.appendChild(option);
	    	      
	    	      option = document.createElement("option");
	    	      option.value = "02000300";
	    	      option.textContent = "02:00-03:00";
	    	      option.id = "slot4"
	    	      slot.appendChild(option);
	    	      
	    	      option = document.createElement("option");
	    	      option.value = "03150415";
	    	      option.textContent = "03:15-04:15";
	    	      option.id = "slot5"
	    	      slot.appendChild(option);
	    	      
	    	      option = document.createElement("option");
	    	      option.value = "04150515";
	    	      option.textContent = "04:15-05:15";
	    	      option.id = "slot6"
	    	      slot.appendChild(option);
    	      }
	          else{
	        	  var slot = document.getElementById("slot");
		          slot.options.length = 0;
		          var option = document.createElement("option");
	    	      option.value = "";
	    	      option.textContent = "Select an option";
	    	      slot.appendChild(option);
	          }
	         
	          var xhr = new XMLHttpRequest();
	            xhr.onreadystatechange = function() {
	              if (this.readyState == 4 && this.status == 200) {
	            	  	var options = JSON.parse(this.responseText);
	            	  	console.log(options)
	            	    
	            	  	if(options.length > 0){
		            	  	for (var i = 0; i < options.length; i++) {
			            	      if(options[i] == "10301130"){
			            	    	  document.getElementById("slot1").style.display = "none";
			            	      }
			            	      else if(options[i] == "11301230"){
			            	    	  document.getElementById("slot2").style.display = "none";
			            	      }
			            	      else if(options[i] == "01000200"){
			            	    	  document.getElementById("slot3").style.display = "none";
			            	      }
			            	      else if(options[i] == "02000300"){
			            	    	  document.getElementById("slot4").style.display = "none";
			            	      }
			            	      else if(options[i] == "03150415"){
			            	    	  document.getElementById("slot5").style.display = "none";
			            	      }
			            	      else if(options[i] == "04150515"){
			            	    	  document.getElementById("slot6").style.display = "none";
			            	      }
			            	      
			            	}
	            	  	}
	            	  	document.getElementById("slot").style.display = "inline-block";	
	            	    
	              }
	            };
	            var data = "sem=" + sem + "&div=" + div + "&sub=" + sub + "&fac=" + fac + "&day=" + day;
	            xhr.open("GET", "getSlot?"+ data, true);
	            xhr.send();
	          
	          
		  }		
			
		</script>
		
	</body>
</html>