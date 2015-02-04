<%@page import="javax.xml.crypto.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("logout.jsp");
	}
%>
<%
	try {
		Statement st = com.Data.connjdbc.getDatacn();
		ResultSet rs = null;
%>
<%
	int check = 0;
		String range = null;
		int location = 0;
		String lat = null;
		String longitude = null;
		int state_id = 0;
		String cityname = null;
		String editid = request.getParameter("edit_id");
		if (editid != null) {
			check = 5;
			session.setAttribute("edit_id", editid);
			rs = st.executeQuery("SELECT a.rfid_receiver_latitude, a.rfid_receiver_location,a.rfid_receiver_longitude,a.rfid_receiver_range,b.city_name,c.state_id FROM rfid_info a INNER JOIN city_info b ON b.city_id=a.rfid_receiver_location INNER JOIN state_info c ON c.state_id=b.state_id where rfid_receiver_id="
					+ editid);
			if (rs.next()) {
				lat = rs.getString(1);
				location = rs.getInt(2);
				longitude = rs.getString(3);
				range = rs.getString(4);
				cityname = rs.getString(5);
				state_id = rs.getInt(6);

			}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage rfid receiver</title>
<%@ include file="links.jsp"%>
<style>
#map-canvas {
	width: 900px;
	height: 500px;
}
</style>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script>
	var map;
	var once = 0;
	function initialize() {
		var mapCanvas = document.getElementById('map-canvas');
		var mapOptions = {
			center : new google.maps.LatLng(22.697817, 72.889977),
			zoom : 10,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(mapCanvas, mapOptions);
		//	var location = new google.maps.LatLng(22.697817,72.889977);
		//var marker=new google.maps.Marker({
		//  position: location,
		//		});
		//	marker.setMap(map);
	}
	function add(lat, longi) {
		if (once == 0) {
			initialize();
		}
		once = 1;
		var location = new google.maps.LatLng(lat, longi);
		var marker = new google.maps.Marker({
			position : location,
		});
		marker.setMap(map);
	}
	//add(22.697817,72.889977);

	//google.maps.event.addDomListener(window, 'load', initialize);
</script>
<script type="text/javascript">

	function showCity() {
		var str = document.getElementById("state").value;
		var id =
<%=location%>
	;

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
		xmlhttp.open("GET", "getrfidcity.jsp?q=" + str + "&city=" + id, true);
		xmlhttp.send();
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<script type="text/javascript">
		var d = document.getElementById("rfid");
		d.className = d.className + "active";	
	</script>

	<div class="main-inner" style="width: 100%;">
		<div class="container" style="width: 100%;">
			<div class="row" style="width: 100%;">
				<div class="span6" style="width: 100%;">
					<div class="widget widget-nopad" style="width: 100%;">
						<div style="float: right; width: 60%; margin-right:20px;" id="map-canvas"></div>
						<div style="float: left; margin-left: 50px; width: 30%">
							<form action="rfidreceivercode.jsp" method="post">

								<div class="login-fields">
									<table>

										<tr>
											<td><div class="field" style="margin-left: 20px">
													<label for="message_content">RFID receiver location</label>
												</div></td>
										</tr>
										<tr>
											<td><div class="field" style="margin-left: 20px">
													<select name="state" onChange="showCity();" id="state"
														class="login">
														<%
															rs = st.executeQuery("SELECT state_id,state_name FROM state_info");
																while (rs.next()) {
														%>
														<option
															<%if (check > 0) {
						if (rs.getInt(1) == state_id) {
							out.println("selected");
						}
					}%>
															value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>
														<%
															}
																rs.close();
														%>
													</select>
												</div></td>
										</tr>
										<tr>
											<td>
												<div class="field" style="margin-left: 20px">
													<div id="city">
														<select name="city" class="login">
															<%
																if (check > 0) {
																		rs = st.executeQuery("SELECT city_id,city_name FROM city_info where state_id = "
																				+ state_id);
																		while (rs.next()) {
															%>
															<option <%=rs.getInt(1) == location ? "selected" : ""%>
																value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
															<%
																}
																	} else {
															%>
															<option value="-1">Select City</option>
															<%
																}
															%>
														</select>
													</div>
												</div></td></tr>
										
										<tr>
											<td><div class="field" style="margin-left: 20px">
													<b><label for="range">RFID Receiver Range:</label></b> <input
														type="text" id="range" name="range"
														placeholder="Enter Range"
														value="<%if (check > 0) {
					out.println(range);
				} else {
				}%>"
														class="login">
												</div></td>
										</tr>
										<tr>
											<td><div class="field" style="margin-left: 20px">
													<b><label for="range">RFID Longitude</label></b> <input
														type="text" id="longitude" name="longitude"
														placeholder="Enter Longitude"
														value="<%if (check > 0) {
					out.println(longitude);
				} else {
				}%>"
														class="login">
												</div></td>
										</tr>
										<tr>
											<td><div class="field" style="margin-left: 20px">
													<b><label for="range">RFID LAtitude</label></b> <input
														type="text" id="latitude" name="latitude"
														placeholder="Enter Latitude"
														value="<%if (check > 0) {
					out.println(lat);
				} else {
				}%>"
														class="login">
												</div></td>
										</tr>
										<tr>
											<td><div class="field">
													<input type="submit" name="submit"
														value="<%if (check > 0) {%>Update<%} else {%>Add<%}%>"
														value="Add" class="button btn btn-primary btn-large"
														style="float: left; width: 85px; margin-left: 135px">
												</div></td>
										</tr>
									</table>
								</div>


							</form>
						</div>
					</div>
					<%
						rs = st.executeQuery("SELECT a.rfid_receiver_id,a.rfid_receiver_range,b.city_name,a.rfid_receiver_latitude,a.rfid_receiver_longitude FROM rfid_info a INNER JOIN city_info b ON a.rfid_receiver_location=b.city_id ");
					%>
					<div class="widget-header" style="margin-top: 50px">
						<i class="icon-th-list"></i>
						<h3>RFID RECEIVER INFORMATION</h3>
						<a href="#clear" class="clear-filter" title="clear filter"
							style="float: right; margin: 4px;">[clear]</a> <input
							id="filter1" type="text" placeholder="Search Here"
							style="float: right; margin: 5px;" />

					</div>
					<!-- /widget-header -->
					<div class="widget-content"
						style="padding: 0px; margin: 0px; margin-bottom: 50px;">

						<div class="tab-pane active" id="demo">

							<table class="table demo one" style="padding: 0px; margin: 0px;"
								data-filter="#filter1" data-page-size="5">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Range</th>
										<th>Location</th>
										<th>Latitude</th>
										<th>Longitude</th>
										<th>Edit/Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
										int i = 0;
											while (rs.next()) {
									%>
									<script>
										add(
									<%=rs.getDouble(4)%>
										,
									<%=rs.getDouble(5)%>
										);
									</script>
									<tr>
										<td>
											<%
												out.println(++i);
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
												out.println("<a href='rfidreceiver.jsp?edit_id="
																+ rs.getInt(1)
																+ " ' > <button class=\"btn btn-primary\">Edit</button></a>");
											%> <script>
												add(
											<%=rs.getString(4)%>
												,
											<%=rs.getString(5)%>
												);
											</script> <%
 	out.println("<a href='' onclick='javascript:return del("
 					+ rs.getInt(1)
 					+ ");' > <button class=\"btn btn-danger\">Delete</button></a>");
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



					</div>

				</div>
				<script type="text/javascript">
					$(function() {
						$('table.demo')
								.footable()
								.bind(
										'footable_filtering',
										function(e) {
											var selected = $(this).prev('p')
													.find('.filter-status')
													.find(':selected').text();
											if (selected && selected.length > 0) {
												e.filter += (e.filter && e.filter.length > 0) ? ' '
														+ selected
														: selected;
												e.clear = !e.filter;
											}
										});

						$('.clear-filter').click(
								function(e) {
									e.preventDefault();
									var $parent = $(this).closest('p');
									$parent.find('.filter-status').val('');
									if ($parent.find('#filter1').length > 0) {
										$('table.demo.one').trigger(
												'footable_clear_filter');
									} else {
										$('table.demo.two').trigger(
												'footable_clear_filter');
									}
								});

						$('.filter-status').change(
								function(e) {
									e.preventDefault();
									var $parent = $(this).closest('p');
									if ($parent.find('#filter1').length > 0) {
										$('table.demo.one').trigger(
												'footable_filter',
												{
													filter : $parent.find(
															'#filter1').val()
												});
									} else {
										$('table.demo.two').trigger(
												'footable_filter',
												{
													filter : $parent.find(
															'#filter2').val()
												});
									}
								});
					});
				</script>

			</div>
			<!-- /widget -->
		</div>
		<!-- /span6 -->

	</div>
	<!-- /row -->

	<!-- /container -->
	<!-- /main-inner -->
	<!-- /main -->
	<%
		} catch (Exception e) {
			System.err.println(e);
		}
	%>
</body>
</html>