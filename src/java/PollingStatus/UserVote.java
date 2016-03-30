/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package PollingStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import db.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Saurabh
 */
public class UserVote {
    static Connection c= null;
    static PreparedStatement ps=null;
    static ResultSet rs;
    static int status;

    public static int castedVoteStatus(String id)
    {
 try{
        c=DatabaseConnection.dbConnect("XE");
            ps =c.prepareStatement("select * from VOTING where USER_ADMIN_ID=?");

            ps.setString(1,id);
            rs=ps.executeQuery();


              if(rs.next()) status=1;
              else status=0;
              


 }catch(SQLException e){e.printStackTrace();}
 catch(Exception e){e.printStackTrace();}
 finally
 {
            try {
                rs.close();
                c.close();
            } catch (SQLException ex) {
                Logger.getLogger(Status.class.getName()).log(Level.SEVERE, null, ex);
            }

 }

    return status;
    }


}
