/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package db;
import java.sql.*;
import java.io.*;
import java.util.UUID;


/**
 *
 * @author Saurabh
 */
public class SetPassword {

    public static Connection c;
    public static PreparedStatement ps;
public boolean insertLoginPassword(String uid,String pswd,String table) throws SQLException,IOException
{
    UUID Id = UUID.randomUUID();
    String pwd[]=Id.toString().split("-");
    c=DatabaseConnection.dbConnect("XE");
    ps=c.prepareStatement("insert into "+table+" values(?,?,?)");
    ps.setString(1,uid);
    if(pswd==" ")
    {
    ps.setString(2,pwd[1]);
    }else
    {
        ps.setString(2, pswd);
    }
    
    ps.setString(3,VotingYear.VotingDate.getYear());
    
    
            System.out.println(Id);
            System.out.println("pswd :"+pwd[1]);
            int i=ps.executeUpdate();
            ps.close();
            c.close();
            if(i>0) return true;
            else return false;
    
}
}
