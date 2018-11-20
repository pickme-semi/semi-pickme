package com.stats.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.SessionCheck;
import com.pick.model.service.PickService;
import com.pick.model.vo.PickMe;

/**
 * Servlet implementation class StatsTotalList
 */
@WebServlet("/sTotalList.st")
public class StatsTotalList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatsTotalList() {
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
			HttpSession session = request.getSession();
			ArrayList<PickMe> list = new ArrayList<PickMe>();
			
			PickService ps = new PickService();
			list = ps.selectList();
			// 제목이랑 번호를 뿌려줘라.........
			response.getWriter().println(list);
			session.setAttribute("list", list);
			response.sendRedirect("views/stats/statsTotalList.jsp");
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
