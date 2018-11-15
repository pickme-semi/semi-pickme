package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		String result = null;
		UserService us = new UserService();
		
		System.out.println("id : " + id);
		
		System.out.println("pass : " + pass);
		
		User u = new User(id, pass);
		
		System.out.println("전달받은 회원 정보 : " + u );
		
		try {
			u = us.loginUser(u);
			System.out.println("로그인 성공!");
			System.out.println(u);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("user", u);
			result = "ok";
			response.getWriter().print(result);
			
			// response.sendRedirect("views/pickpage/PickMain.jsp");
			response.sendRedirect("pickmain.pm");
			
		} catch (UserException e) {
			request.setAttribute("msg", "회원 로그인 실패");
			request.setAttribute("exception", e);
			PrintWriter out = response.getWriter();
			System.out.println("로그인 실패");
			result = "fail";
			response.getWriter().print(result);
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
