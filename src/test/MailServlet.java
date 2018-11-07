package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MailServlet
 */
@WebServlet("/sendmail.do")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 메일 인증 코드 발송 서블릿
	    // 클라이언트에서 인증코드 발송 요청이 오면 
		// to 로 받을사람 을 적고
		// authCode 로 인증코드를 발급받는다.
		// 발급받은 코드는 세션에 "이메일(key),코드(value)" 로 저장한다
		// 이후 클라이언트에서 세션에 값 확인후 변경된 비밀번호 발급
		String to = request.getParameter("to");
		
		System.out.println("[" + to + "]");
		
		SendMail sm = new SendMail();
		String authCode = sm.makeAuthCode();
				
		HttpSession session = request.getSession();
		session.setAttribute(to, authCode);
		
		sm.send(to, authCode);
		
		System.out.println("session 인증값 : " + session.getAttribute(to));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
