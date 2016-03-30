/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mail;

/**gmail.com
 *
 * @author Saurabh
 */
public class testmail {
    public static void main(String...s)
    {
        mail.SendPassword sndmail= new mail.SendPassword();
        sndmail.sendMail("admin@gmail.com","saurabhji@me.com","","user_login" ,"user_log_id");

    }


}
