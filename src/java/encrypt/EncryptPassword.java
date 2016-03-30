/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package encrypt;
import Model.ByteToHex;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Saurabh
 */
public class EncryptPassword {

/*MD5 Encryption goes here-1 way encryption*/

public static void main(String...s)
{
    String cipher=null;


try

{



MessageDigest md = MessageDigest.getInstance("SHA-1");

String input="password";  //storing the password in input string

md.update(input.getBytes()); //storing the password in md object as bytes

byte[] output = md.digest();  //producing the 128 bit output using the md5 algorithm
System.out.println(output);

cipher= ByteToHex.bytesToHex(output); //converting the bytes to string and storing in cipher String

}

catch (Exception e) {

System.out.println("Exception: "+e);

}

/*MD5 Encryption ends here-1 way encryption*/



}
}