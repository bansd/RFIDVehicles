
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("adminlogin.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage City</title>
<%@ include file="links.jsp"%>
<script>
	
	function showTable() {
		var str = document.getElementById("state1").value;
		if (str == "") {
			document.getElementById("tbody").innerHTML = "";
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
				document.getElementById("tbody").innerHTML = xmlhttp.responseText;
			}
		};

		xmlhttp.open("GET", "getcitytable.jsp?q=" + str, true);
		xmlhttp.send();
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<script type="text/javascript">
		var d = document.getElementById("city");
		d.className = d.className + "active";	
	</script>
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span6">
					<div class="widget widget-nopad">
						<div class="content clearfix">
							<form action="citycode.jsp" method="post">
								<div class="login-fields">
									<div class="field">
										<label for="state_name"><h4>Select State:</h4></label> <select
											name="state_name" id="state1" onChange="showTable();">
											<%
												try {
													Statement st = com.Data.connjdbc.getDatacn();
													ResultSet rs = st.executeQuery("select * from state_info");
													while (rs.next()) {
														%>
														<option value="<%=rs.getInt(1)%>"><%=rs.getString(2) %></option>
														<%
														//out.println("<option value=" + rs.getInt(1) + ">"
															//	+ rs.getString(2) + "</option>");
													}
											%>
										</select>
									</div>


									<div style="width: 100px; border: 0px solid gray;">
										<label for="city_name"><h4>City name:</h4></label> <input
											type="text" placeholder="City name" name="city_name">
									</div>

									<input type="submit" value="Add"
										class="button btn btn-primary btn-large">
								</div>
							</form>
						</div>
<p id="hereee"></p>
						<div id="showtable">
							<div class="widget-header" style="margin-top: 50px">
								<i class="icon-th-list"></i>
								<h3>CITIES</h3>
								<a href="#clear" class="clear-filter" title="clear filter"
									style="float: right; margin: 4px;">[clear]</a> <input
									id="filter1" type="text" placeholder="Search City Name"
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
												<th>City</th>
												<th>Delete</th>
											</tr>
										</thead>
										<tbody>
											<%
												rs = st.executeQuery("select * from city_info where state_id = "
															+ 1 + "");
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
														out.println("<a href='' onclick='javascript:return del("
																		+ rs.getInt(1)
																		+ ");' ><button class=\"btn btn-danger\">Delete</button></a>");
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
	<%
		} catch (Exception e) {
			System.err.println(e);
		}
	%>

</body>
</html>
