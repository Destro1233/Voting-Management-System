/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package recovery;




/**
 *
 * @author Saurabh
 */
public class PswdRecovery {
    private String id;
    private int profile;
    private int i;
    private String table;
    private String Col_name;
    private String message;
    public void setId(String id) {
        this.id = id;
    }

    
    public void setProfile(int profile) {
        this.profile = profile;
    }
 public void setValue(int i)
 {
     this.i=i;
 }
   
    public int getProfile() {
        return profile;
    }
    public int getValue()
    {
        return i;
    }

    public int recoverPassword()
    {  message="Your recovered password is :\n";
   switch(profile)
                {

               case 0: setValue(0);
                    break;
               case 1:
                   setValue(1);
                    table="USER_LOGIN";
                    Col_name="USER_LOG_ID";
                    break;
               case 2: setValue(2);
                   table="C_LOGIN";
                        Col_name="CAND_LOG_ID";
                    break;
               case 3: setValue(3);
                     table="ECO_LOGIN";
                       Col_name="ECO_LOG_ID";
                    break;
                }
   mail.SendPassword sndmail = new mail.SendPassword();
   sndmail.sendMail("support@gmail.com", id, message, table,Col_name);

   return getValue();
}
    


}
