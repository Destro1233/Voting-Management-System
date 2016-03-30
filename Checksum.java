package test;

import java.security.*;
import java.io.*;
import java.math.BigInteger;

public class Checksum {

    //
    // returns 0 error
    //         1 ok (create)
    //         1 same (check)
    //         2 different (check)
    //
    public static void main(String args[]) {
        if (args.length == 2) {
            if (args[0].equalsIgnoreCase("create")) {
                System.exit(new Checksum().create(args[1]));
            } else if (args[0].equalsIgnoreCase("check")) {
                System.exit(new Checksum().check(args[1]));
            }
        } else {
            System.out.println("Usage : java Checksum create [filename]n" +
                    "        java Checksum check  [filename]");
        }
    }

    public int create(String filename) {
        try {
            int sum;
            String salida = new String();
            byte[] chk = createChecksum(filename);
            File f = new File(filename + ".chk");
            OutputStream os = new FileOutputStream(f);
            //muestra la cadena MD5 y es la misma quela del program MD5Check.exe
            BigInteger bigInt = new BigInteger(1, chk);
            String output = bigInt.toString(16).toUpperCase();;
            if (output.length() < 32){
				System.out.println("Menor de 32");
                sum = 32 - output.length();
                for ( int i = 1 ; i == sum;i++){
                    salida=salida.concat("0");
                }
                salida = salida.concat(output);
            }
            System.out.println("MD5: " + output+" = "+ salida);
            os.write(chk);
            os.close();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int check(String filename) {
        int rc = 0;
        try {
            byte[] chk1 = createChecksum(filename);
            byte[] chk2 = new byte[chk1.length];
            File f = new File(filename + ".chk");
            InputStream is = new FileInputStream(f);

            is.read(chk2);
            //muestra la cadena MD5 y es la misma quela del program MD5Check.exe
            BigInteger bigInt1 = new BigInteger(1, chk1);
            String output1 = bigInt1.toString(16).toUpperCase();;
            System.out.println("MD5: " + filename + "     " + output1);
            BigInteger bigInt2 = new BigInteger(1, chk2);
            String output2 = bigInt2.toString(16).toUpperCase();;
            System.out.println("MD5: " + filename + ".chk " + output2);
            //fin muestra
            //if (new String(chk2).equals(new String(chk1))) {
            if (output2.equals(output1)) {
                System.out.println("Same!");
                rc = 1;
            } else {
                System.out.println("Different!");
                rc = 2;
            }
            is.close();
            return rc;
        } catch (Exception e) {
            e.printStackTrace();
            return rc;
        }
    }

    public byte[] createChecksum(String filename) throws Exception {
        InputStream fis = new FileInputStream(filename);

        byte[] buffer = new byte[1024];
        MessageDigest complete = MessageDigest.getInstance("MD5");
        int numRead;
        do {
            numRead = fis.read(buffer);
            if (numRead > 0) {
                complete.update(buffer, 0, numRead);
            }
        } while (numRead != -1);
        fis.close();
        return complete.digest();
    }
}