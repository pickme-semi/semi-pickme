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
import com.profile.model.vo.Category;
import com.user.model.vo.User;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/mPage.pr")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
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
			
			ArrayList<Category> cArr = new ArrayList<Category>();
			
			cArr = ps.browseCategory();
			
			HttpSession session =  request.getSession(true);
			User user = (User)session.getAttribute("user");
	
			ArrayList<Category> cat = new ArrayList<Category>();
			
			cat = ps.getCategory(user.getUserNo());
			
			//session.setAttribute("category", cat);
			request.setAttribute("category", cat);
			String page = "";
			if(cArr != null){
				request.setAttribute("cArr", cArr);
				page = "views/profile/myPage.jsp";
			}else{
				request.setAttribute("msg", "카테고리에서 값을 불러오는 오류");
				page = "../views/common/errorPage.jsp";
			}
			request.getRequestDispatcher(page).forward(request, response);
			
			System.out.println("카테고리 정보 : " + cat);
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
