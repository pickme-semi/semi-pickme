package com.profile.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.SessionCheck;
import com.profile.model.service.ProfileService;
import com.user.model.vo.User;

/**
 * Servlet implementation class FollowerList
 */
@WebServlet("/fList.pr")
public class FollowerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowerListServlet() {
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
			ArrayList<User> list = null;
			ProfileService ps = new ProfileService();
			
			// 팔로워 수 카운트
			int followerCount = 0;
	
			HttpSession session = request.getSession(false);
			User user = (User)session.getAttribute("user");
			int userNo = user.getUserNo();
			
			list = ps.followerList(userNo);
			followerCount = ps.followerCount(userNo);
			
			String page = "";
			
			if(list != null){
				page = "views/profile/followerList.jsp";
				request.setAttribute("list", list);
				request.setAttribute("followerCount", followerCount);
			}else{
				page = "views/common/errorPage.jsp";
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
