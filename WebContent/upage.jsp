<!DOCTYPE html>
<html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<head>
<%try{ %>
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


	<div class="wrap-header">
		<div id="logo" style="border-bottom: dotted;">
			<span style="margin-left: 30px;"><b>Automatic Toll
					Collection System </b></span>
		</div>

		<nav>
			<ul>
				<li class="current"><a href="userhome.jsp">Home</a></li>
				<li><a href="transaction.jsp">View Transaction</a></li>
				<li><a href="personalinfo.jsp">Personal Information</a></li>
				<li><a href="about.html">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</div>
	
	<section id="content">
		<div class="zerogrid">
			<div class="row">
				<div id="main-content" class="col-left">

					<article>
						<div class=""
							style="margin: 2px; padding: 2px; border: thin; border-color: #27ae60;">							
							<div class="content">
								<table>
									<%										
										String username = session.getAttribute("user_username") + "";
										int user_id = Integer.parseInt(session.getAttribute("user_id")+"");;
										String trans_id = null;
										String vehicleid = null;
										String date = null;
										String toll_amount = null;
										
										Statement st = connjdbc.getDatacn();
										ResultSet rs;
										String str = "SELECT a.transaction_info_id,a.date,a.toll_amount,b.vehicle_no,c.vehicle_in_time, d.city_name, c.vehicle_out_time, e.city_name FROM transaction_info a INNER JOIN vehicle_info b ON a.vehicle_id=b.vehicle_id INNER JOIN vehicle_in_out_info c ON a.vehicle_inout_id=c.vehicle_inout_id INNER JOIN city_info d ON d.city_id=c.vehicle_in_city_id INNER JOIN city_info e ON e.city_id=c.vehicle_out_city_id WHERE a.transaction_info_id="+user_id;
										rs = st.executeQuery(str);
										int i = 0;
										while(rs.next()){ 
									%>
									<thead>
										<tr>
											<td>Sr No</td>
											<td>Vehicle Number</td>
											<td>Date</td>
											<td>From</td>
											<td>To</td>
											<td>Starting Time</td>
											<td>End Time</td>
											<td>Toll Amount</td>
										</tr>
									</thead>
									
									<tr>
										<td><%=++i %></td>
										<td><%=rs.getString(4) %></td>										
										<td><%=rs.getString(2) %></td>										
										<td><%=rs.getString(6) %></td>
										<td><%=rs.getString(8) %></td>
										<td><%=rs.getString(5) %></td>
										<td><%=rs.getString(7) %></td>
										<td><%=rs.getString(3) %></td>
									</tr>
									<%} %>
								</table>
							</div>

						</div>
					</article>
				</div>

			</div>
		</div>
	</section>
<%
} catch (Exception e) {
		System.err.println(e);
}
%>
</body>
</html>