<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
	try {
		Statement st = connjdbc.getDatacn();
		String sn = request.getParameter("q");
		int id = Integer.parseInt(sn);
%>
<div class="widget widget-table action-table">
	<div class="widget-header">
		<i class="icon-th-list"></i>
		<h3>Cities</h3>
	</div>
	<!-- /widget-header -->
	<div class="widget-content">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>City</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
					ResultSet rs = st
								.executeQuery("select * from city_info where state_id = "
										+ id + "");
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
						   out.println("<a href='' onclick='javascript:return del("+rs.getInt(1)+");' >Delete</a>");
						%>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<!-- /widget-content -->
</div>
<%
	} catch (Exception e) {
		System.err.println(e);
	}
%>
