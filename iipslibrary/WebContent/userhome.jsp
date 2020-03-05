<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/userhome.css">
<link rel="stylesheet" type="text/css" href="css/logo.css">
<script type = "text/javascript" >
        function preventBack() { window.history.forward(1); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
</script>
</head>
<body>
<%
String number=(String)session.getAttribute("key");

if(number == null) {
   response.sendRedirect("index.html");
}
%> 
<div class="header">

<h1 id="logo">IIPsBookStore</h1>

<a href="logout.jsp" id="logout">Log Out</a>
</div><br>

<br><br>


<div class="message">
<br><br>
<a href="view.jsp"><button>View Books</button> </a>
<a href="add1.html"><button>Add Book</button> </a>
<a href="delete.jsp"><button>Delete Book</button> </a>
</div>
<br><br><br>
<div  class="container">
<h2><a href="pdf.jsp">Read books online</a></h2>
<br><br>

<a href="pdf/JavaTheCompleteReference.pdf"><img src="java.jpg" ></a>
<a href="pdf/unix.pdf"><img src="unix.jpg" ></a>
<a href="pdf/c++programming.pdf"><img src="c++.jpg" ></a>
<a href="pdf/LetUsC.pdf"><img src="c.jpg" ></a>
</div>


</body>
</html>
