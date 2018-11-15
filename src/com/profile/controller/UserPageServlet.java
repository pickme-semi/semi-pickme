package com.profile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SessionCheck;
import com.profile.model.service.ProfileService;
import com.user.model.vo.User;

/**
 * Servlet implementation class UserPageServlet
 */
@WebServlet("/uPage.pr")
public class UserPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에 유저 정보 체크
		// 로그인 유저만 접근가능
		if( !SessionCheck.login(request)) {
			response.sendRedirect("views/common/NotLogin.jsp");
		}else {
			ProfileService ps = new ProfileService();
			int userNo = Integer.parseInt(request.getParameter("uno"));
			
			User user = ps.userPage(userNo); 
			
			String page = " ";
			if(user != null){
				
				page = "views/profile/userPage.jsp";
				request.setAttribute("user", user);
				
			}else{
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "사용자 불러오기 오류 ");
				
			}
			request.getRequestDispatcher(page).forward(request, response);
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
