<html>
<body>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="oracle.jdbc.OracleDriver"%>
<%@ page errorPage="err.jsp"%>
<%

Driver driver = new oracle.jdbc.OracleDriver();
            DriverManager.registerDriver(driver);
		System.out.println("Driver Loaded Successfully ...");
      Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","password");
		if (c==null)
			{
				System.out.println("connection failed");
			}

 Statement st=c.createStatement();
ResultSet rs=st.executeQuery("select * from emp");
while(rs.next())
{
out.println(rs.getString(1));
out.println(rs.getString(2));
out.println("</br>");
}

/*catch(SQLException e){System.out.println(e);}
catch(Exception e1){System.out.println(e1);}
*/%>

</body>
</html>
