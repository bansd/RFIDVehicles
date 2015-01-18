
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("adminlogin.jsp");
	}
%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
	try {
		Statement st = connjdbc.getDatacn();
		ResultSet rs = null;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Toll Price</title>
<%@ include file="links.jsp"%>
<script>
	function showOriginCity() {
		var str = document.getElementById("originstate").value;
		var ocityid = <%=origincityid %>;
		if (str == "") {
			document.getElementById("origincity").innerHTML = "";
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
				document.getElementById("origincity").innerHTML = xmlhttp.responseText;
				//document.getElementById("destinationcity").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", "getorigincity.jsp?q=" + str+"&city="+ocityid, true);
		xmlhttp.send();
	}
	function showDestCity() {
		
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<li><a href="state.jsp" onselect=""><span>Manage State</span>
	</a></li>
	<li><a href="city.jsp"></i><span>Manage City</span> </a></li>
	
	<li class="active"><a href="toll.jsp"><span>Manage Toll
				Tax</span></a></li>
	
	</ul>
	</div>
	<!-- /container -->
	</div>
	<!-- /subnavbar-inner -->
	</div>
	
	<center>
		<table style="width: 100%">

			<tr>

				<td style="float: left">
					<div id="edittrue">
						<form action="tollcode.jsp">
							<table>
								<tr>
									<td>
										<div class="field"
											style="float: left; position: relative; margin-left: 20px">
											<label for="state_name">Origin State:</label> <select
												name="state_name" id="originstate"
												onChange="showOriginCity()">
												<option>Select State</option>
												<%
													ArrayList<Integer> ids = new ArrayList<Integer>();
													ArrayList<String> state_name = new ArrayList<String>();
													rs = st.executeQuery("select * from state_info");
													while (rs.next()) {%>
														<option  value="<%=rs.getInt(1)%>">
															<%=rs.getString(2)%></option>
												
												<%		ids.add(rs.getInt(1));
														state_name.add(rs.getString(2));
													}
													rs.close();
												%>
											</select>
										</div>
										<div class="field"
											style="float: left; position: relative; margin-left: 20px">
											<div id="origincity">
												<label for="city_name">Origin City:</label> <select
													name="origin_city_name" id="ocity"
													onChange="showDestCity()">
													<option value="-1">Select City</option>
													
												</select>
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td>
										<div class="field"
											style="float: left; position: relative; margin-left: 20px">
											<label for="state_name">Destination State:</label> <select
												name="state_name" id="destinationstate"
												onChange="showDestCity()">
												<option>Select State</option>
												
											</select>
										</div>
										<div class="field">
											<div
												style="width: 100px; border: 0px solid gray; float: left; position: relative; margin-left: 20px">
												<label for="destination_city_name">Destination City:</label>
												<div id="destinationcity">
													<select name="destination_city_name" id="dcity">
														<option value="-1">Select City</option>
														
													</select>
												</div>
											</div>
										</div>

									</td>
								</tr>
								<tr>
									<td>
										<div class="field" style="margin-left: 20px">
											<label for="vehicle_type">Vehicle type:</label> <select
												name="vehicle_type" class="login">
												<option   value="Car/Van/Jeeps">Car/Van/Jeeps</option>
												<option value="Light Motor Vehicles">Light Motor
													Vehicles</option>
												<option value="Bus/Trucks" >Bus/Trucks</option>
												<option value="Multi Excel Vehicles">Multi Excel
													Vehicles</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="field"
											style="float: left; position: relative; margin-left: 20px">
											<label for="travel_type">Travel Type: </label> <input
												type="radio" name="travel_type"  value="One_way" >One_way
											&nbsp; &nbsp; &nbsp;&nbsp; <input type="radio"
												name="travel_type" value="Round_trip">Round_trip
										</div>

										<div class="field"
											style="float: left; position: relative; margin-left: 70px">
											<label for="transport_type">Transport Type: </label> <input
												type="radio" name="transport_type" value="Private" >Private
											&nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" 
												name="transport_type" value="Public" >Public

										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="field" style="margin-left: 20px">
											<b><label for="toll_amount">Toll amount:</label></b> <input
												type="text" id="Toll_amount" name="toll_amount"
												placeholder="Enter Toll amount"  class="login">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="field" style="margin-left: 20px">
											<input type="submit" name="submit" value="Add" %>
												class="button btn btn-primary btn-large">
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
						<%} catch (Exception e) {								
						}
						%>

				</td>
			</tr>
			<tr>
				<td align="center">
					<%
						try {
																Statement st = com.Data.connjdbc.getDatacn();
					%>
					<div class="widget-header" style="margin-top: 50px">
						<div style="float: left;">
							<i class="icon-th-list"></i>
							<h3>TOLL INFORMATION</h3>
						</div>
						<a href="#clear" class="clear-filter" title="clear filter"
							style="float: right; margin: 4px;">[clear]</a> <input
							id="filter1" type="text" placeholder="Search Here"
							style="float: right; margin: 5px;" />

					</div> <!-- /widget-header -->
					<div class="widget-content"
						style="padding: 0px; margin: 0px; margin-bottom: 50px;">

						<div class="tab-pane active" id="demo">

							<table class="table demo one" style="padding: 0px; margin: 0px;"
								data-filter="#filter1" data-page-size="50">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Vehicle Type</th>
										<th>Origin City</th>
										<th>Destination City</th>
										<th>Travel Type</th>
										<th>Type Of Transport</th>
										<th>Toll Amount</th>

										<th>Edit/Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
										ResultSet rs = st.executeQuery("SELECT a.vehicle_type_id,a.vehicle_type,b.city_name,c.city_name,a.travel_type,a.type_of_transport,a.toll_amount FROM tolltax_cost_per_vehicle a INNER JOIN city_info b ON a.origin_city_id = b.city_id INNER JOIN city_info c ON a.destination_city_id = c.city_id");
																								int i = 0;
																								while (rs.next()) {
																									i++;
									%>
									<tr>
										<td>
											<%
												out.println(i);
											%>
										</td>
										<td>
											<%
												out.println(rs.getString(2));
											%>
										</td>
										<td>
											<%
												out.println(rs.getString(3));
											%>
										</td>
										<td>
											<%
												out.println(rs.getString(4));
											%>
										</td>
										<td>
											<%
												out.println(rs.getString(5));
											%>
										</td>
										<td>
											<%
												out.println(rs.getString(6));
											%>
										</td>
										<td>
											<%
												out.println(rs.getString(7));
											%>
										</td>
										<td>
											<%
											out.println("<a href='toll.jsp?edit_id="+rs.getInt(1)+"' > <button class=\"btn btn-primary\">Edit</button></a>");
											%> <%
 												out.println("<a href='' onclick='javascript:return del("+ rs.getInt(1)+ ");' > <button class=\"btn btn-danger\">Delete</button></a>");
 											%>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
								<tfoot class="hide-if-no-paging">
									<tr>
										<td colspan="6">
											<div class="pagination pagination-centered"></div>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div> <script type="text/javascript">
						$(function() {
							$('table.demo')
									.footable()
									.bind(
											'footable_filtering',
											function(e) {
												var selected = $(this)
														.prev('p')
														.find('.filter-status')
														.find(':selected')
														.text();
												if (selected
														&& selected.length > 0) {
													e.filter += (e.filter && e.filter.length > 0) ? ' '
															+ selected
															: selected;
													e.clear = !e.filter;
												}
											});

							$('.clear-filter')
									.click(
											function(e) {
												e.preventDefault();
												var $parent = $(this).closest(
														'p');
												$parent.find('.filter-status')
														.val('');
												if ($parent.find('#filter1').length > 0) {
													$('table.demo.one')
															.trigger(
																	'footable_clear_filter');
												} else {
													$('table.demo.two')
															.trigger(
																	'footable_clear_filter');
												}
											});

							$('.filter-status')
									.change(
											function(e) {
												e.preventDefault();
												var $parent = $(this).closest(
														'p');
												if ($parent.find('#filter1').length > 0) {
													$('table.demo.one')
															.trigger(
																	'footable_filter',
																	{
																		filter : $parent
																				.find(
																						'#filter1')
																				.val()
																	});
												} else {
													$('table.demo.two')
															.trigger(
																	'footable_filter',
																	{
																		filter : $parent
																				.find(
																						'#filter2')
																				.val()
																	});
												}
											});
						});
					</script>
				</td>
			</tr>

		</table>


	</center>

	<!-- /span6 -->

	<!-- /main -->
	<%
		} catch (Exception e) {
			System.err.println(e);
		}
	%>
</body>
</html>
