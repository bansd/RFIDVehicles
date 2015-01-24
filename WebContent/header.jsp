<%-- 
    Document   : header.jsp
    Created on : Dec 26, 2014, 1:32:27 PM
    Author     : Bansari
--%>

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"><span class="icon-bar"></span><span
				class="icon-bar"></span><span class="icon-bar"></span> </a><span
				class="brand">Automatic Toll Collection System</span>

			<!--/.nav-collapse -->
		</div>
		<!-- /container -->
	</div>
	<!-- /navbar-inner -->
</div>
<!-- /navbar -->
<div class="subnavbar">
	<div class="subnavbar-inner">
		<div class="container">
			<ul class="mainnav">
				<li id="state" class=""><a href="state.jsp"><span>Manage
							State</span> </a></li>
				<li id="city" class=""><a href="city.jsp"><span>Manage
							City</span> </a></li>
				<li id="message" class=""><a href="message.jsp"><span>
							Message Content</span> </a></li>
				<li id="email" class=""><a href="email.jsp"><span>
							Email Content</span> </a></li>
				<li id = "toll" class=""><a href="toll.jsp" class=""><span>Manage Toll Tax</span></a></li>
				<li id = "rfid" class=""><a href="rfidreceiver.jsp" class=""><span>RFID Receivers</span></a></li>
				<li id = "transaction" class=""><a href="viewtransaction.jsp" class=""><span>View Transaction</span></a></li>
				<li id = "report" class=""><a href="generatereport.jsp" class=""><span>Report</span></a></li>
				<li><a href="adminresetpassword.jsp" class=""><span>Reset
							Password</span></a></li>
				<li><a href="logout.jsp"><span>Logout</span></a></li>
			</ul>
		</div>
		<!-- /container -->
	</div>
	<!-- /subnavbar-inner -->
</div>
