package com.profile.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SessionCheck;
import com.pick.model.vo.PickMe;
import com.pick.model.vo.PickResult;
import com.point.model.vo.Point;
import com.profile.model.service.ProfileService;

/**
 * Servlet implementation class MyPicksServlet
 */
@WebServlet("/mPicks.pr")
public class MyPicksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPicksServlet() {
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
			
			// 픽 결과값 불러오기 위한 객체 선언
			ArrayList<PickMe> myPick = new ArrayList<PickMe>();
			// 포인트 값 불러오기 위한 객체
			Point point = new Point();
			int pointResult = 0;
			
			int userNo = Integer.parseInt(request.getParameter("uno"));
			
			pointResult = ps.browsePoint(userNo);
			
			myPick = ps.browseMyPick(userNo);
			
			if(myPick != null){
				request.setAttribute("point", pointResult);
				request.setAttribute("myPick", myPick);
				request.getRequestDispatcher("views/profile/myPicks.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "pick 불러오는 과정에서 오류");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
