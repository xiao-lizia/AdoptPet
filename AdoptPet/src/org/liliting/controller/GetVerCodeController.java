package org.liliting.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("verCode")
@Controller
public class GetVerCodeController extends HttpServlet{
	
	/***
	 * 获取图片验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("getImgVerCode")
	public void getImgVerCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		// 设置验证码图片的长、高和类型。
		int width = 200,height = 40;
		BufferedImage bfi = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
		//画图画板
		Graphics graph = bfi.getGraphics();
		graph.setColor(new Color(160,177,185));//画板背景颜色
		graph.fillRect(1, 1, width-1, height-1);//填充范围
		graph.drawRect(0, 0, width-1, height-1);
		Font font = new Font("Arial Black", Font.PLAIN, 20);
		graph.setFont(font);

		Random random = new Random();
		String verC = "";
		for(int i =0; i<4; i++) {
			String tmpC = getRandChar();
			//System.out.println(tmpC);
			verC += tmpC;
			graph.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			graph.drawString(tmpC, 20 * i + 5,  27);//画板上写字符、起始位置
		}
		HttpSession session = request.getSession();
		session.setAttribute("verCode", verC.toLowerCase());
		graph.dispose();//显示图片
		ImageIO.write(bfi, "JPEG", response.getOutputStream());
		
	}
	//获取随机数
	private String getRandChar() {
		int random = (int) Math.round(Math.random()*2);
		long itmp = 0;
		char ctmp = '\u0000';
		switch(random) {
			case 1:
				itmp = Math.round(Math.random() * 25 + 65);
				ctmp = (char) itmp;
				return String.valueOf(ctmp);
			case 2:
				itmp = Math.round(Math.random() * 25 + 97);
				ctmp = (char) itmp;
				return String.valueOf(ctmp);
			default :
				itmp = Math.round(Math.random() * 9);
				return String.valueOf(itmp);
		}
	} 
	
}
