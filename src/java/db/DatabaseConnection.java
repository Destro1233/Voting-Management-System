package db;

import java.sql.*;
import javax.sql.*;
import java.util.*;
import oracle.jdbc.OracleDriver;

public class DatabaseConnection
{
  public static Connection c=null;
  //Getting Connection from database
  public static Connection dbConnect(String database_name)
   {   
      
      String databaseName="jdbc:oracle:thin:@localhost:1521:"+database_name;
        try{
            Driver driver = new oracle.jdbc.OracleDriver();
            DriverManager.registerDriver(driver);
            System.out.println("Driver Loaded Successfully ...");
            
             c = DriverManager.getConnection(databaseName,"system","password");
		if (c==null)
			{
				System.out.println("connection failed");
			}
	    
	   }
           catch(SQLException e)
		{
		 System.out.println(e);
		}
           catch(Exception e)
		{
		 System.out.println(e);
		}
     
        return c;     
   
   }


}

