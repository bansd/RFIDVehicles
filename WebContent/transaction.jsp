<!DOCTYPE html>
<html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<head>
<%try{ %>
<meta charset="utf-8">
<title>Automatic Toll Collection</title>
<meta name="description" content="Automatic toll collection site">
<meta name="author" content="bansari">
<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script>
        if (!window.jQuery) { document.write('<script src="js/jquery-1.9.1.min.js"><\/script>'); }
    </script>
<script src="js/jsTables/footable.js?v=2-0-1" type="text/javascript"></script>
<script src="js/jsTables/footable.sort.js?v=2-0-1" type="text/javascript"></script>
<script src="js/jsTables/footable.filter.js?v=2-0-1" type="text/javascript"></script>
<script src="js/jsTables/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<script src="js/jsTables/bootstrap-tab.js" type="text/javascript"></script>
<script src="js/jsTables/data-generator.js" type="text/javascript"></script>
<script src="js/jsTables/jquery.mockjax.js" type="text/javascript"></script>
<script src="js/jsTables/demos.js" type="text/javascript"></script>
<link href="css/csstables/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="css/csstables/footable.core.css?v=2-0-1" rel="stylesheet" type="text/css"/>
<link href="css/csstables/footable-demos.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/userwebstyle.css">
<link rel="stylesheet" href="css/responsive.css">

</head>
<body>


	<div class="wrap-header">
		<div id="logo" style="border-bottom: dotted;">
			<span style="margin-left: 30px;"><b>Automatic Toll
					Collection System </b></span>
			<span style="float:right; font-size: medium; margin-top:10px; margin-left:20px; margin-right:20px;"><a href="userlogin.jsp" >Logout</a></span>
			<span style="float:right; font-size: medium; margin-top:10px; margin-right:20px;"> Welcome, <%=session.getAttribute("fname")+" "+session.getAttribute("lname") %></span>
		</div>

		<nav>
			<ul>
				<li><a href="userhome.jsp">Home</a></li>
				<li class="current"><a href="transaction.jsp">View Transaction</a></li>
				<li><a href="personalinfo.jsp">Personal Information</a></li>
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</div>
	
	<section id="content" >
		<div class="zerogrid" style="margin: 0px;">
				<div id="main-content" class="col-left">

					<article>
							<div class="tab-content" style="margin: 0px;">
			<div class="tab-pane active" id="demo" style="margin: 0px;">
	                  Search: <input id="filter" type="text"/>
                    <div hidden="true">Status: <select class="filter-status">
                        <option></option>
                        <option value="active">Paid</option>
                        <option value="disabled">Not Paid</option>
                        <option value="suspended">Suspended</option>
                    </select>
                    </div>
                    <a href="#clear" class="clear-filter" title="clear filter">[clear]</a>
               
				<table class="table demo" data-filter="#filter" data-page-size="7" >
					<thead>
						<tr>
							<th data-type="numeric" data-hide="phone" style="width: 30px;">
									Sr No
							</th>
							<th data-toggle="true" style="width: 30px;">
								Vehicle Number
							</th>
							<th style="width: 30px;">
								Date
							</th>
							<th data-toggle="true" style="width: 30px;">
								From
							</th>
							<th data-hide="phone" style="width: 30px;">
								To
							</th>
							<th data-hide="phone" style="width: 20px;">
								Starting Time
							</th>
							<th data-hide="phone" style="width: 20px;">
								End Time
							</th>
							<th  data-type="numeric" style="width: 20px;">
								Toll Amount
							</th>
						</tr>
					</thead>
					<tbody>
					<%										
						int user_id = Integer.parseInt(session.getAttribute("user_id")+"");									
						Statement st = connjdbc.getDatacn();
						ResultSet rs;
						//<ArrayList> trans_info = new ArrayList<ArrayList>();
						String str = "SELECT a.transaction_info_id,a.date,a.toll_amount,b.vehicle_no,c.vehicle_in_time, d.city_name, c.vehicle_out_time, e.city_name FROM transaction_info a INNER JOIN vehicle_info b ON a.vehicle_id=b.vehicle_id INNER JOIN vehicle_in_out_info c ON a.vehicle_inout_id=c.vehicle_inout_id INNER JOIN city_info d ON d.city_id=c.vehicle_in_city_id INNER JOIN city_info e ON e.city_id=c.vehicle_out_city_id WHERE a.user_id="+user_id;
						rs = st.executeQuery(str);
						int i = 0;
						while(rs.next()){%>
						<tr>
							<td><%=++i %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(6) %></td>
							<td><%=rs.getString(8) %></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(7) %></td>
							<td><%=rs.getString(3) %></td>		
						</tr>									
						<%}
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
                <p>You can easily tell Footable to redraw by triggering the <code>footable_redraw</code> event on the table:
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
						
					</article>
				</div>

			</div>
	</section>
<%
} catch (Exception e) {
		System.err.println(e);
}
%>

    <script type="text/javascript">
        $.mockjax({
            url: '/some/api',
            dataType: 'html',
            response: function() {
                this.responseText = window.generateRows(5,0,true);
            }
        });

        $(function () {

			$('table').footable();

            $('.clear-filter').click(function (e) {
                e.preventDefault();
                $('table.demo').trigger('footable_clear_filter');
				$('.filter-status').val('');
            });

            $('.filter-status').change(function (e) {
                e.preventDefault();
				var filter = $(this).val();
                $('#filter').val('');
                $('table.demo').trigger('footable_filter', {filter: filter});
            });

            $('.get_data').click(function() {
                $.ajax({
                    url : '/some/api',
                    success : function(data) {
                        $('table tbody').append(data);
                        $('table').trigger('footable_redraw');
                    }
                });
            });

        });
    </script>
</body>
</html>