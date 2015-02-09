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
		String vid = request.getParameter("vehicle_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Transaction</title>
  
<%@ include file="links.jsp"%>

</head>
<body>
	<%@ include file="header.jsp"%>
	<script type="text/javascript">
		var d = document.getElementById("transaction");
		d.className = d.className + "active";	
	</script>

	<div class="main-inner" style="width: 100%;">
		<div class="container" style="width: 100%;">
			<div class="row" style="width: 100%;">
				<div class="span6" style="width: 100%;">
					<div class="widget widget-nopad" style="width: 100%;">
						<div style="float: right; width: 60%; margin-right: 20px;"
							id="map-canvas"></div>
						<div style="float: left; margin-left: 50px; width: 30%">
							<form action="rfidreceivercode.jsp" method="post">

								<div class="login-fields">
									<table>
										<tr>
											<td><div class="field">
													<select name="vehicle_name">
													<option value="-1">Select vehicle no</option>
													<%
													rs = st.executeQuery("SELECT vehicle_id, vehicle_no FROM vehicle_info");
													
													while(rs.next()){
													%>
													<option value="<%=rs.getInt(1)%>"><%=rs.getString(2) %></option>
													<%} %>
													</select>
												</div></td>
										</tr>
										<tr>
											<td><div class="field">
													<input id="datepicker" />
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

					<div class="widget-header" style="margin-top: 50px">
						<i class="icon-th-list"></i>
						<h3>RFID RECEIVER INFORMATION</h3>						

					</div>
					<!-- /widget-header -->
					<div class="widget-content"
						style="padding: 0px; margin: 0px; margin-bottom: 50px;">

						<div class="tab-content" style="margin: 0px;">
							<div class="tab-pane active" id="demo" style="margin: 0px;">
								Search: <input id="filter" type="text" />
								<div hidden="true">
									Status: <select class="filter-status">
										<option></option>
										<option value="active">Paid</option>
										<option value="disabled">Not Paid</option>
										<option value="suspended">Suspended</option>
									</select>
								</div>
								<a href="#clear" class="clear-filter" title="clear filter">[clear]</a>

								<table class="table demo" data-filter="#filter"
									data-page-size="7">
									<thead>
										<tr>
											<th data-type="numeric" data-hide="phone"
												style="width: 30px;">Sr No</th>
											<th data-toggle="true" style="width: 30px;">Vehicle
												Number</th>
											<th style="width: 30px;">Date</th>
											<th data-toggle="true" style="width: 30px;">From</th>
											<th data-hide="phone" style="width: 30px;">To</th>
											<th data-hide="phone" style="width: 20px;">Starting Time
											</th>
											<th data-hide="phone" style="width: 20px;">End Time</th>
											<th data-type="numeric" style="width: 20px;">Toll Amount
											</th>
										</tr>
									</thead>
									<tbody>
										<%												
												String str = "SELECT a.transaction_info_id,a.date,a.toll_amount,b.vehicle_no,c.vehicle_in_time, d.city_name, c.vehicle_out_time, e.city_name FROM transaction_info a INNER JOIN vehicle_info b ON a.vehicle_id=b.vehicle_id INNER JOIN vehicle_in_out_info c ON a.vehicle_inout_id=c.vehicle_inout_id INNER JOIN city_info d ON d.city_id=c.vehicle_in_city_id INNER JOIN city_info e ON e.city_id=c.vehicle_out_city_id"; 
														rs = st.executeQuery(str);
												int i = 0;
												while (rs.next()) {
										%>
										<tr>
											<td><%=++i%></td>
											<td><%=rs.getString(4)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getString(6)%></td>
											<td><%=rs.getString(8)%></td>
											<td><%=rs.getString(5)%></td>
											<td><%=rs.getString(7)%></td>
											<td><%=rs.getString(3)%></td>
										</tr>
										<%
											}
												rs.close();
										%>
									</tbody>
									<tfoot class="hide-if-no-paging">
										<tr>
											<td colspan="5">
												<div class="pagination pagination-centered"></div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
							<div class="tab-pane" id="docs">
								<h4>Refresh After Populating By Ajax</h4>
								<p>
									You can easily tell Footable to redraw by triggering the
									<code>footable_redraw</code>
									event on the table:
								<pre>$(&#39;.get_data&#39;).click(function() {
	$.ajax({
		url : &#39;/some/api&#39;,
		success : function(data) {
			$(&#39;table tbody&#39;).append(data).trigger(&#39;footable_redraw&#39;);
		}
	});
});</pre>
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