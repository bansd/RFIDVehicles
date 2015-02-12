<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	if (session.getAttribute("admin_name") == null) {
		response.sendRedirect("logout.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage State</title>
<%@ include file="links.jsp"%>
<script type="text/javascript">
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
		xmlhttp.open("GET", "delstate.jsp?delete_id=" + id, true);

		xmlhttp.send();
		//alert("return");
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<script type="text/javascript">
		var d = document.getElementById("state");
		d.className = d.className + "active";
	</script>
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span6">
					<div class="widget widget-nopad">
						<form action="statecode.jsp" method="post">
							<table>
								<tr>
									<td><label><h4>Add State name</h4></label></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text" name="state_name"
										placeholder="Enter statename"><br></td>
									<td><input type="submit" value="Add"
										class="button btn btn-primary btn-large"
										style="margin-left: 50px; margin-bottom: 12px;"></td>
								</tr>
							</table>
						</form>
						<%
							try {
								Statement st = com.Data.connjdbc.getDatacn();
						%>

						<div class="widget-header" style="margin-top: 50px">
							<i class="icon-th-list"></i>
							<h3>STATES</h3>
							<a href="#clear" class="clear-filter" title="clear filter"
								style="float: right; margin: 4px;">[clear]</a> <input
								id="filter1" type="text" placeholder="Search State Name"
								style="float: right; margin: 5px;" />
						</div>
						<!-- /widget-header -->
						<div class="widget-content" style="padding: 0px; margin: 0px;">

							<div class="tab-pane active" id="demo">
								<table class="table demo one" style="padding: 0px; margin: 0px;"
									data-filter="#filter1" data-page-size="5">
									<thead>
										<tr>
											<th>Sr No</th>
											<th>State</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											ResultSet rs = st.executeQuery("select * from state_info");
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
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$(function() {
			$('table.demo').footable().bind(
					'footable_filtering',
					function(e) {
						var selected = $(this).prev('p').find('.filter-status')
								.find(':selected').text();
						if (selected && selected.length > 0) {
							e.filter += (e.filter && e.filter.length > 0) ? ' '
									+ selected : selected;
							e.clear = !e.filter;
						}
					});

			$('.clear-filter').click(function(e) {
				e.preventDefault();
				var $parent = $(this).closest('p');
				$parent.find('.filter-status').val('');
				if ($parent.find('#filter1').length > 0) {
					$('table.demo.one').trigger('footable_clear_filter');
				} else {
					$('table.demo.two').trigger('footable_clear_filter');
				}
			});

			$('.filter-status').change(function(e) {
				e.preventDefault();
				var $parent = $(this).closest('p');
				if ($parent.find('#filter1').length > 0) {
					$('table.demo.one').trigger('footable_filter', {
						filter : $parent.find('#filter1').val()
					});
				} else {
					$('table.demo.two').trigger('footable_filter', {
						filter : $parent.find('#filter2').val()
					});
				}
			});
		});
	</script>

	</div>
	<!-- /widget -->
	</div>
	<!-- /span6 -->
	<!-- /row -->

	<!-- /container -->
	<!-- /main-inner -->

	<%
		} catch (Exception e) {
			System.err.println(e);
		}
	%>
</body>
</html>
