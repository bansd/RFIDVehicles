
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

						<%
							String reply_id = request.getParameter("reply_id");
							if (reply_id != null) {
								String area = null;
								ResultSet rs = st
										.executeQuery("SELECT * FROM contact_info WHERE contact_id = "
												+ Integer.parseInt(reply_id));
								if (rs.next()) {
									area = rs.getString(5);
								}

								session.setAttribute("reply_id", reply_id);
						%>
						<form action="mail2.jsp" method="post">

							<div class="login-fields">
								<!--
								<div class="field">
								<label><h4><%=area%></h4></label>
								</div>
								-->
								<div class="field">
									<label for="reply"><h4>Enter Your Reply:</h4></label>
								</div>

								<div class="field" style="margin-left: 20px">
									<b><label for="reply"></label></b>
									<textarea rows="5" cols="150" class="login" name="reply"></textarea>
								</div>

								<div class="field" style="margin-left: 20px">
									<input type="submit" name="submit" value="Reply"
										class="button btn btn-primary btn-large">
								</div>
							</div>
						</form>

						<%
							}
						%>





						<div id="showtable">
							<div class="widget-header" style="margin-top: 50px">
								<i class="icon-th-list"></i>
								<h3>User Queries</h3>
								<a href="#clear" class="clear-filter" title="clear filter"
									style="float: right; margin: 4px;">[clear]</a> <input
									id="filter1" type="text" placeholder="Search User query"
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
												<th>Name</th>
												<th>Email</th>
												<th>Contact Number</th>
												<th>Query</th>
												<th>Reply</th>
											</tr>
										</thead>
										<tbody>
											<%
												ResultSet rs = st.executeQuery("select * from contact_info");
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
														out.println("<a href='contactadmin.jsp?reply_id="
																	+ rs.getInt(1)
																	+ "' > <button class=\"btn btn-primary\">Reply</button></a>");
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
	</div>
	<!-- /row -->

	<!-- /main-inner -->

	<!-- /main -->
</body>
</html>




