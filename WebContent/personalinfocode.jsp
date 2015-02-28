<%@ page import="java.sql.*"%>
<%@page import="com.Data.connjdbc"%>

<%
	try {

		System.out.println("here");
		String bsave = request.getParameter("bsave");
		String psave = request.getParameter("psave");
		String vsave = request.getParameter("vsave");
		String uname = (String) session.getAttribute("user_username");
		Statement st = com.Data.connjdbc.getDatacn();
		ResultSet rs = null;
		
		//UPDATING BANK ACCOUNT DETAILS
		if (bsave != null) {			
			String acc_no = request.getParameter("acc_no");
			String bankname = request.getParameter("bankname");
			String bank_branch = request.getParameter("bank_branch");
			System.out.println("here in bank");
			String str1 = "UPDATE user_info SET account_no = '"
					+ acc_no + "',bank_name = '" + bankname
					+ "',bank_branch = '" + bank_branch
					+ "' WHERE username = '" + uname + "'";
			int i = st.executeUpdate(str1);
			if(i>0){
				System.out.println("updated successfully");
				response.sendRedirect("personalinfo.jsp#bankaccountinfo");
			}else{
				System.out.println("Here error");
				response.sendRedirect("personalinfo.jsp");
			}
			
		}
		
		//UPDATING PERSONAL INFORMATION
		if (psave != null) {
			String state_name = request.getParameter("state_name");
			String pincode = request.getParameter("pincode");
			String cityid = request.getParameter("cityname");
			String state_id = request.getParameter("state");
			String address = request.getParameter("address");
			String alt_contact_no = request
					.getParameter("alt_contact_no");
			String contact_no = request.getParameter("contact_no");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String mname = request.getParameter("mname");
			String fname = request.getParameter("fname");


			String str1 = "UPDATE user_info SET user_fname = '" + fname
					+ "',user_lname = '" + lname + "',user_mname = '"
					+ mname + "',contact_no = '" + contact_no
					+ "',alternate_contact_no = '" + alt_contact_no
					+ "',address = '" + address + "',city_id = "
					+ cityid + ",state_id = " + state_id
					+ ",pincode = '" + pincode + "',email_address = '"
					+ email + "' WHERE username = '" + uname + "'";

			int j = st.executeUpdate(str1);
			response.sendRedirect("personalinfo.jsp#personalinfo");
		}
		if (vsave != null) {
			String rc_book_no = request.getParameter("rc_book_no");
			String vehicle_type = request.getParameter("vehicle_type");
			String vehicle_no = request.getParameter("vehicle_no");
			String type_of_transport = request
					.getParameter("type_of_transport");
			String vid = request.getParameter("vid");

			int i = 0;
			i = st.executeUpdate("UPDATE vehicle_info SET vehicle_no='"+vehicle_no+"',vehicle_type='"+vehicle_type+"',rc_book_no='"+rc_book_no+"',type_of_transport='"+type_of_transport+"' WHERE vehicle_id="+vid);
			response.sendRedirect("personalinfo.jsp#vehicleinfo");
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>