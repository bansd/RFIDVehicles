
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.util.ArrayList"%>
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("logout.jsp");
	}
%><%
		int check = 0;
			int id = 0;
			Statement st = connjdbc.getDatacn();   
			ResultSet rs = null;
			String reply_id = request.getParameter("reply_id");
			int Rid = 0;
			Rid = Integer.parseInt(reply_id);
			
			%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage City</title>
<%@ include file="links.jsp"%>
<script>
	
	

	function showTable() {
		var str = document.getElementById("state").value;

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

	<li><a href="state.jsp"><span>Manage State</span> </a></li>
	<li class="active"><a href="city.jsp"><span>Manage City</span>
	</a></li>
	<li><a href="message.jsp"><span>Manage Message Content</span>
	</a></li>
	<li><a href="email.jsp"><span>Manage Email Content</span> </a></li>
	<li><a href="toll.jsp"><span>Manage Toll Tax</span></a></li>
	<li><a href="adminresetpassword.jsp"><span>Reset
				Password</span></a></li>
				<li><a href="contactadmin.jsp"><span>User Queries</span></a></li>
				
	<li><a href="logout.jsp"><span>Logout</span></a></li>
	</ul>
	</div>
	<!-- /container -->
	</div>
	<!-- /subnavbar-inner -->
	</div>

	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span6">
					<div class="widget widget-nopad">
						<div class="content clearfix">
							
									
						
						
						
						<%
						
																Statement st2 = com.Data.connjdbc.getDatacn();
						ResultSet rs2 = st2.executeQuery("select * from contact_info");

					%>


<form action="mail2.jsp" method="post">
								<div class="login-fields">
									<div class="field">
										<label for="reply"><h4>enter reply </h4></label> 
										
									</div>

<div class="field" style="margin-left: 20px">
											<b><label for="reply"></label></b> <input
												type="text" id="reply" name="reply"
												placeholder="Enter Reply" class="login">
									
									<div class="field" style="margin-left: 20px">
									<input type="submit" name="submit"  value=<%
										
										session.setAttribute("reply_id", reply_id);
									%>
												class="button btn btn-primary btn-large">
										</div>
										</div>
										</div>
										
							</form>
						</div>
					
						
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
																																		int i = 0;
																								while (rs2.next()) {
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
												out.println(rs2.getString(2));
											%>
										</td>
										<td>
											<%
												out.println(rs2.getString(3));
											%>
										</td>
										<td>
											<%
												out.println(rs2.getString(4));
											%>
										</td>
										<td>
											<%
												out.println(rs2.getString(5));
											%>
										</td>
										
										<td>
										<%
											out.println("<a href='contactadmincode.jsp?reply_id="+rs2.getInt(1)+"' > <button class=\"btn btn-primary\">Reply</button></a>");
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




