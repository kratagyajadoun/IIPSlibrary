<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String number=(String)session.getAttribute("key");


 
try
{
	 Class.forName("com.mysql.jdbc.Driver");
     System.out.println("driver register");
     
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","tiger");
      String name =request.getParameter("Id");
      System.out.println("db found");
      PreparedStatement ps=con.prepareStatement("delete from book where number=? and name=? ");
      ps.setString(1,number);
      ps.setString(2,name);
      ps.executeUpdate();

	   RequestDispatcher rd=request.getRequestDispatcher("delete3.jsp");
	   rd.include(request, response);
  
      %>
    
 <%      
     
}
catch(Exception e)
{
	e.printStackTrace();
}



%>

</body>
</html>