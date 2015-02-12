<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.connjdbc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	Statement st = connjdbc.getDatacn();   
		String vtype= "", travelType = "", typeOfTransport = "";
	int id = 0, ocity = 0, dcity = 0;
	Double amount = 0.0;
	ResultSet rs = null;
	String edit_Fid = request.getParameter("edit_id");
	int FId = 0;
	FId = Integer.parseInt(edit_Fid);
	
	try {

		if(FId == 0){
	
		}else{
			rs = st.executeQuery("Select * from tolltax_cost_per_vehicle where vehicle_type_id ="
					+ FId + "");
			while (rs.next()) {
				id = rs.getInt(1);
				vtype = rs.getString(2);
				ocity = rs.getInt(3);//cityid
				dcity = rs.getInt(4);
				travelType = rs.getString(5);
				typeOfTransport = rs.getString(6);
				amount = Double.parseDouble(rs.getBigDecimal(7).toString());
			}
			System.out.println(amount);
			rs.close();
		}
%>

<script>

	
	
</script>
<form action="tollcode.jsp">
	<table>
		<tr>
			<td>
				<div class="field"
					style="float: left; position: relative; margin-left: 20px">
					<label for="state_name">Origin State:</label> <select
						name="state_name" id="originstate" onchange="showOriginCity()">
						<%
							ArrayList<Integer> ids = new ArrayList<Integer>();
															ArrayList<String> state_name = new ArrayList<String>();
															rs = st.executeQuery("select * from state_info");
															
															while (rs.next()) {
																ids.add(rs.getInt(1));
																state_name.add(rs.getString(2));
															}
															rs.close();
															
															rs = st.executeQuery("select * from city_info where city_id ="
																+ ocity);
															int ostateid = 0;
															String ocityname="";
															while(rs.next()){
																ostateid = rs.getInt(3);
																ocityname = rs.getString(2);
															}	
															rs.close();
															
															for (int i = 0; i < ids.size(); i++) {
																if (ids.get(i) == ostateid) {							
																	out.println("<option value= " + ids.get(i)
																			+ " selected>" + state_name.get(i)
																			+ "</option>");			
																	System.out.println("here");

																} else {
																	out.println("<option value=" + ids.get(i) + ">"
																				+ state_name.get(i) + "</option>");
																}
															}
															
						%>
					</select>
				</div>

				<div class="field"
					style="float: left; position: relative; margin-left: 20px">
					<div id="origincity">
						<label for="city_name">Origin City:</label> <select
							name="origin_city_name" id="ocity" onChange="showDestCity()"
							onclick="showOriginCity(<%=ocity%>)">

							<option value="<%out.println(ocity);%>" selected>
								<%
									out.println(ocityname);
								%>
							</option>
						</select>
					</div>
				</div>

			</td>

		</tr>
		<tr>
			<td>
				<div class="field"
					style="float: left; position: relative; margin-left: 20px">
					<label for="state_name">Destination State:</label> <select
						name="state_name" id="destinationstate" onChange="showDestCity()">
						<%
							rs = st.executeQuery("select * from city_info where city_id ="
																		+ dcity);
																int dstateid=0;
																String dcityname="";
																while(rs.next()){
																	dstateid = rs.getInt(3);
																	dcityname = rs.getString(2);
																}
																rs.close();
																for (int i = 0; i < ids.size(); i++) {
																	if (ids.get(i) == dstateid) {

																		out.println("<option value= \"" + ids.get(i)
																				+ "\" selected>" + state_name.get(i)
																				+ "</option>");
																	} else {
																		out.println("<option value=" + ids.get(i) + ">"
																				+ state_name.get(i) + "</option>");
																	}
																}
						%>
					</select>
				</div>
				<div class="field">
					<div
						style="width: 100px; border: 0px solid gray; float: left; position: relative; margin-left: 20px">
						<label for="destination_city_name">Destination City:</label>
						<div id="destinationcity">
							<select name="destination_city_name" id="dcity">
								<option value="<%out.println(dcity);%>" selected>
									<%
										out.println(dcityname);
									%>
								</option>
							</select>
						</div>
					</div>
				</div>

			</td>
		</tr>
		<tr>
			<td>
				<div class="field" style="margin-left: 20px">
					<label for="vehicle_type">Vehicle type:</label> <select
						name="vehicle_type" class="login">
						<option id="Car/Van/Jeeps" value="Car/Van/Jeeps">Car/Van/Jeeps</option>
						<option id="Light Motor Vehicles" value="Light Motor Vehicles">Light
							Motor Vehicles</option>
						<option id="Bus/Trucks" value="Bus/Trucks">Bus/Trucks</option>
						<option id="Multi Excel Vehicles" value="Multi Excel Vehicles">Multi
							Excel Vehicles</option>
					</select>
					<script>
						document.getElementById(<%out.println(vtype);%>).selected = true;
					</script>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="field"
					style="float: left; position: relative; margin-left: 20px">
					<label for="travel_type">Travel Type: </label> <input type="radio"
						name="travel_type" id="One_way" value="One_way">One way
					&nbsp; &nbsp; &nbsp;&nbsp; <input type="radio" id="Round_trip"
						name="travel_type" value="Round_trip">Round trip
					<script>
						document.getElementById(<%out.println(travelType);%>).checked = true;
					</script>
				</div>

				<div class="field"
					style="float: left; position: relative; margin-left: 70px">
					<label for="transport_type">Transport Type: </label> <input
						type="radio" name="transport_type" id="Private" value="Private">Private
					&nbsp; &nbsp; &nbsp; &nbsp; <input type="radio"
						name="transport_type" id="Public" value="Public">Public
					<script>
						document.getElementById(<%out.println(typeOfTransport);%>).checked = true;
					</script>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="field" style="margin-left: 20px">
					<b><label for="toll_amount">Toll amount:</label></b> <input
						type="text" id="Toll_amount" name="toll_amount"
						value="<%out.println(amount);%>" class="login">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="field" style="margin-left: 20px">
					<input type="submit" value="Add"
						class="button btn btn-primary btn-large">
				</div>
			</td>
		</tr>
	</table>
</form>
<%
	} catch (Exception e) {
		System.out.println("Delete : " + e);
	}
%>