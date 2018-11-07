package test;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	public boolean send(String to, String authCode){
		Properties p = new Properties(); // 정보를 담을 객체
		p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들
		 
		try{
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getInstance(p, auth);
		     
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    msg.setSubject(getMailName()); // 제목
		     
		    Address fromAddr = new InternetAddress(getMailFrom());
		    msg.setFrom(fromAddr); // 보내는 사람
		     
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		    
		    msg.setContent(getMailContent(authCode) , "text/html;charset=UTF-8"); // 내용과 인코딩
		     
		    Transport.send(msg); // 전송
		} catch(Exception e){
		    e.printStackTrace();
		    return false;
		}
		 
		return true;
	}
	
	// 메일 보내는 사람
	// mail.properties의 mailId
	public String getMailFrom(){
		Properties prop = new Properties();
		
		String filePath = SMTPAuthenticator.class
				.getResource("/config/mail.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return prop.getProperty("mailId");
	}
	
	// 메일 제목
	public String getMailName(){
		String mailName = "[PICKME] 비밀번호 찾기";
		return mailName;
	}
	
	// 메일 내용
	// HTML 템플릿
	public String getMailContent(String authCode){
		String template = "<html><head><meta charset='UTF-8'></head>"
				+ "<body><div style='border:1px solid black;width:400px;'>"
				+ "<div style='background:#FE2EF7;border:1px solid black'>"
				+ "<h1><strong>&nbsp;PICK ME</strong></h1></div><div style='border:1px solid black'>"
				+ "<h3>&nbsp;비밀번호 찾기용 이메일 인증 코드 입니다</h3><h3>&nbsp;&nbsp;"
				+ "<span style='background:#A9BCF5;'>"
				+ authCode
				+ "</span></h3><hr />"
				+ "<h4>&nbsp;본 메일은 발신자 전용입니다.<br>&nbsp;문의사항은 <a href='#'>고객센터</a>로 연락바랍니다."
				+ "<br>&nbsp;서울특별시 강남구 테헤란로14길 6 남도빌딩 3층 - H Class</h4>"
				+ "</div></div></body></html>";
		return template;
	}

	// 인증코드 생성
	public String makeAuthCode(){
		String code = "";
		
		for (int i = 0 ; i < 7; i++){
			int flag = (int)(Math.random()*3+1);
			int check = flag%3;
			
			if(check == 1){
				int rand = (int)(Math.random()*26+65);
				code += (char)(rand);
			}else if(check == 2){
				int rand = (int)(Math.random()*26+97);
				code += (char)(rand);
			}else {
				int rand = (int)(Math.random()*9+1);
				code += rand;
			}
		}
		System.out.println("발급 code : " + code);
		return code;
	}
}
