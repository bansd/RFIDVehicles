/* 
Orginal Page: http://thecodeplayer.com/walkthrough/jquery-multi-step-form-with-progress-bar 

*/
//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches
var checkuser = 0, checkemail = 0, checkphone = 0, checkaphone = 0;
function checkUsername() {
	var str = document.getElementById("uniqueusername").value;

	if (str == "") {
		document.getElementById("uniqueuser").innerHTML = "";
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
			
			checkuser = 0;
			if(s.indexOf("Someone already has", 3) > -1){
				$("span.username").html("");
				$("input.username").addClass('validateborder');		
				checkuser = 1;
			}else{
				$("input.username").removeClass('validateborder');
				
			}
			
			document.getElementById("uniqueuser").innerHTML = s;
		}
	};
	xmlhttp.open("GET", "getuniqueusername.jsp?q=" + str, true);
	xmlhttp.send();
}

function checkEmail() {
	var str = document.getElementById("uniqueemail").value;

	if (str == "") {
		document.getElementById("uniqueemailcheck").innerHTML = "";
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
			if(s.indexOf("Someone already has", 3) > -1){	
				document.getElementById("spanemail").innerHTML = "";
				$("input.email").addClass('validateborder');
				checkemail = 1;
			}else{
				$("input.email").removeClass('validateborder');
				checkemail = 0;
			}
			
			document.getElementById("uniqueemailcheck").innerHTML = s;
		}
	};
	xmlhttp.open("GET", "getuniqueemail.jsp?q=" + str, true);
	xmlhttp.send();
}

function checkPhone() {
	var str = document.getElementById("ucontact_no").value;

	if (str == "") {
		document.getElementById("uniquephonecheck").innerHTML = "";
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
			if(s.indexOf("Please choose diff", 3) > -1){
				document.getElementById("spanphone").innerHTML = "";
				$("input.c_no").addClass('validateborder');
				checkphone = 1;
			}else{
				$("input.c_no").removeClass('validateborder');
				checkphone = 0;
			}
			
			document.getElementById("uniquephonecheck").innerHTML = s;
		}
	};
	xmlhttp.open("GET", "getuniquephone.jsp?q=" + str, true);
	xmlhttp.send();
}

function checkAPhone() {
	var str = document.getElementById("uacontact_no").value;

	if (str == "") {
		document.getElementById("uniqueaphonecheck").innerHTML = "";
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
			if(s.indexOf("Please choose diff", 3) > -1){
				document.getElementById("spanaphone").innerHTML = "";
				$("input.ac_no").addClass('validateborder');
				checkaphone = 1;
			}else{
				$("input.ac_no").removeClass('validateborder');
				checkaphone = 0;
			}
			
			document.getElementById("uniqueaphonecheck").innerHTML = s;
		}
	};
	xmlhttp.open("GET", "getuniquephone.jsp?q=" + str, true);
	xmlhttp.send();
}

