package org.liliting.util;

import java.security.MessageDigest;

import org.apache.commons.codec.digest.Md5Crypt;

public class GetMd5Util{
	//盐，用于混交md5
	private static final String salt = "%&*%*jsh@$^j*%";
	public static String GetMd5(String value) {
        try {
            value = value + salt;
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(value.getBytes("UTF8"));
            byte message[] = messageDigest.digest();
            String result = "";
            for (int i = 0; i < message.length; i++) {
                result += Integer.toHexString((0x000000FF & message[i]) | 0xFFFFFF00).substring(6);
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
