/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loginbean;

import db.DatabaseConnection;
import db.Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
        /**
         *
         * @author Saurabh
         */

public class LoginDetailBean {

    private String uname;
    private String password;
    private int profile;
    private static Connection c;
    private static PreparedStatement ps;
    private static ResultSet rs;
    private int i;
    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setProfile(int profile) {
        this.profile = profile;
    }
 public void setValue(int i)
 {
     this.i=i;
 }
    public String getUname() {
        return uname;
    }

    public String getPassword() {
        return password;
    }

    public int getProfile() {
        return profile;
    }
    public int getValue()
    {
        return i;
    }


    public int chkLogin() throws SQLException {

         
        switch(profile)
        {
            case 0: setValue(0);
            case 1: if (Login.loginChk(uname, password, "XE", "USER_LOGIN", "USER_LOG_ID", "USER_LOG_PWD"))
                  {
                   setValue(1);
                  }
            case 2: if (Login.loginChk(uname, password, "XE", "C_LOGIN", "CAND_LOG_ID", "CAND_LOG_PWD")){
                
                   setValue(2);
            }
            case 3:if (Login.loginChk(uname, password, "XE", "ECO_LOGIN", "ECO_LOG_ID", "ECO_LOG_PWD")){
                   
                   setValue(3);
            }
        }
        return getValue();
        }
    
}