$(".next").click(function(){
						  
						  
	var validation_holder = 0;
	var username 		= $("form#msform input[name='username']").val();
	var email 		= $("form#msform input[name='email']").val();
	var pass 		= $("form#msform input[name='pass']").val();
	var cpass 		= $("form#msform input[name='cpass']").val();
	var x = email ;
	var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
	
	$("input.username").removeClass('validateborder');
	$("input.email").removeClass('validateborder');
	$("input.pass").removeClass('validateborder');
	$("input.cpass").removeClass('validateborder');
	
	if(username == "") {
		$("span.username").html("Username field is required.").addClass('validate_msg');
		$("input.username").addClass('validateborder');
		validation_holder = 1;
	}else {
		if(username.length<4){
			$("span.username").html("Username length must be greater than 4.").addClass('validate_msg');
			$("input.username").addClass('validateborder');
			validation_holder = 1;
		}
		else{	
			if(checkuser == 1){
				$("input.username").addClass('validateborder');
			}
			$("span.username").html("");
		}
	}	
	if(email == "") {
			$("span.email").html("Email Address is required.").addClass('validate_msg');
			$("input.email").addClass('validateborder');
			validation_holder = 1;
		}else {
			if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
		    	$("span.email").html("Enter valid email address.").addClass('validate_msg');
		    	$("input.email").addClass('validateborder');
				validation_holder = 1;
		    }else{
		    	if(checkemail == 1){
		    		$("input.email").addClass('validateborder');
		    	}
		    	$("span.email").html("");
			}
		}
		
	if(pass == "") {
			$("span.pass").html("Password field is required.").addClass('validate_msg');
			$("input.pass").addClass('validateborder');
			validation_holder = 1;
		}else {
			if(pass.length<2)
			{
				$("span.pass").html("Password length must be greater than 6.");
				$("input.pass").addClass('validateborder');
				validation_holder = 1;
			}
			else {		
				$("span.pass").html("");
			}
		}
	if(cpass == "") {
			$("span.cpass").html("Confirm Password field is required.").addClass('validate_msg');
		$("input.cpass").addClass('validateborder');
			validation_holder = 1;
		} else {
			if(cpass != pass){
				$("span.cpass").html("password doesnot match.").addClass('validate_msg');
				$("input.cpass").addClass('validateborder');
				validation_holder = 1;
			}else{		
				$("span.cpass").html("");
			}
		}
		
			
		if(validation_holder == 1 || checkuser == 1 || checkemail == 1) { // if have a field is blank, return false
			$("p.validate_msg").slideDown("fast");
			return false;
		}else
		{validation_holder = 0;
		if(animating) return false;
	 animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
		}
		
	
});
$(".next1").click(function(){
	
	var validation_holder = 0;
	var user_fname 		= $("form#msform input[name='user_fname']").val();
	var user_mname 		= $("form#msform input[name='user_mname']").val();
	var user_lname 		= $("form#msform input[name='user_lname']").val();
	var contact_no 		= $("form#msform input[name='contact_no']").val();
	var alternate_Contact_number 		= $("form#msform input[name='alternate_Contact_number']").val();
	var address 		= $("form#msform input[name='address']").val();
	var state_name 		= $("form#msform select[name='state_name']").val();
	var city_name 		= $("form#msform select[name='city_name']").val();	
	var pin_code 		= $("form#msform input[name='pin_code']").val();
	
	$("input.ufname").removeClass('validateborder');
	$("input.umname").removeClass('validateborder');
	$("input.ulname").removeClass('validateborder');
	$("input.c_no").removeClass('validateborder');
	$("input.ac_no").removeClass('validateborder');
	$("input.address").removeClass('validateborder');
	$("select.state").removeClass('validateborder');
	$("select.city").removeClass('validateborder');
	$("input.pincode").removeClass('validateborder');
	
	if(user_fname == ""){
		$("span.user_fname").html("First Name is required.").addClass('validate_msg');
		$("input.ufname").addClass('validateborder');
		validation_holder = 1;
	}else{
		$("span.user_fname").html("");
	}
	
	if(user_mname == ""){
		$("span.user_mname").html("Middle Name is required.").addClass('validate_msg');
		$("input.umname").addClass('validateborder');
		validation_holder = 1;
	}else{
		$("span.user_mname").html("");
	}		
	
	if(user_lname == "") {
		$("span.user_lname").html("Last Name is required.").addClass('validate_msg');
		$("input.ulname").addClass('validateborder');
		validation_holder = 1;
	}else{
		$("span.user_lname").html("");
	}
	
	if(contact_no == "") {
		$("span.contact_no").html("Mobile Number is required.").addClass('validate_msg');
		$("input.c_no").addClass('validateborder');
		validation_holder = 1;
	}else {
		var x = contact_no ;
		if(isNaN(x)){
			$("span.contact_no").html("Only numbers allowed.").addClass('validate_msg');
			$("input.c_no").addClass('validateborder');
			validation_holder = 1;
		}else{
			if(contact_no.length < 9){
				$("span.contact_no").html("Invalid contact number.");
				$("input.c_no").addClass('validateborder');
				validation_holder = 1;
			}else {
				if(checkphone == 1){
		    		$("input.c_no").addClass('validateborder');
		    	}
				$("span.contact_no").html("");
			}
		}
	}
									
	
	var y = alternate_Contact_number ;
	if(y.length > 0 ){
		if(isNaN(y)){
			$("span.alternate_Contact_number").html("Only numbers allowed.").addClass('validate_msg');
			$("input.ac_no").addClass('validateborder');
			validation_holder = 1;
		}else{
			if(y.length < 9){
				$("span.alternate_Contact_number").html("Invalid contact number.");
				$("input.ac_no").addClass('validateborder');
				validation_holder = 1;
			}else{
				if(checkaphone == 1){
		    		$("input.ac_no").addClass('validateborder');
		    	}
				$("span.alternate_Contact_number").html("");
			}
		}
	}
	
		
	if(address == "") {		
		$("span.address").html("This field is required.").addClass('validate_msg');
		$("input.address").addClass('validateborder');
		validation_holder = 1;
	}else{
		if(address.length > 199){
			$("span.address").html("Too Long Address").addClass('validate_msg');
			$("input.address").addClass('validateborder');
			validation_holder = 1;
		}
		else
			$("span.address").html("");
	}
													
	if(state_name == "-1") {
		$("span.state_name").html("This field is required.").addClass('validate_msg');
		$("select.state").addClass('validateborder');
		validation_holder = 1;
	}else{
		$("span.state_name").html("");
	}					

	if(city_name == "-1") {
		$("span.city_name").html("This field is required.").addClass('validate_msg');
		$("select.city").addClass('validateborder');
		validation_holder = 1;
	}else{
		$("span.city_name").html("");
	}
											
	if(pin_code == "") {
		$("span.pin_code").html("This field is required.").addClass('validate_msg');
		$("input.pincode").addClass('validateborder');
		validation_holder = 1;
	} else{
		var z = pin_code ;
		if(isNaN(z)){
			$("span.pin_code").html("only numbers allowed.").addClass('validate_msg');	
			$("input.pincode").addClass('validateborder');
			validation_holder = 1;
		} else {
			$("span.pin_code").html("");
		}
	}
											
	if(validation_holder == 1 || checkphone == 1 || checkaphone == 1) { // if have a field is blank, return false
		$("p.validate_msg").slideDown("fast");
		return false;
	}else{
		validation_holder = 0;
		if(animating) return false;
		animating = true;
										
		current_fs = $(this).parent();
		next_fs = $(this).parent().next();
										
		//activate next step on progressbar using the index of next_fs
		$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
										
		//show the next fieldset
		next_fs.show(); 
		//hide the current fieldset with style
		current_fs.animate({opacity: 0}, {
			step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
			}, 
			duration: 800, 
			complete: function(){
				current_fs.hide();
				animating = false;
			}, 
			//this comes from the custom easing plugin
			easing: 'easeInOutBack'
		});
	}
	});

$(".next2").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
	return false;
});
