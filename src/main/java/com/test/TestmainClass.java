
package com.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;


public class TestmainClass {

	
	public static void main(String[] args)  {
		// String input = "త్రివిక్రమ్";
         //System.out.println("Original input string from client: " + input);

         String encoded;
         try {
            // encoded = URLEncoder.encode(input, "UTF-8");
          
        // System.out.println("URL-encoded by client with UTF-8: " + encoded);

         //String incorrectDecoded = URLDecoder.decode(encoded, "ISO-8859-1");
        // System.out.println("Then URL-decoded by server with ISO-8859-1: " + incorrectDecoded);

         String correctDecoded = URLDecoder.decode("%E0%B0%A4%E0%B1%8D%E0%B0%B0%E0%B0%BF%E0%B0%B5%E0%B0%BF%E0%B0%95%E0%B1%8D%E0%B0%B0%E0%B0%AE%E0%B1%8D", "UTF-8");
         System.out.println("Server should URL-decode with UTF-8: " + correctDecoded);
         } catch (UnsupportedEncodingException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
	}
} 