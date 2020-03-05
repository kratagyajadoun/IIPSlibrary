<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/viewsubject.css">
<link rel="stylesheet" type="text/css" href="css/logo.css">
</head>
<body>
<%

String number=(String)session.getAttribute("key");
//String subject=request.getParameter("subject");
String nsearch =request.getParameter("Id");
 
try
{
	  Class.forName("com.mysql.jdbc.Driver");
      System.out.println("driver register");
     
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","tiger");
      
      System.out.println("db found");
     // System.out.println("hello" +nsearch);
      PreparedStatement ps=con.prepareStatement("select * from user where number=? ");
      ps.setString(1,nsearch);
      ResultSet rs= ps.executeQuery();%>
      <div class="header">

      <h1 id="logo">IIPsBookStore</h1>
      <a href="userhome.jsp" id="home">HOME</a>
      </div>
      <br>
      <br>
      <h2>Showing seller info :-</h2>
      
      
      <br>
      
      <br>
     
      
     
      <% 
      while(rs.next())
      {
      %>
      
     
       <h2>Owner's name : <%out.print(""+rs.getString(1)+ " " +rs.getString(2)+"<br>");%></h2><br>
         <br><h2>Contact number : <%out.print(""+rs.getString(3)+"<br>");%></h2>
        
      
      
      
      
      <% }
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
</body>
</html>