package test;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
		// 인증 정보 저장 클래스
		// mail.properties 에서 인증정보 가져오기
	
		private Properties prop;
		
		public SMTPAuthenticator(){
			prop = new Properties();
			String filePath = SMTPAuthenticator.class
					.getResource("/config/mail.properties").getPath();
			
			try {
				prop.load(new FileReader(filePath));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	   @Override
	    protected PasswordAuthentication getPasswordAuthentication() {
		   String id = prop.getProperty("mailId");
		   String pass = prop.getProperty("mailPass");
		   
	        return new PasswordAuthentication(id ,pass);
	    }

}
