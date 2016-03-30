/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package PollingStatus;
import java.sql.*;

/**
 *
 * @author Saurabh
 */
public class UserState {

    static PreparedStatement ps=null;
    static Connection c=null;
    static ResultSet rs=null;
    static String sr = null;

    public  static String StateFind(String usr){
        try{

            c=db.DatabaseConnection.dbConnect("XE");
            ps = c.prepareStatement("select user_state from user_profile where user_admin_id=?");
            ps.setString(1, usr);
            System.out.println("UserState- Query Created");
            rs = ps.executeQuery();
            System.out.println("UserState- Query Executed");
            if(rs.next())
            {
            sr = rs.getString("User_State");
            System.out.println("UserState- State Fetched "+ sr);
            }
            ps.close();
            c.close();
        }catch(SQLException e){
              System.out.println(e);
        }catch(Exception e){
	      System.out.println(e);
        }
        System.out.println("UserState- Working And Value Returned");
        return(sr);
    }
}
