/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package VotingYear;
import java.util.Calendar;
import java.text.SimpleDateFormat;


/**
 *
 * @author Saurabh
 */
public class VotingDate {
    public static String getYear()
    {
    Calendar currentDate = Calendar.getInstance();
  SimpleDateFormat formatter=
  new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
  String dateNow = formatter.format(currentDate.getTime());
 // System.out.println("Now the date is :=>  " + dateNow);
  String splitdate[]= dateNow.toString().split("/");
  //System.out.println(splitdate[0]+" "+splitdate[1]+"\n\n");
return splitdate[0];
    }
}
