
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("logout.jsp");
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
<%
		int check = 0;
			int id = 0;
			String vehicletype = null;
			int origincityid = 0;
			int descityid = 0;
			int originstateid = 0;
			int deststateid = 0;
			String traveltype = null;
			String typeoftransport = null;
			String tollamount = null;
			
			String editid = request.getParameter("edit_id");
			if (editid != null) {
				check = 5;
				session.setAttribute("edit_id", editid);
				rs = st.executeQuery("Select * from tolltax_cost_per_vehicle where vehicle_type_id ="+ editid);
				while (rs.next()) {
					id = rs.getInt(1);
					vehicletype = rs.getString(2);
					origincityid = rs.getInt(3);
					descityid = rs.getInt(4);
					traveltype = rs.getString(5);
					typeoftransport = rs.getString(6);
					tollamount = rs.getString(7);
				}
				rs.close();
				rs = st.executeQuery("Select state_id from city_info where city_id ="+ origincityid);
				while(rs.next()){
					originstateid = rs.getInt(1);
				}
				
				rs.close();
				rs = st.executeQuery("Select state_id from city_info where city_id ="+ descityid);
				while(rs.next()){
					deststateid = rs.getInt(1);
				}
			}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Toll Price</title>
<%@ include file="links.jsp"%>
<script>
	function del(id) {
		// alert(id);

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange = function() {

			// alert(xmlhttp.readyState + " " + xmlhttp.status);
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				//alert("hello4");
				//document.getElementById("showtable").innerHTML = xmlhttp.responseText;

			}
		};
		xmlhttp.open("GET", "deltoll.jsp?delete_id=" + id, true);

		xmlhttp.send();
		//alert("return");
	}
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
		var str = document.getElementById("destinationstate").value;
		var ocity = document.getElementById("ocity").value;
		var dcity = <%= descityid%>
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
				document.getElementById("destinationcity").innerHTML = xmlhttp.responseText;
			}
		};
		
		xmlhttp.open("GET", "getdestcity.jsp?q=" + str+"&ocity="+ocity+"&editcityid="+dcity, true);
		xmlhttp.send();
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<script type="text/javascript">
		var d = document.getElementById("toll");
		d.className = d.className + "active";	
	</script>
	
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
														<option <%=rs.getInt(1)==originstateid?"selected":"" %> value="<%=rs.getInt(1)%>">
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
													<%if(check>0){
														rs = st.executeQuery("select * from city_info where city_id="+origincityid);
														while(rs.next()){%>
															<option value="<%=origincityid%>" selected><%=rs.getString(2) %></option>
														<%}
														rs.close();
													}
													
													%>
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
												<%
													for (int j = 0; j < ids.size(); j++) {%>
														<option <%=ids.get(j)==deststateid?"selected":"" %> value="<%=ids.get(j) %>"><%=state_name.get(j) %></option>
												<%	}%>
												
											</select>
										</div>
										<div class="field">
											<div
												style="width: 100px; border: 0px solid gray; float: left; position: relative; margin-left: 20px">
												<label for="destination_city_name">Destination City:</label>
												<div id="destinationcity">
													<select name="destination_city_name" id="dcity">
														<option value="-1">Select City</option>
														<%if(check>0){
														rs = st.executeQuery("select * from city_info where city_id="+descityid);
														while(rs.next()){%>
															<option value="<%=descityid%>" selected><%=rs.getString(2) %></option>
														<%}
														rs.close();
													}
													
													%>
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
												<option  <%if(check>0){out.println(vehicletype.equals("Car/Van/Jeeps")?"selected":"");}%> value="Car/Van/Jeeps">Car/Van/Jeeps</option>
												<option <%if(check>0){out.println(vehicletype.equals("Light Motor Vehicles")?"selected":"");}%> value="Light Motor Vehicles">Light Motor
													Vehicles</option>
												<option <%if(check>0){out.println(vehicletype.equals("Bus/Trucks")?"selected":"");}%> value="Bus/Trucks" >Bus/Trucks</option>
												<option <%if(check>0){out.println(vehicletype.equals("Multi Excel Vehicles")?"selected":"");}%> value="Multi Excel Vehicles">Multi Excel
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
												type="radio" name="travel_type"  value="One_way" <%if(check==0){}else{if(traveltype.equals("One_way")){%>
															checked="checked" <%} }%>>One_way
											&nbsp; &nbsp; &nbsp;&nbsp; <input type="radio"
												name="travel_type" value="Round_trip" <%if(check==0){}else{if(traveltype.equals("Round_trip")){%>
															checked="checked" <%} }%>>Round_trip
										</div>

										<div class="field"
											style="float: left; position: relative; margin-left: 70px">
											<label for="transport_type">Transport Type: </label> <input
												type="radio" name="transport_type" value="Private"  <%if(check==0){}else{if(typeoftransport.equals("Private")){%>
															checked="checked" <%} }%>>Private
											&nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" 
												name="transport_type" value="Public" <%if(check==0){}else{if(typeoftransport.equals("Public")){%>
															checked="checked" <%} }%>>Public

										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="field" style="margin-left: 20px">
											<b><label for="toll_amount">Toll amount:</label></b> <input
												type="text" id="Toll_amount" name="toll_amount"
												placeholder="Enter Toll amount" value="<%if(check>0){out.println(tollamount);}else{} %>" class="login">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="field" style="margin-left: 20px">
											<input type="submit" name="submit" value=<%=check>0?"Update":"Add" %>
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
