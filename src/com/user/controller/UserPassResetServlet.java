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

/**
 * Servlet implementation class UserPassResetServlet
 */
@WebServlet("/passReset.au")
public class UserPassResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPassResetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pass = request.getParameter("userPass");
		
		
		UserService us = new UserService();
		
		HttpSession session = request.getSession(true);
		
		String id = (String)session.getAttribute("id");
		
		try {
			us.updatePass(id, pass);
			System.out.println("비밀번호 변경 완료 id :" + id + "비밀번호 : " + pass );
		} catch (UserException e) {
			request.setAttribute("msg", "비밀번호 변경에 실패하였습니다.");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/common/errPage.jsp").forward(request, response);

		}

		response.sendRedirect("/pickme");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
