/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mail;
import java.sql.*;
/**
 *
 * @author Saurabh
 */
public class VoteMail {
    
    static String userid=null;
    static String pswd=null;
    static String mymsg=null;
    static Statement ps=null;
    static Connection c=null;
    static ResultSet rs=null;

    public static Integer MailAll(String state){

        try{
                c=db.DatabaseConnection.dbConnect("XE");
        ps = c.createStatement();
        System.out.println("VoteMail- Query created,State- "+state);
        rs=ps.executeQuery("select user_profile.user_log_id, user_voting.admin_id," +
        " user_voting.password from user_profile inner join user_voting"+
        " on user_voting.admin_id = user_profile.user_admin_id"+
        " where user_profile.user_state ='"+ state +"'");
        System.out.println("VoteMail- Query executed");
        while(rs.next()){

            String uid=rs.getString("admin_id");
            String pwd=rs.getString("password");
            String sender="supportNATPOL@gmail.com";
            String reciever=rs.getString("user_log_id");
            String subject =("Voting has started in your region- "+state);
            String message=("Voting has started in your area. "+
                "Please use the below id and password to login and vote.\n" +
                "ID & Passwor for email id :- "+reciever+". \n"+
                "ID :-"+ uid +"\n"+
                "Password :-"+ pwd +"\n");
            System.out.println("Email Id,Admin Id,Password-"+reciever+"/"+uid+"/"+pwd);
            mail.SendMail.sendMail(sender,reciever,subject,message);

            }
        
        }catch(Exception e){
        e.printStackTrace();
        return(0);
        }finally{
            try{

                ps.close();
            c.close();
            }catch(Exception e1){
                e1.printStackTrace();
            }
        }

    return(1);
    }

}
