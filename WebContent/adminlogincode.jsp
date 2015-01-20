
<%@ page import = "java.sql.*" %>

<%   
    session.setAttribute("incorrectusername", "");
    session.setAttribute("incorrectpassword", "");
    String admin_username = request.getParameter("username");
    String admin_password = request.getParameter("password");
    Statement st = com.Data.connjdbc.getDatacn();
    try
    {
        int i=0;
        //String str = "INSERT INTO admin_info(admin_username,admin_password) VALUES('"+ admin_username +"','"+ admin_password +"')";   
        String str = "SELECT * from admin_info WHERE admin_username = '"+admin_username+"'";
        ResultSet rs  = st.executeQuery(str);
        if(rs.next()){
            String pass = rs.getString(2);
            if(pass.equals(admin_password)){
            	String adminname = admin_username;
            	session.setAttribute("admin_name", admin_username);
                response.sendRedirect("city.jsp");
            }else{
                String s = "Incorrect Password";
                session.setAttribute("incorrectpassword", s);
                response.sendRedirect("adminlogin.jsp"); 
            }
        }
        else{
            String s = "Incorrect Username";
            session.setAttribute("incorrectusername", s);
            response.sendRedirect("adminlogin.jsp"); 
        }
              
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>

