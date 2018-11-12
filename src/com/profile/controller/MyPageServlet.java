package com.profile.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.profile.model.service.ProfileService;
import com.profile.model.vo.Category;

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
		ProfileService ps = new ProfileService();
		
		ArrayList<Category> cArr = new ArrayList<Category>();
		
		cArr = ps.browseCategory();
		
		String page = "";
		if(cArr != null){
			request.setAttribute("cArr", cArr);
			page = "views/profile/myPage.jsp";
		}else{
			request.setAttribute("msg", "카테고리에서 값을 불러오는 오류");
			page = "../views/common/errorPage.jsp";
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
