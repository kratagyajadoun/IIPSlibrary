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

 
try
{
	 Class.forName("com.mysql.jdbc.Driver");
     System.out.println("driver register");
     
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","tiger");
      
      System.out.println("db found");
      PreparedStatement ps=con.prepareStatement("select * from book where number=? ");
      ps.setString(1,number);
      ResultSet rs= ps.executeQuery();%>
      
      <div class="header">

      <h1 id="logo">IIPsBookStore</h1>
      <a href="userhome.jsp" id="home">HOME</a> 
      </div>
      
      <br>
      <h2>Showing books you have added</h2>
      
      <br>
      <table class="table" id="delete">
      <tr>
      <th>subject</th>
      <th>name</th>
      <th>author</th>
      <th>price</th>
      <th>     </th>
      </tr>
      
      </table>
      <br>     
      <% 
      while(rs.next())
      {
      %>
      
     
      <table class="table">      
      <tr>
    	<td> <% out.print(""+rs.getString(2)+"<br>");%></td>
        <td> <%out.print(""+rs.getString(3)+"<br>");%></td>
        <td> <% out.print(""+rs.getString(4)+"<br>");%></td>
        <td> <%out.print(""+rs.getString(5)+"<br>");%></td>
    
    	<td><a href=<%= "\"delete2.jsp?Id=" + rs.getString(3) + "\"" %> >delete</a></td>
      
</tr>
      </table>
      
      
      
      
      <% }
}
catch(Exception e)
{
	e.printStackTrace();
}



%>

</body>
</html>