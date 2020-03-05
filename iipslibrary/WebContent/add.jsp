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

<% 	String number=(String)session.getAttribute("key");
		//out.print("welcome user ="+number);

			  
			  String subject=request.getParameter("subject");
			  String name=request.getParameter("book");
			  String author=request.getParameter("author");
			  String price=request.getParameter("price");
			  
			  
		      try
		      {
		    	  Class.forName("com.mysql.jdbc.Driver");
			      System.out.println("driver register");
			      
			       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","tiger");
		           
			       System.out.println("db found");
			       PreparedStatement ps=con.prepareStatement("insert into book (number,subject,name,author,price) values(?,?,?,?,?)");
			    
			       ps.setString(1,number);
			       ps.setString(2,subject);
			       ps.setString(3,name);
			       ps.setString(4,author);
			       ps.setString(5,price);
			       
			       int i=ps.executeUpdate();
			       if(i==1)
			       {
			    	   RequestDispatcher rd=request.getRequestDispatcher("add2.jsp");
			    	   rd.include(request, response);
			       }
			       else
			       {
			    	   out.print("data not inserted");
			       }
		      
		      }
			catch(Exception e)
			{
				
				e.printStackTrace();
				
		      }
%>		      
</body>
</html>