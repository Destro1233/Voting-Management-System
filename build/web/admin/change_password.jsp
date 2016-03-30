<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  session="false" errorPage="../err.jsp" %>
<%@page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body>
   <%! HttpSession session; String id;
      Connection c=null;
      PreparedStatement ps=null;
      
     %>
        <%
        session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../login.jsp");
            }
     else
       {
            session=request.getSession();
            id=(String)session.getAttribute("id");
            System.out.println(id);



        }
        %>

        <%
        String pwd=(String)request.getParameter("pwd");

        //String salt = "NATIONAL POLING PROJECT";
        //String passwordEnc = encrypt.Protector.encrypt(pwd, salt);
        //String passwordDec = encrypt.Protector.decrypt(passwordEnc, salt);

        //System.out.println("Salt Text : " + salt);
        //System.out.println("Plain Text : " + pwd);

        //System.out.println("Encrypted : " + passwordEnc);
        //System.out.println("Decrypted : " + passwordDec);
        c=db.DatabaseConnection.dbConnect("XE");
        ps=c.prepareStatement("UPDATE ADMIN_LOGIN SET PSWD=? where ID=?");
        ps.setString(1,pwd);
        ps.setString(2,id);
        int i=ps.executeUpdate();
        out.println("<a href=home.jsp> <h3>Click here to return to home page</a> </h3>");
        %>

    
    
    
    
    </body>
</html>
