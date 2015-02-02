<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>

<%  
request.setCharacterEncoding("UTF-8");
Statement st = com.Data.connjdbc.getDatacn(); 



 String relativeWebPath = "/images";
 String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
 MultipartRequest s=new MultipartRequest(request,absoluteDiskPath);


 //String submit=s.getParameter("submit");
 //System.out.print(submit);

 String Username=s.getParameter("username");
 String Email_address=s.getParameter("email");
 String Password=s.getParameter("pass");
 
 String User_fname=s.getParameter("user_fname");
 String User_mname=s.getParameter("user_mname");
 String User_lname=s.getParameter("user_lname");
 String User_license_no=s.getParameter("user_license_no");
 String Contact_no=s.getParameter("contact_no");
 String Alternate_Contact_number=s.getParameter("alternate_Contact_number");
 String address=s.getParameter("address");

 String veh_no = s.getParameter("vehicle_no");
 String rcbookno = s.getParameter("rc_book_no");
 String typetransport = s.getParameter("type_of_transport");
 
 
 
 String City_id=s.getParameter("city_name");
 String State_id=s.getParameter("state_name");
 String Pincode=s.getParameter("pin_code");
 
 
 String Account_no=s.getParameter("account_no");
 String Bank_name=s.getParameter("bank_name");
 String Bank_branch=s.getParameter("bank_branch");
 
 String img=s.getOriginalFileName("licence_photo_path");
 if(Alternate_Contact_number==null){
	 Alternate_Contact_number="0";
 }

 
%>
<% 
try
    {
	String user_type="User";
	
	String str1 = "INSERT INTO admin_info(admin_username,admin_password,user_type) VALUES('"+ Username +"','"+ Password +"','"+user_type+"')";
	
	st.executeUpdate(str1);
	
    int i=0;
    int user_id = 0;
    String str = "INSERT INTO user_info(username,email_address,password,user_fname,user_mname,user_lname,user_license_no,licence_photo_path,contact_no,alternate_contact_no,address,city_id,state_id,pincode,account_no,bank_name,bank_branch) VALUES('"+ Username +"','"+ Email_address +"','"+ Password +"','"+ User_fname +"','"+ User_mname +"','"+ User_lname +"','"+ User_license_no +"','"+ img +"',"+ Contact_no +","+ Alternate_Contact_number +",'"+ address +"',"+ City_id +","+ State_id +","+ Pincode +",'"+Account_no +"','"+ Bank_name +"','"+ Bank_branch +"')";   
    System.out.println(str);
    i=st.executeUpdate(str);
    ResultSet rs = st.executeQuery("SELECT * FROM user_info where username='"+Username+"'");
    
    if(rs.next()){
    	
    	user_id = rs.getInt(1);
    }
    rs.close();  
    
    int j = 0;
    j = st.executeUpdate("INSERT INTO vehicle_info(user_id,vehicle_no,rc_book_no,type_of_transport) VALUES ("+user_id+",'"+veh_no+"','"+rcbookno+"','"+typetransport+"')");
    
    if(i>0 && j>0)    
    {
    	session.setAttribute("user_username", Username);
    	session.setAttribute("fname",User_fname);
    	session.setAttribute("lname", User_lname);
       System.out.println("Successfully");
       response.sendRedirect("userhome.jsp");
    }
    else
    {
            response.sendRedirect("userreg.jsp");
    }
    
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>


