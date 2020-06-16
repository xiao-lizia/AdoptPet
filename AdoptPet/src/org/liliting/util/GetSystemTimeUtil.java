package org.liliting.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetSystemTimeUtil {
	
	public static String getSystemTime() {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		return df.format(date);
	}
	public static String getSystemTimeByTimeStamp() {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(date);
	}
	public static String getSystemTimeByTimeStamp(Timestamp time) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(time);
	}
}
