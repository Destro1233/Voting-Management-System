<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@page  import="java.util.UUID" %>
   <%@page  import="java.util.*" %>
   <%@page  import="java.lang.*" %>
   <%@page  import="db.DatabaseConnection" %>
   <%@page  import="java.sql.*" %>
   <%@page session="false" %>
   <%!HttpSession session;    %>
    <%
    session=request.getSession(false);
    if(session==null)
        {
        response.sendRedirect("/NATPOL/index.jsp");
        }
      else
          {
        session= request.getSession();
        session.setMaxInactiveInterval(100);
    }
    %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UPLOAD IMAGES</title>
    </head>
    <body style=" color:blue;">
 <%@ page import="java.util.List" %>

        <link rel="stylesheet" href="jmaki-standard.css" type="text/css"></link>
        <title>Page Title</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"  />
    </head>
    <body>




        <%  
        String table,col,uid,uidcol;
        String profile=(String)session.getAttribute("profile");
        uid=(String)session.getAttribute("uid");
        
        Connection c=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        UUID Id = UUID.randomUUID();
    String UID[]=Id.toString().split("-");
     String savepath="/images/profile/"+profile+"/";
     String printpath="\\images\\profile\\"+profile;
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
	   FileItemFactory factory = new DiskFileItemFactory();
	   ServletFileUpload upload = new ServletFileUpload(factory);
	   List items = null;
	   try {
		   items = upload.parseRequest(request);
	   } catch (FileUploadException e) {
		   e.printStackTrace();
	   }
	   Iterator itr = items.iterator();
	   while (itr.hasNext()) {
	   FileItem item = (FileItem) itr.next();
	   if (item.isFormField()) {	System.out.println(item.getFieldName() +" : "+item.getString());
	   } else {
		   try {
			   String itemName = item.getName();
               String fileName = itemName;
               String fname="";
              String ext="";
               int mid= fileName.lastIndexOf(".");
               fname=fileName.substring(0,mid);
               ext=fileName.substring(mid+1,fileName.length());
               String newFileName=fname+UID[1]+"."+ext;
			   File savedFile = new File(config.getServletContext().getRealPath("/")+savepath+newFileName);
			   item.write(savedFile);
               
               
			 //  out.println("<tr><td><b>Your file has been saved at the location:</b></td></tr><tr><td><b>"+config.getServletContext().getRealPath("/")+printpath+"\\"+newFileName+"</td></tr>");
               //out.println(UID[0]+" "+UID[1]+" "+UID[2]+" "+UID[3]);
               
  //out.println("File name ="+fname);
 // out.println("Extension ="+ext);
  //out.println(newFileName);
               if(profile.equals("user"))
                   {
                   table="USER_PROFILE";
                   col="USER_PHOTO";
                   uidcol="USER_LOG_ID";

                   }
               else if(profile.equals("candidate"))
                   {
                   table="CAND_PROFILE";
                   col="CAND_PHOTO";
                   uidcol="CAND_LOG_ID";
                   }
               else
                   {
                   table="ECO_PROFILE";
                   col="ECO_PHOTO";
                   uidcol="ECO_LOG_ID";
                   }
               try
                       {
                   c=db.DatabaseConnection.dbConnect("XE");
                   //Update emp set name='Rohit1' where salary=101
                   ps=c.prepareStatement("Update "+table+" SET "+col+"=? where "+uidcol+"=?");
       
                   ps.setString(1, newFileName);
                   ps.setString(2,uid);
                  rs= ps.executeQuery();

                   }
               catch(SQLException e)
                       {
                   System.out.println(e);
                   }
               finally
                       {
                   ps.close();
                   c.close();
                   response.sendRedirect("regsucess.jsp");

                   }

		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   }
   }
   %>

  <center><h1> Upload your photograph </h1> </center>
   <div class="post" style="padding-top: 57px;" align="center">
				<h2 class="title">Upload ur File</h2>
				<div class="entry">
					<p>
						<form  method="post" enctype="multipart/form-data"
name="form1" id="form1">
							<input type="file" name="upload"/>
							<input type="hidden" name="test" value="testing"/>
							<input type="submit" value="Upload"/>
						</form>
					</p>
				</div>
            </div>

    
    
    
    
    </body>
</html>
