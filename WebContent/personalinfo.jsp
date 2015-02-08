<!DOCTYPE html>
<html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<head>
<%
	try{
%>
<meta charset="utf-8">
<title>Automatic Toll Collection</title>
<meta name="description" content="Automatic toll collection site">
<meta name="author" content="bansari">
<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/userwebstyle.css">
<link rel="stylesheet" href="css/responsive.css">
<script type="text/javascript" src="js/profileuser.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
</head>
<body>
	<%
		int pcheck = 0;
		int bcheck = 0;
		int vcheck = 0;
			String e = request.getParameter("edit_id");
			if (e!=null) {
				if(e.equals("ptrue"))
					pcheck = 5;
				if(e.equals("btrue"))
					bcheck = 5;
				if(e.equals("vtrue"))
					vcheck = 5;
			}
			System.out.println("check" + pcheck);
	%>
	<!--------------Header--------------->


	<div class="wrap-header">
		<div id="logo" style="border-bottom: dotted;">
			<span style="margin-left: 30px;"><b>Automatic Toll
					Collection System </b></span>
		</div>

		<nav>
			<ul>
				<li><a href="userhome.jsp">Home</a></li>
				<li><a href="transaction.jsp">View Transaction</a></li>
				<li class="current"><a href="personalinfo.jsp">Profile</a></li>
				<li><a href="about.html">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</div>
	<%
		int check = 0;
			String username = session.getAttribute("user_username") + "";
			int user_id = Integer.parseInt(session.getAttribute("user_id")
					+ "");
			String email = null;
			String password = null;
			String fname = null;
			String mname = null;
			String lname = null;
			String user_license_no = null;
			String contact_no = null;
			String alt_contact_no = null;
			String address = null;
			String cityname = null, state_name = null;
			String acc_no = null, bankname = null, bank_branch = null;
			String pincode = null;
			Statement st = connjdbc.getDatacn();
			ResultSet rs;
			check = 4;
			int city_id = 0, state_id = 0;
			if (check > 0) {
				rs = st.executeQuery("SELECT a.user_id,a.username,a.email_address,a.password,a.user_fname,a.user_mname,a.user_lname,a.user_license_no,a.licence_photo_path,a.contact_no,a.alternate_contact_no,a.address,b.city_name,c.state_name,a.pincode,a.account_no,a.bank_name,a.bank_branch,a.city_id,a.state_id FROM user_info a INNER JOIN city_info b ON a.city_id=b.city_id INNER JOIN state_info c ON a.state_id = c.state_id where username='"
						+ username + "'");
				if (rs.next()) {
					user_id = rs.getInt(1);
					email = rs.getString(3);
					password = rs.getString(4);
					fname = rs.getString(5);
					mname = rs.getString(6);
					lname = rs.getString(7);
					user_license_no = rs.getString(8);
					contact_no = rs.getString(10);
					alt_contact_no = rs.getString(11);
					address = rs.getString(12);
					cityname = rs.getString(13);
					state_name = rs.getString(14);
					pincode = rs.getString(15);
					acc_no = rs.getString(16);
					bankname = rs.getString(17);
					bank_branch = rs.getString(18);
					city_id = rs.getInt(19);
					state_id = rs.getInt(20);
				}
			}
			session.setAttribute("email", email);
	%>

	<section id="content"
		style="margin-bottom: 40px; padding-bottom: 40px;">
		<div class="zerogrid">

			<div id="main-content">
				<article>
					<h2>
						Personal Information &nbsp;&nbsp; <a href="#vehicleinfo">Vehicle
							Information</a> &nbsp;&nbsp;<a href="#bankaccountinfo">Bank
							Information</a>
					</h2>
					<div class="content info">

						<table>
							<thead>
								<tr>
									<td colspan="2"><b>Personal Information</b><a
										href="personalinfo.jsp?edit_id=<%="ptrue"%>"><button
												style="float: right;">EDIT</button></a> 
										<%
										 	if (pcheck > 0) {
										 %><a href="personalinfo.jsp"><button style="float: right;">CANCEL</button></a>
										<%
											}
										%></td>
								</tr>
							</thead>
							<form action="updatesave.jsp" id="pform">
								<tbody class="tbody">
									<tr>
										<td><b>Username:</b></td>
										<td><input type=text name="username" id="username" id="username" required="required"
											value="<%=username%>" <%if(pcheck>0){%> onchange="checkUsername();"<%} %>><span id="usernameerror" class="usernameerror"></span><span id="uniqueuser"></span></td>
									</tr>
									<tr>
										<td><b>Email Address:</b></td>
										<td><input type=text name="email" id="email" required="required" <%if(pcheck>0){%> onchange="checkEmail();"<%}%> id="email"
											value="<%=email%>"><span id="emailerror" class="emailerror"></span><span id = "uniqueemailcheck"></span></td>
									</tr>
									<tr>
										<td><b>First Name: </b></td>
										<td><input type=text name="fname" id="fname" required="required" <%if(pcheck>0){%> onchange="checkfname();"<%}%> value="<%=fname%>"><span class="fnameerror"></span></td>
									
										<td><b>Middle Name: </b></td>
										<td><input type=text name="mname" id="mname" required="required" <%if(pcheck>0){%> onchange="checkfname();"<%}%> value="<%=mname%>"><span class="mnameerror"></span></td>
									
										<td><b>Last Name</b></td>
										<td><input type="text" name="lname" id="lname" required="required" value="<%=lname%>"><span class="lnameerror"></span></td>
									</tr>
									<tr>
										<td><b>Contact no </b></td>
										<td><input type="text" id="ucontact_no" name="cno" id="cno" required="required" value="<%=contact_no%>"><span class="cerror"></span><span id="uniquephonecheck"></span></td>
									
										<td><b>Alternate Contact number </b></td>
										<td><input type="text" id="uacontact_no" name="acno" id="acno" required="required"
											value="<%=alt_contact_no%>"><span class="acerror"></span><span id="uniqueaphonecheck"></span></td>
									</tr>
									<tr>
										<td><b>Address </b></td>
										<td><input type="text" name="address" id="address" required="required"
											value="<%=address%>"><span class="addresserror"></span></td>
									</tr>
									<tr>
										<td><b>City </b></td>
										<%
											if (pcheck > 0) {
													rs = st.executeQuery("SELECT * FROM city_info where state_id="
															+ state_id);
										%>										
										<td><div id = "city"><select name="city_name">
												<%
													while (rs.next()) {
												%>
												<option <%=city_id == rs.getInt(1) ? "selected" : ""%>
													value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
										</select></div></td>
										<%
											} else {
										%>
										<td><input type="text" value="<%=cityname%>"></td>
										<%
											}
										%>
									
										<td><b>State </b></td>
										<%
											if (pcheck > 0) {
													rs = st.executeQuery("SELECT * FROM state_info");
										%>
										<td><select name="state" id="state" onchange="showCity();">
												<%
													while (rs.next()) {
												%>
												<option <%=state_id == rs.getInt(1) ? "selected" : ""%>
													value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
										</select></td>
										<%
											} else {
										%>
										<td><input type="text" value="<%=state_name%>"></td>
										<%
											}
										%>
									</tr>
									<tr>
										<td><b>Pin code </b></td>
										<td><input type="text" name="pincode" id="pincode" required="required" value="<%=pincode%>"><span class="pincodeerror"></span></td>
									</tr>
									<%
										if (pcheck > 0) {
									%>
									<tr>
										<td colspan="2"><input type="submit" name="submit1" value="Save Changes" ></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</form>
						</table>

					</div>
				</article>

				<article>
					<div class="content info" style="margin-bottom: 30px;">
						<table>
							<thead>
								<tr>
									<td colspan="2 " id="bankaccountinfo"><b>Bank Account
											Information</b>
										<a
										href="personalinfo.jsp?edit_id=<%="btrue"%>"><button
												style="float: right;">EDIT</button></a> 
										<%
										 	if (bcheck > 0) {
										 %><a href="personalinfo.jsp"><button style="float: right;">CANCEL</button></a>
										<%
											}
										%></td>
								</tr>
							</thead>
							<form action="updatesave.jsp" id="bform">
							<tbody class="tbody">
								<tr>
									<td><b>Account Number</b></td>
									<td><input type=text  name="acc_no" id="acc_no" required="required" value="<%=acc_no%>"></td>
									<input hidden="true" name="bank" value="bank">
								</tr>
								<tr>
									<td><b>Bank Name</b></td>
									<td><input type=text name="bankname" id="bankname" required="required" value="<%=bankname%>"></td>
									<input hidden="true" name="bank" value="bank">
								</tr>
								<tr>
									<td><b>Bank Branch Name: </b></td>
									<td><input type=text  name="bank_branch" id="bank_branch" required="required" value="<%=bank_branch%>"></td>
									<input hidden="true" name="bank" value="bank">
								</tr>
								<%
									if (bcheck > 0) {
								%>
								<tr>
									<td colspan="2"><input type="submit" value="Save Changes" ></td>
								</tr>
								<%
									}
								%>
							</tbody>
							</form>
						</table>
					</div>
				</article>

				<%
					rs = st.executeQuery("select * from vehicle_info where user_id="
								+ user_id);
						ArrayList<ArrayList> arr = new ArrayList<ArrayList>();

						while (rs.next()) {
							ArrayList<String> a = new ArrayList<String>();							
							a.add(rs.getInt(1) + "");
							a.add(rs.getString(3));
							a.add(rs.getString(4));
							a.add(rs.getString(5));
							a.add(rs.getString(6));
							arr.add(a);
						}
				%>
				<article>
					<div class="content info">
						<div class="vinfo" id="vehicleinfo">
							Vehicle Information

							<button
								style="float: right; padding-right: 20px; margin-right: 20px;"
								onclick="showNewVehicle();">Add new Vehicle</button>
						</div>
						<div id="newvehicle"></div>
						<%
							for (int i = 0; i < arr.size(); i++) {
									ArrayList<String> vehicle = new ArrayList<String>();
									vehicle = arr.get(i);
						%>
						<table>
							<thead>
								<tr>
									<td colspan="2"><b>Vehicle </b><b><%=i + 1%>:</b>
										<button style="float: right;">Edit</button>
										<button style="float: right;">Delete</button></td>

								</tr>
							</thead>
							<tr>
								<td><b> Vehicle number: </b></td>
								<td><input type="text" value="<%=vehicle.get(1)%>">
								</td>
							</tr>
							<tr>
								<td><b> Vehicle Type: </b></td>
								<td><input type="text" value="<%=vehicle.get(2)%>">
								</td>
							</tr>
							<tr>
								<td><b> RC Book Number:</b></td>
								<td><input type="text" value="<%=vehicle.get(3)%>">
								</td>
							</tr>
							<tr>
								<td><b> Type of Transport:</b></td>
								<td><input type="text" value="<%=vehicle.get(4)%>">
								</td>
							</tr>
						</table>

						<%
							}
						%>
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
	<script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	
	<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"
		type="text/javascript"></script>
		
		<script src="js/user/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	
	<script src="js/user/jquery.easing.min.js"
		type="text/javascript"></script>

	<script src="js/index1.js"></script>
		
		
		
</body>
</html>