<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page  session="false" errorPage="../err.jsp" %>


<%! HttpSession session; String uid;%>
    <%session=request.getSession(false);
        if(session==null)
            {
            response.sendRedirect("../main_login.jsp");
            }
     else
       {
            session=request.getSession();
            uid=(String)session.getAttribute("uid");

            //session.setAttribute("userid","tester@gmail.com" );
            //usr.setdata((String)(session.getAttribute("uid")));
            //usr.getdata();
       
}

        %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body>
    <jsp:useBean id="update" scope="page" class="eco.updatebean" />
    
    <jsp:setProperty name="update" property="*" />

        <%
        update.update(uid);
        
        %>
    Changes are saved successfully!!!!
    <a href="home.jsp">go to home page</a>
    </body>
</html>
