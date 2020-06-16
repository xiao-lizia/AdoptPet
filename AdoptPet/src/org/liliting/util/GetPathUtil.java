package org.liliting.util;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class GetPathUtil extends HttpServlet{
	public static String getPath(HttpServletRequest request) {
		return request.getContextPath();
	}
}
