package com.profile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.SessionCheck;
import com.profile.model.service.ProfileService;
import com.user.encrypt.EncryptWrapper;
import com.user.model.vo.User;

/**
 * Servlet implementation class MyPageUpdate2Servlet
 */
@WebServlet("/mPageUpdate2.au")
public class MyPageUpdate2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdate2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if( !SessionCheck.login(request)) {
			response.sendRedirect("views/common/NotLogin.jsp");
			
		}else {
			
			String password = request.getParameter("userPass");
			
			System.out.println("servlet pwd : " + password);
			
			ProfileService ps = new ProfileService();
			HttpSession session =  request.getSession(false);
			User user = (User)session.getAttribute("user");
			
			if(!password.equals("")){
				
				user.setUserPass(password);
			}else{
				System.out.println("null일때 :" +user.getUserPass());
				user.setUserPass(user.getUserPass());
			}
			
			try{
				ps.updateMyPage2(user);
				response.sendRedirect("/pickme/mPicks.pr?uno=" + user.getUserNo());
				
			} catch(Exception e) {
				
			request.setAttribute("msg", "회원 정보 수정 실패!");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
