
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("logout.jsp");
	}
%>
<%
	int check = 0;
	int id = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Queries</title>
<%@ include file="links.jsp"%>
<script type="text/javascript">
function markAsUnstolen(id) {
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
			window.location.reload(true);

		}
	};
	xmlhttp.open("GET", "markasunstolen.jsp?id=" + id, true);

	xmlhttp.send();
	//alert("return");
}

function findvehicles() {
	var str = document.getElementById("user_name").value;
	if (str == "") {
		document.getElementById("uservehicles").innerHTML = "";
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
			document.getElementById("uservehicles").innerHTML = xmlhttp.responseText;
		}
	};

	xmlhttp.open("GET", "getuservehicles.jsp?q=" + str, true);
	xmlhttp.send();
}
</script>
</head>
<body>

	<%@ include file="header.jsp"%>


	<div class="main-inner" style="width: 100%;">
		<div class="container" style="width: 100%;">
			<div class="row" style="width: 100%;">
				<div class="span6" style="width: 100%;">
					<div class="widget widget-nopad" style="width: 100%;">
						<%
							Statement st = com.Data.connjdbc.getDatacn();
						%>

						<form action="addstolencode.jsp" method="post">

							<div class="login-fields">
								<div class="field" style="margin-left: 20px;">
									<label for="reply">Enter User Name:</label><input
										name="username" placeholder="Enter Username" id="user_name"
										onchange="findvehicles();">
								</div>

								<div class="field" style="margin-left: 20px;" id="uservehicles">
								<label for="vehicleid">Select Vehicle</label>
									<select name="vehicleid">
										<option value="-1">Select Vehicle</option>
									</select>
								</div>

								<div class="field" style="margin-left: 20px">
									<input type="submit" name="submit"
										value="Add as Stolen Vehicle"
										class="button btn btn-primary btn-large">
								</div>
							</div>
						</form>
						<div id="showtable">
							<div class="widget-header" style="margin-top: 50px">
								<i class="icon-th-list"></i>
								<h3>Stolen Vehicles List</h3>
								<input id="filter1" type="text" placeholder="Search User query"
									style="float: right; margin: 5px;" />

							</div>
							<!-- /widget-header -->
							<div class="widget-content"
								style="padding: 0px; margin: 0px; margin-bottom: 50px;">

								<div class="tab-pane active" id="demo">

									<table class="table demo one"
										style="padding: 0px; margin: 0px;" data-filter="#filter1"
										data-page-size="50" id="tbody">
										<thead>
											<tr>
												<th>Sr No</th>
												<th>Stolen Vehicles</th>
												<th>Mark as Unstolen</th>
											</tr>
										</thead>
										<tbody>
											<%
												ResultSet rs = st.executeQuery("SELECT vehicle_id,vehicle_no FROM vehicle_info WHERE is_stolen=TRUE");
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
														out.println("<a href='' onclick='javascript:return markAsUnstolen("
																		+ rs.getInt(1)
																		+ ");' ><button class=\"btn btn-danger\">Mark as Unstolen</button></a>");
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

					</div>
					<script type="text/javascript">
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




