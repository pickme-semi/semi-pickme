package com.profile.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.profile.model.service.ProfileService;
import com.user.model.vo.User;

/**
 * Servlet implementation class FollowingListServlet
 */
@WebServlet("/fiList.pr")
public class FollowingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowingListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> list = null;
		ProfileService ps = new ProfileService();

		// 팔로잉 수 카운트
		int followingCount = 0;

		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		int userNo = user.getUserNo();
		
		list = ps.followingList(userNo);
		followingCount = ps.followingCount(userNo);
		
		String page = "";
		
		if(list != null){
			
			page = "views/profile/followingList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("followingCount", followingCount);
			
		}else{
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
