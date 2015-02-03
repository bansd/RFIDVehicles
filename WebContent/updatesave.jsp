<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Data.connjdbc"%>

<%@page import="java.sql.*"%>
<%
	int user_id = Integer
			.parseInt(session.getAttribute("user_id") + "");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String fname = request.getParameter("fname");
	String mname = request.getParameter("mname");
	String lname = request.getParameter("lname");
	String cno = request.getParameter("cno");
	String acno = request.getParameter("acno");
	String address = request.getParameter("address");
	String city_name = request.getParameter("city_name");
	String state = request.getParameter("state");
	String pincode = request.getParameter("pincode");
	String acc_no = request.getParameter("acc_no");
	String bankname = request.getParameter("bankname");
	String bank_branch = request.getParameter("bank_branch");
	Statement st = connjdbc.getDatacn();

	String b = request.getParameter("bank");
	System.out.println("id="+b);
	//try {
		int i = 0;
		if (b!=null) {

			String str = "UPDATE user_info SET account_no= '" + acc_no
					+ "',bank_name= '" + bankname + "',bank_branch= '"
					+ bank_branch + "' WHERE user_id=" + user_id+"";
			i = st.executeUpdate(str);

			if (i > 0) {
				response.sendRedirect("personalinfo.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}

		} else {

			String str = "UPDATE user_info SET username = '" + username
					+ "',email_address = '" + email
					+ "',user_fname = '" + fname + "',user_mname = '"
					+ mname + "',user_lname = '" + lname
					+ "',contact_no = '" + cno
					+ "',alternate_contact_no = '" + acno
					+ "',address = '" + address + "',city_id = '"
					+ city_name + "',state_id = '" + state
					+ "',pincode = '" + pincode + "' WHERE user_id = "
					+ user_id + "";
			i = st.executeUpdate(str);

			if (i > 0) {
				System.out.println("Successfully");
				response.sendRedirect("personalinfo.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}
		}

	//} catch (Exception e) {
		//System.out.println(e);
	//}
%>







