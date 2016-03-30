/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mail;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;



/**
 *
 * @author Saurabh
 */
public class SendMail {

     public static void sendMail(String sender,String reciever,String subject,String message){
    try
	{
         
         String mymsg;
         

                mymsg=message;

	Properties p=new Properties();
	p.put("MAIL.TRANSPORT.PROTOCOL","SMTP");
	p.put("MAIL.SMTP.HOST","localhost");
	p.put("MAIL.SMTP.PORT","25");

	Session s=Session.getInstance(p);

	InternetAddress to=new InternetAddress(reciever);

	InternetAddress from=new InternetAddress(sender);
	Message msg=new MimeMessage(s);
	msg.setFrom(from);
	System.out.println("SendMail- Reciver Added ");
	msg.setRecipient(Message.RecipientType.TO,to);
	System.out.println("SendMail- Sender Added");
	msg.setSubject(subject);
        System.out.println("SendMail- Subject Added ");
	msg.setText(mymsg);
 	System.out.println("SendMail- Message Added");
	Transport.send(msg);
        System.out.println("SendMail- Message Sent ");
	}
    
	catch(Exception e)
	{
	System.out.println(e);
	}

    
     
     }

}
