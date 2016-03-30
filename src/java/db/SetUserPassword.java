/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package db;
import java.sql.*;
import java.io.*;
import java.rmi.server.UID;
import db.DatabaseConnection;


/**
 *
 * @author Saurabh
 */
public class SetUserPassword {

    public static Connection c;
    public static PreparedStatement ps;
public static boolean insertLoginDetails(String uid,String pswd) throws SQLException,IOException
{
    c=DatabaseConnection.dbConnect("XE");
    ps=c.prepareStatement("insert into user_login values(?,?,?)");
    ps.setString(1,uid);
    ps.setString(2,pswd);
    ps.setDate(3,null);
    
    UID userId = new UID();
    String id=userId.toString();
            System.out.println(userId);
            System.out.println(id.substring(0,6));
            int i=ps.executeUpdate();
            ps.close();
            c.close();
            if(i>0) return true;
            else return false;
    
}
}
