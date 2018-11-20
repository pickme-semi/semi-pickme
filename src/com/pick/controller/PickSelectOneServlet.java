package com.pick.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SessionCheck;
import com.pick.model.service.PickService;
import com.reply.model.service.PickCommentService;
import com.reply.model.vo.PickComment;

/**
 * Servlet implementation class PickSelectOne
 */
@WebServlet("/pickview.pv")
public class PickSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PickSelectOneServlet() {
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
			System.out.println(request.getParameter("Pid"));
			int pid = Integer.parseInt(request.getParameter("Pid"));			
			
			HashMap<String, Object> Pick = new PickService().selectPickMeMap(pid);
			
			ArrayList<PickComment> clist = 
					new PickCommentService().selectList(pid);
			
			System.out.println(Pick);
			System.out.println(clist);
			
			String page ="";
			if(Pick != null){
				page = "views/pickpage/PickSub.jsp";
				request.setAttribute("PickMe", Pick.get("PickMe"));
				request.setAttribute("clist", clist);
				
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "pick출력 실패");
			}
			
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
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
