<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page session="false"  errorPage="/err.jsp"%>
<%@page import="db.Login" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body><jsp:useBean id="logchk" scope="page" class="loginbean.LoginDetailBean" />
    <jsp:setProperty name="logchk" property="*" />

        <%! HttpSession session; int i; String url;    %>
        <%

        i=logchk.chkLogin();
        session=request.getSession();
        switch(i)
                {

               case 0: url="main_login.jsp";
                      out.println("Invalid uid or pwd");
                      session.setAttribute("err","Invalid uid or pwd" );
                      session.setMaxInactiveInterval(5);
                      //RequestDispatcher rd = request.getRequestDispatcher(url);
                      //rd.forward(request,response);
                      //out.println("Invalid uid or pwd");
                      response.sendRedirect(url);
                       
                    break;
               case 1:  url="user/home.jsp";
                    break;
               case 2:  url="candidate/home.jsp";
                    break;
               case 3: url="eco/home.jsp";
                    break;
                }
        
        session.setAttribute("uid",logchk.getUname());
        session.setMaxInactiveInterval(1000);
        response.sendRedirect(url);
        %>

    
    
    
    
    </body>
</html>
