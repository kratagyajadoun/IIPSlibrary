<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/view.css">
<link rel="stylesheet" type="text/css" href="css/logo.css">
</head>
<body>
<div class="header">

<h1 id="logo">IIPsBookStore</h1>
<a href="userhome.jsp" id="home">HOME</a>
</div><br>
<div class="message">

<form action="viewsubject.jsp" method="post" >
<h3>Enter Subject :</h3><br>
<input type="text" name="subject" value="">
<input type="submit" value="search">
</form>
<br><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR</h2><BR>
<form action="viewname.jsp" method="post" >
<h3>Enter name :</h3><br>
<input type="text" name="name" value="">
<input type="submit" value="search"><br><br>
</form>

</div>

</body>
</html>