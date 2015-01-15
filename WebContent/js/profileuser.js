var pcheck = 0;
	function showNewVehicle() {
		var str = 1;
		if (str == "") {
			document.getElementById("destinationcity").innerHTML = "";
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
				document.getElementById("newvehicle").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", "getnewvehicle.jsp?q=" + str, true);
		xmlhttp.send();
	}
	function checkUsername() {
		var str = document.getElementById("username").value;

		if (str == "") {
			document.getElementById("usernameerror").innerHTML = "";
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
				var s = xmlhttp.responseText;	
				pcheck = 0;
				if(s.indexOf("Someone already has that", 3) > -1){
					pcheck = 1;
				}
				document.getElementById("usernameerror").innerHTML = s;
			}
		};
		xmlhttp.open("GET", "getedituniqueusername.jsp?q=" + str, true);
		xmlhttp.send();
	}

	function checkEmail() {
		var str = document.getElementById("email").value;

		if (str == "") {
			document.getElementById("emailerror").innerHTML = "";
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
				var s = xmlhttp.responseText;	
				pcheck = 0;
				if(s.indexOf("Someone already has that", 3) > -1){
					pcheck = 1;
				}
				document.getElementById("emailerror").innerHTML = s;
			}
		};
		xmlhttp.open("GET", "getedituniqueemail.jsp?q=" + str, true);
		xmlhttp.send();
	}
	
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

	jQuery(function($) {	
		
		$("form#pform input[name='submit1']").click(function(){
		var username 		= $("form#pform input[name='username']").val();	
		var fname = $("form#pform input[name='fname']").val();
		var lname = $("form#pform input[name='lname']").val();
		var mname = $("form#pform input[name='mname']").val();
		var address = $("form#pform input[name='address']").val();
		var cno = $("form#pform input[name='cno']").val();
		var acno = $("form#pform input[name='acno']").val();
		var email = $("form#pform input[name='email']").val();
		var pincode =$("form#pform input[name='pincode']").val();
		
		if(username == "") {
			$("span.usernameerror").html("You can't leave this empty.").addClass('validate');
			pcheck = 1;
		} else {
			pcheck = 0;
				$("span.usernameerror").html("");
		}
		if(fname == "") {
			$("span.fnameerror").html("You can't leave this empty.").addClass('validate');
			pcheck = 1;
		} else {
			pcheck = 0;
			$("span.fnameerror").html("");
		}
		
		if(lname == "") {
			$("span.lnameerror").html("You can't leave this empty.");
			pcheck = 1;
		} else {
			$("span.lnameerror").html("");
			pcheck = 0;
		}
		if(mname == "") {
			$("span.mnameerror").html("You can't leave this empty.");
			pcheck = 1;
		} else {
			$("span.mnameerror").html("");
			pcheck = 0;
		}
		if(address == "") {
			$("span.addresserror").html("You can't leave this empty.");
			pcheck = 1;
		} else {
			$("span.addresserror").html("");
			pcheck = 0;
		}
		if(pincode == "") {
			$("span.pincodeerror").html("You can't leave this empty.");
			pcheck = 1;
		} else {
			pcheck = 0;
			$("span.pincodeerror").html("");
		}
		
		if(email == "") {
			$("span.emailerror").html("You can't leave this empty.");
			pcheck = 1;
		} else {
			pcheck = 0;
				$("span.emailerror").html("");
		}
		if(cno == "") {
			$("span.cerrror").html("You can't leave this empty.");
			pcheck = 1;
		} else {
			if(cno.length != 10){
				$("span.cerrror").html("Please enter valid number.");
				pcheck = 1;
			}else{
				$("span.cerrror").html("");
				pcheck = 0;
			}
		}
		if(acno != "" && acno.length != 10) {
			$("span.acerrror").html("Please enter valid number.");
			pcheck = 1;
		} else {
			pcheck = 0;
			$("span.acerrror").html("");
		}	
		
		if(pcheck == 1) { // if have a field is blank, return false
			$("p.validate_msg").slideDown("fast");
			return false;
		}
		
		});
	});