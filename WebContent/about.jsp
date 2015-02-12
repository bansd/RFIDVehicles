<<!DOCTYPE html>
<html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<head>
<%
	try{
%>
<meta charset="utf-8">
<title>Automatic Toll Collection</title>
<meta name="description" content="Automatic toll collection site">
<meta name="author" content="bansari">
<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/userwebstyle.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body>

	<!--------------Header--------------->
	


	<div class="wrap-header">
			<span style="float:right; font-size: medium; margin-top:10px; margin-left:20px; margin-right:20px;"><a href="userlogin.jsp" >  Logout</a></span>
	<span style="float:right; font-size: medium; margin-top:10px; margin-left:20px; margin-right:20px;"><a href="uresetpass.jsp" >Reset password</a></span>
				
		<div id="logo" style="border-bottom: dotted;">
			<span style="margin-left: 30px;"><b>Automatic Toll
					Collection System </b></span>
					<span style="float:right; font-size: medium; margin-top:10px; margin-right:20px;"> Welcome, <%=session.getAttribute("fname")+" "+session.getAttribute("lname") %></span>
		
		</div>

		<nav>
			<ul>
				<li class="current"><a href="userhome.jsp">Home</a></li>
				<li><a href="transaction.jsp">View Transaction</a></li>
				<li><a href="personalinfo.jsp">PROFILE</a></li>
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</div>
	
	<section id="content"
		style="margin-bottom: 40px; padding-bottom: 40px;">
		<div class="zerogrid">

			<div id="main-content">
				<article><p>
				</p>
				<h2 style="text-align: center; background-color: #008866; font-size: 250%; ">
						NETIZEN SOLUTIONS
					</h2>
				<div class="content info"><p></p>
				<table>
							<thead>
								<tr>
									<td colspan="2"><b>Little About Us</b></td>
								</tr>
							</thead>
							
							
							
							</table><b>
							Netizen  Solutions  Ahmedabad  (India)  based  web 
and  software  development  consortium  since  2008. 
Our dedicated and creative human resources have 
always been striving for fulfilling   client's
requirements by providing best IT solutions. We are 
specialized in  providing services in  the field of web 
development and reporting. We believe in  creating 
win-win  situation  with  customers,   vendors  &
partners.
</b>
							</div>
							</article>
							
<article>
					<div class="content info" style="margin-bottom: 30px;">
						<<table>
							<thead>
								<tr>
									<td colspan="2"><b>Vision and Mission</b></td>
								</tr>
							</thead>
							
							
							
							</table><b>
							We will add  value  for  our  customers  by  anticipating 
and  identifying  their  needs  and  providing  costeffective  solutions.  Through  excellent  and  efficient 
service,  we  will  meet  our  customers'  expectations. 
They  will  see  us  as  a  leader  in  the  industry.
We  will  achieve  success  by  adopting  transparent 
and  honest  business  practices  thereby  generating 
immense  goodwill  with  clients,  employees,  our 
vendors  and  society  we  operate  in.</b>

							</div>
							<article>
					<div class="content info" style="margin-bottom: 30px;">
						<<table>
							<thead>
								<tr>
									<td colspan="2"><b>Areas of Expertise......</b></td>
								</tr>
							</thead>
							
							
							
							</table><b>
							*   Web Designing  & Development <br>  *  Mobile Application  Development <br>   *  Software  Development <br>   *  Web Hosting  & Maintenance<br>  *  SEO <br>  *  Live  Project  .</b>

							</div>
							
							
							<article>
					<div class="content info" style="margin-bottom: 30px;">
						<<table>
							<thead>
								<tr>
									<td colspan="2"><b>Our Products......</b></td>
								</tr>
							</thead>
							
							
							
							</table><b>
<br> * Lakshya  CDR  Analyzer  (stand  alone)  <br> *  Lakshya  CDR  Analyzer  (Browser  based) <br> * Analyzer  (Android,  I-Phone  Based)<br> *  CPMS  (Criminal  Profile  Management System) <br>  * SDR  Analyzer  (Mobile  App  ) <br> *  Surveillance  system <br> *  Real  Estate  Management System <br> *  Police  Mitra <br>*  Supply  Chain  Management System <br>*   Job  
							</b><</div>
							
							
							<article>
					<div class="content info" style="margin-bottom: 30px;">
						<<table>
							<thead>
								<tr>
									<td colspan="2"><b>Our Clients......</b></td>
								</tr>
							</thead>
							
							
							
							</table><b>
<br>*   National  Investigation  Agency  HQ,  New  Delhi <br>*   National  Investigation  Agency,  Lucknow <br>*   National  Investigation  Agency,  Guwahati <br>* Director  General  of  Police  (HQ),  Gujarat <br>* Commissioner  of  Police,  Ahmedabad <br>* Local  Crime  Branch  Office, Rajkot <br>*   Crime  Branch,  Ahmedabad <br>*   CID  Crime  and  Railways,  Gandhinagar <br>*   Intelligence  Bureau,  Gandhinagar <br>*   Wild Crime  Control  Bureau,  New  Delhi							</div>
						</article>	</div>
							
							<article>
					<div class="content info" style="margin-bottom: 30px;">
						<<table>
							<thead>
								<tr>
									<td colspan="2"><b>Head Office</b></td>
								</tr>
							</thead>
							
							
							
							</table><b>
A -14 kirtisagarTower,
Nr. Prerna Tirth Derasar,
Jodhpur Gam, Satellite,
Ahmedabad - 380015							</div></article>
<article>
					<div class="content info" style="margin-bottom: 30px;">
						<<table>
							<thead>
								<tr>
									<td colspan="2"><b>Contact</b></td>
								</tr>
							</thead>
							
							
							
							</table><b>
Email : info@netizensolutions.com
netizensolution.gujarat@gmail.com

<br>
Contact: 9724480261						</div>
</
							</section>
							<%
		} catch (Exception e) {
			System.err.println(e);
		}
	%>
</body>
</html>