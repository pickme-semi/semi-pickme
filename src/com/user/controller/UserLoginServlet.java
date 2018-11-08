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
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/login.au")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("userLoginServlet");
		
		String id = request.getParameter("userId");
		String pass = request.getParameter("userPass");
		
		UserService us = new UserService();
		
		User u = new User(id, pass);
		
		System.out.println("전달받은 회원 정보 : " + u );
		
		try {
			u = us.loginUser(u);
			System.out.println("로그인 성공!");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("user", u);
			
			response.sendRedirect("views/pickpage/PickMain.jsp");
			
		} catch (UserException e) {
			request.setAttribute("msg", "회원 로그인 실패");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			e.printStackTrace();
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
