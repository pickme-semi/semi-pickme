package com.pick.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SessionCheck;
import com.pick.model.service.PickService;
import com.pick.model.vo.PickCategory;
/**
 * Servlet implementation class PickCategoryServlet
 */
@WebServlet("/pcate.pm")
public class PickCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PickCategoryServlet() {
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
			PickService ps = new PickService();
			
			ArrayList<PickCategory> pcArr = new ArrayList<PickCategory>();
			
			pcArr = ps.browseCategory();
			
			String page = "";
			if(pcArr != null){
				request.setAttribute("pcArr", pcArr);
				page = "views/pickpage/PickUpload.jsp";
			}else{
				request.setAttribute("msg", "카테고리에서 값을 불러오는 오류");
				page = "../views/common/errorPage.jsp";
			}
			System.out.println(pcArr);
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
