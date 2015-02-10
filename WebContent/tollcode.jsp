<%@ page import = "java.sql.*" %>

<%
	String submittype = request.getParameter("submit");
	System.out.println("submit:"+submittype);
	String vehicle_type = request.getParameter("vehicle_type");
    String origin_city = request.getParameter("origin_city_name");
    String destination_city= request.getParameter("destination_city_name");
    String travel_type = request.getParameter("travel_type");
    String transport_type= request.getParameter("transport_type");
    String toll_amount= request.getParameter("toll_amount");
    int ocity_id = Integer.parseInt(origin_city);
    int dcity_id = Integer.parseInt(destination_city);
    int toll_cost;
    try{
    	toll_cost = Integer.parseInt(toll_amount);
    }catch(Exception e){
    	String str = "Enter numeric value";
    	session.setAttribute("toll_cost_error",str);
    	response.sendRedirect("toll.jsp");
    }
    Statement st = com.Data.connjdbc.getDatacn();
    //System.out.println(toll_amount);
    
    try
    {
    	if(submittype.equals("Add")){
	        int i=0;        
	        String str = "INSERT INTO tolltax_cost_per_vehicle(vehicle_type,origin_city_id,destination_city_id,travel_type,type_of_transport,toll_amount) VALUES('"+ vehicle_type +"',"+ ocity_id +","+ dcity_id +",'"+ travel_type +"','"+ transport_type +"','"+ toll_amount +"')";   
	
	        System.out.println(str);
	        i= st.executeUpdate(str);
	        out.println("successfully added");
	        if(i>0){
	           System.out.println("Successfully");
	           response.sendRedirect("toll.jsp");
	        }
	        else
	           response.sendRedirect("index.html"); 
    	}else if(submittype.equals("Update")){
    		int id = Integer.parseInt(session.getAttribute("edit_id")+"");
    		String str = "UPDATE tolltax_cost_per_vehicle SET vehicle_type='"+vehicle_type+"' , origin_city_id="+ocity_id+" , destination_city_id="+dcity_id+" , travel_type='"+travel_type+"' , type_of_transport='"+transport_type+"' , toll_amount='"+toll_amount+"' WHERE vehicle_type_id="+id;
    		int i = 0;
    		i= st.executeUpdate(str);
	        out.println("successfully updated");
	        if(i>0){
	           System.out.println("Successfully");
	           response.sendRedirect("toll.jsp");
	        }
	        else
	           response.sendRedirect("index.html"); 
    	}
    }    
    catch(Exception e)
    {
        System.out.println(e);
    }
%>
