<!DOCTYPE html>
<html>
<head>
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

  });
  </script>
</head>
<body>
<form>
    <input id="datepicker" />
</form>
</body>
</html>