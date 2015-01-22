<%-- 
    Document   : city code
    Created on : Oct 16, 2014, 6:52:00 PM
    Author     : Bansari
--%>

<%@ page import = "java.sql.*" %>

<%  session.setAttribute("wrongcpass", "");
    String uname = request.getParameter("username");
    String password = request.getParameter("password"); 
    String cpassword = request.getParameter("confirmpassword");
    Statement st = com.Data.connjdbc.getDatacn();
    try
    {
        int i=0;
        if(!uname.isEmpty()){
            if(password.equals(cpassword)){            
                String str = "UPDATE admin_info SET admin_password = '"+ password +"' WHERE admin_username = '"+uname+"'";      
                i= st.executeUpdate(str);
                
                if(i>0){
                    System.out.println("Successfully");
                    response.sendRedirect("city.jsp");
                }
                else{               
                    response.sendRedirect("login.jsp"); 
                }      
            }else{
                String s = "Passwords donot match!Try Again..";
                session.setAttribute("wrongcpass", s);
                response.sendRedirect("adminresetpassword.jsp"); 
            }        
        }else{
            String s = "Enter username";
            session.setAttribute("wrongcpass", s);
            response.sendRedirect("adminresetpassword.jsp"); 
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>
