package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Login
{  
    static Connection c= null;
    static PreparedStatement ps=null;
    static ResultSet rs;
    static String Query;
    static String pswd;   
 public static boolean loginChk(String uid,String pwd,String database_name,String table,String uid_col, String pwd_col) throws SQLException
  {
      
            c=DatabaseConnection.dbConnect(database_name);
            ps =c.prepareStatement("select * from "+ table+" where "+uid_col+"=? and "+pwd_col+"=?");
         
            ps.setString(1,uid);
            ps.setString(2,pwd);
            rs=ps.executeQuery();
          
              if(rs.next())
                {
      	          rs.close();
		  c.close();
                  
return true;
                  
                }
               else
                {
		 rs.close();
		 c.close();
                 return false;

                }


  }  



}