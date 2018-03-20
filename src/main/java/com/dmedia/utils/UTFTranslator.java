package com.dmedia.utils;

import java.net.URLDecoder;

public class UTFTranslator {
	
	public static String decodeUTF(String input){
		try {
			return URLDecoder.decode(input, "UTF-8");
		} catch (Exception e) {
			return input;
		}	
	}

}
