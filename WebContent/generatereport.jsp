<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("logout.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="links.jsp"%>
<link href="css/cssdate/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="js/jsdate/jquery.min.js"></script>
  <script src="js/jsdate/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
    $( "#datepicker" ).datepicker({
    	  dateFormat: "yy-mm-dd"
    	});
    var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
    
 // Setter
 $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
 
 $("#datepicker1").datepicker();
 $( "#datepicker1" ).datepicker({
 	  dateFormat: "yy-mm-dd"
 	});
 var dateFormat = $( "#datepicker1" ).datepicker( "option", "dateFormat" );
 
// Setter
$( "#datepicker1" ).datepicker( "option", "dateFormat", "yy-mm-dd" );

  });
  </script>
</head>
<body>
<%@ include file="header.jsp"%>
	<script type="text/javascript">
		var d = document.getElementById("report");
		d.className = d.className + "active";
	</script>

	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span6">
					<div class="widget widget-nopad">
						<div class="content clearfix">
						<form>
   						<label>From Date:</label>
   						<input id="datepicker" name="from" placeholder="FROM"/>
   						<label>To Date:</label>
   						<input id="datepicker1" name="to" placeholder="TO"/>
   						<input name="submit" value="export to excel">
   						
						</form>
						</div>

						

					</div>
					
				</div>
			</div>
			<!-- /widget -->
		</div>
		<!-- /span6 -->
	</div>
	<!-- /row -->
	
	<!-- /main-inner -->

	<!-- /main -->
	

</body>
</html>