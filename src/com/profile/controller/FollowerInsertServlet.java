package com.profile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.profile.model.service.ProfileService;

/**
 * Servlet implementation class FollowerInsertServlet
 */
@WebServlet("/fiPage.pr")
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
		// 나의 번호
		int userNo1 = Integer.parseInt(request.getParameter("uno1"));
		// 팔로우할 사람의 번호
		int userNo2 = Integer.parseInt(request.getParameter("uno2"));
		
		ProfileService ps = new ProfileService();
		
		int result = ps.followInsert(userNo1, userNo2);
		
		if(result > 0 ){
			response.sendRedirect("/pickme/mPicks.pr");			
		}else{
			request.setAttribute("msg", "팔로우 인서트 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);	
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
