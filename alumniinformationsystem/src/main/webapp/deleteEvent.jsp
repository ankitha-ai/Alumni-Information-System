<%@page import="com.miniproject.DBConnection"%>
<% 
	

	int id=Integer.parseInt(request.getParameter("id"));

	int status=DBConnection.getStatement("delete from events where id="+id).executeUpdate();
	if(status>0){
		response.sendRedirect("viewEvent.jsp?msg=deleted succesfully...");
	}else{
		response.sendRedirect("viewEvent.jsp?msg=deleted failed...");
	}
%>