/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package user;
import java.sql.*;
import db.DatabaseConnection;

/**
 *
 * @author Saurabh
 */
public class CandDetails {
    private static ResultSet result;
    public static void setResult(ResultSet rs)
    {
    result=rs;
    }
    public static ResultSet getResult()
    {
    return result;
    }

    public static ResultSet getCandDetails( String state)
    {
        Connection c;
      ResultSet rs;
       try{
  c=DatabaseConnection.dbConnect("XE");
// PreparedStatement ps=c.prepareStatement("select * from CAND_PROFILE where CAND_STATE=?");
 //ps.setString(1, state);
  PreparedStatement ps=c.prepareStatement("select USER_FNAME from user_profile");
  rs=ps.executeQuery();
   setResult(rs);
       }
       catch(Exception e)
       {
           System.out.println(e);
       }

       return getResult();

    }
    

}
