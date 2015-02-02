<!DOCTYPE html>
<%@page import="java.sql.*"%>

<html>


<head>

<meta charset="UTF-8">

<title>CodePen - Multi Step Form with Progress Bar using jQuery
	and CSS3</title>

<link rel="stylesheet" href="css/reset.css">

<link rel="stylesheet" href="css/styleuser.css" media="screen"
	type="text/css" />
	<script type="text/javascript">
	function showCity() {
		var str = document.getElementById("state").value;

		if (str == "") {
			document.getElementById("city").innerHTML = "";
			return;
		}

		if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {
			// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("city").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", "getusercity.jsp?q=" + str, true);
		xmlhttp.send();
	}
	
	
	</script>
	

</head>

<body>

	
	<form action="userregcode.jsp" id="msform" method="post"  enctype="multipart/form-data">
		
		<ul id="progressbar" style="margin-left:70px">
			<li class="active">Register</li>
			<li>Personal Information</li>
			<li>Vehicle Information</li>
			<li>Banking Information</li>
		</ul>
		
		<fieldset>
			<h2 class="fs-title">Create your account</h2>
			<!-- <p class="validate_msg">Please fill all details correctly!</p>-->
			<span id="spanuser" class="username"></span><span id="uniqueuser"></span>
			<input class="username" id="uniqueusername" type="text" name="username" placeholder="Username"  onChange="checkUsername();"/>
             
             <span id="spanemail" class="email"></span> <span id = "uniqueemailcheck"></span>
			 <input type="text" class="email" id="uniqueemail" name="email" placeholder="Email" onchange="checkEmail();" />
			
			 <span class="pass"></span>
			 <input type="password" class="pass" name="pass" placeholder="Password" />
			  
			<span class="cpass"></span>
			<input type="password" class="cpass" name="cpass" placeholder="Confirm Password" /> 
			   
			   <input
				type="button" name="next" class="next action-button" value="Next" />
		</fieldset>
		<fieldset>
			<h2 class="fs-title">Personal Information</h2>
			
			<span class="user_fname"></span>
			<input class="ufname" type="text" name="user_fname" placeholder="First Name" />
			
			<span class="user_mname"></span>
			<input	class="umname" type="text" name="user_mname" placeholder="Middle Name" />
			
			<span class="user_lname"></span>
			<input class="ulname" type="text" name="user_lname" placeholder="Last Name" />
			
			<span id="spanphone" class="contact_no"></span><span id="uniquephonecheck"></span>
			<input type="text" id="ucontact_no" class="c_no" name="contact_no" placeholder="Mobile Number" onchange="checkPhone();" /> 
			
			<span id = "spanaphone" class="alternate_Contact_number"></span><span id="uniqueaphonecheck"></span>
			<input type="text" id="uacontact_no" class="ac_no" name="alternate_Contact_number" value="0" placeholder="Alternate contact number" onchange="checkAPhone();"/> 
			
			<span class="address"></span>
			<input type="text" class="address" name="address" placeholder="Address" /> 
			
			<table>			
			<tr><td>
			<span class="state_name"></span>
			<select class="state" name="state_name" id="state" onChange="showCity()" style="color:#bdbdbd; width:265px;">			
			<%
				try {
					
					Statement st1 = com.Data.connjdbc.getDatacn();
					ResultSet rs2 = st1.executeQuery("select * from state_info");
					out.println("<option value=" + -1 + ">" + "Select State"
							+ "</option>");
					while (rs2.next()) {
						out.println("<option value=" + rs2.getInt(1) + ">"
								+ rs2.getString(2) + "</option>");
						}
					} catch (Exception e) {
						System.err.println(e);
					}
			%>
			</select> 		
			</td>
			<td>		
			<span class="city_name"></span>	
			<div id="city" style="margin-left:20px;">
				<select class = city name="city_name"  style="color:#bdbdbd; width: 295px;" >				
					<option value="-1">Select City</option>
				</select>				
			</div>
			</td>
			</tr>
			</table>
			
			<span class="pin_code"></span>
			<input type="text" name="pin_code" placeholder="Pin code" class="pincode" /> 
			
			<p></p>
			<input type="button" name="previous" class="previous action-button" value="Previous" />
			<input type="button" name="next" class="next1 action-button" value="Next" />
		</fieldset>
		<fieldset>
			<h2 class="fs-title">Vehicle Information</h2>
			
			<select name="vehicle_type">
			<option value ="-1">Select Vehicle Type</option>
			<option value="Car/Van/Jeeps">Car/Van/Jeeps</option>
			<option value="Light Motor Vehicles">Light Motor Vehicles</option>
			<option value="Bus/Trucks" >Bus/Trucks</option>
			<option value="Multi Excel Vehicles">Multi Excel Vehicles</option>
			</select>
			
			<input type="text" name="vehicle_no" placeholder="Vehicle Plate Number" />
			<input type="text" name="rc_book_no" placeholder="RC Book Number" />
			<select name="type_of_transport">
			<option value ="-1">Select Transport Type</option>
			<option value="Public">Public</option>
			<option value="Private">Private</option>
			
			</select>
			<input type="text" name="user_license_no" placeholder="User_license_no" />
			<input  accept="image/*"  type="file" name="licence_photo_path"/>
			 
			<input type="button" name="previous" class="previous action-button" value="Previous" /> 
			<input type="button" name="next" class="next2 action-button" value="Next" />
		</fieldset>
		<fieldset>
			<h2 class="fs-title">Banking Information</h2>
			<input type="text" name="account_no" placeholder="Account_no" /> 
			<input type="text" name="bank_name" placeholder="Bank_name" /> 
			<input type="text" name="bank_branch" placeholder="Bank_branch" />
			<input type="button" name="previous" class="previous action-button" value="Previous" /> 
			<input type="submit" name="submit"  value="Submit" />
		</fieldset>
	</form>

	
	<script src="js/user/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	
	<script src="js/user/jquery.easing.min.js"
		type="text/javascript"></script>

	<script src="js/index.js"></script>

</body>

</html>