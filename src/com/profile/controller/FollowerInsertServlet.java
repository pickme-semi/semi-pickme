package com.profile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SessionCheck;
import com.google.gson.Gson;
import com.profile.model.service.ProfileService;

/**
 * Servlet implementation class FollowerInsertServlet
 */
@WebServlet("/fInsert.pr")
public class FollowerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowerInsertServlet() {
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
				// 팔로우 할 사람의 번호
				int userNo1 = Integer.parseInt(request.getParameter("uno1"));
				// 내 번호 
				int userNo2 = Integer.parseInt(request.getParameter("uno2"));
				
				ProfileService ps = new ProfileService();
				
				int result = ps.followInsert(userNo1, userNo2);
				
				response.setCharacterEncoding("UTF-8");
				response.getWriter().println(result);
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
