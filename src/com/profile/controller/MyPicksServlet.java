package com.profile.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pick.model.vo.PickMe;
import com.pick.model.vo.PickResult;
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
		
		ProfileService ps = new ProfileService();
		
		ArrayList<PickMe> myPick = new ArrayList<PickMe>();
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		
		System.out.println(userNo);
		
		myPick = ps.browseMyPick(userNo);
		System.out.println(myPick);
		
		if(myPick != null){
			request.setAttribute("myPick", myPick );
			request.getRequestDispatcher("views/profile/myPicks.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "pick 불러오는 과정에서 오류");
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
