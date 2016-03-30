<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@page session="false" %>
<html>
<head>
<title>logout</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
    <%! HttpSession session; %>
<%
 session= request.getSession(false);
 if(session==null)
     {

     response.sendRedirect("../index.jsp");

     }
 else
     {
     session=request.getSession();
     session.invalidate();
     
     }
 %>

</head>
<body >
<h1> You have been sucessfully log out...... </h1>

<%
response.setHeader("Pragma","no-cache"); // HTTP 1.0
     response.setHeader("Cache-Control","no-store"); // HTTP 1.1
     response.setDateHeader("Expires", 0);
%>
<h3> <a href="../index.jsp">go back to website home page</a> </h3>
</body>
</html>
