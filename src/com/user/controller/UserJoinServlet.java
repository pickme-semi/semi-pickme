package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.exception.UserException;
import com.user.model.service.UserService;
import com.user.model.vo.User;

/**
 * Servlet implementation class UserJoinServlet
 */
@WebServlet("/userJoin.au")
public class UserJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("userJoinServlet");
		
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		
		
		UserService us = new UserService();
		
		User u = new User(userId, userPass, userEmail, userName);
		
		System.out.println("가입할 유저 정보 : " + u);
		
		try {
			us.JoinUser(u);
			System.out.println("회원가입 완료! : " + u );
			
			HttpSession session = request.getSession();
			
			session.setAttribute("user", u);
			
			response.sendRedirect("/pickme");
			
			
		} catch (Exception e) {
			request.setAttribute("msg", "회원가입 중 에러가 발생하였습니다.");
			request.setAttribute("exception",e);
			request.getRequestDispatcher("views/common/errPage.jsp").forward(request, response);
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
