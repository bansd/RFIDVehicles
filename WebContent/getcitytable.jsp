<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>

<%
	try {
		Statement st = connjdbc.getDatacn();
		String sn = request.getParameter("q");
		int id = Integer.parseInt(sn);
		ResultSet rs = null;
%>
<table class="table demo one" data-filter="#filter1" id="tbody"
	data-page-size="50">
	<thead>
		<tr>
			<th data-toggle="true">Sr No</th>
			<th>State</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
		<%
			rs = st.executeQuery("select * from city_info where state_id = "
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

<%
	} catch (Exception e) {
		System.err.println(e);
	}
%>
