package com.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.service.UserService;

/**
 * Servlet implementation class UserPassSearchServlet
 */
@WebServlet("/passSearch.au")
public class UserPassSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPassSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("userPassSearchServlet");
		
		String id = request.getParameter("userId");
		String email = request.getParameter("userEmail");
		
		System.out.println("비밀번호 찾기 파라미터 : userid=" + id + " useremail=" + email );
	
		UserService us = new UserService();
		
		String result = us.passSearch(id,email);
		
		response.getWriter().print(result);
		
		System.out.println(result);
		
		response.sendRedirect("/pickme/views/user/UserPassReset.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
