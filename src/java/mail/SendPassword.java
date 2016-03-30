/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mail;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;


/**
 *
 * @author Saurabh
 */
public class SendPassword {

     String userid=null;
         String pswd=null;
         String mymsg=null;
         PreparedStatement ps=null;
         Connection c=null;
         ResultSet rs=null;
        
   
    public  void sendMail(String sender,String reciever,String message, String table,String idcol){
   
          try
	  {
         c=db.DatabaseConnection.dbConnect("XE");
         ps =c.prepareStatement("select * from "+ table+" where "+idcol+"=?");
       ps.setString(1, reciever);
        System.out.println("query created");

                
                rs=ps.executeQuery();   
                System.out.println("query executed");
        if(rs.next())
        {
        
       
         //System.out.println(userid);
         pswd=rs.getString(2);
         System.out.println(pswd);
        }
        
                mymsg=message+"\n USERID :- "+reciever+"\n"+"Password :-"+pswd+" \n";
                System.out.println(mymsg);
                
        
	Properties properties=new Properties();
	properties.put("MAIL.TRANSPORT.PROTOCOL","SMTP");
	properties.put("MAIL.SMTP.HOST","localhost");
	properties.put("MAIL.SMTP.PORT","25");
    
	Session session = Session.getDefaultInstance(properties, null);

	InternetAddress to=new InternetAddress(reciever);

	InternetAddress from=new InternetAddress(sender);
	Message msg=new MimeMessage(session);
	msg.setFrom(from);
	System.out.println("message ");
	msg.setRecipient(Message.RecipientType.TO,to);
	System.out.println(".......");
	msg.setSubject("Password");
	msg.setText(mymsg);
 	System.out.println(".....");
	Transport.send(msg);

	
    }
          catch(SQLException e)
          {
              System.out.println(e);
          }
          
	catch(Exception e)
	{
	System.out.println(e);
	}
   finally
   {
            try {
                ps.close();
                c.close();
                userid=null;
                pswd=null;
                 mymsg=null;

            } catch (SQLException ex) {
                Logger.getLogger(SendPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
       
   }
    
}
}
