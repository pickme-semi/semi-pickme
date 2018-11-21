package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.SessionCheck;

/**
 * Servlet implementation class BoardInsertViewServlet
 */
@WebServlet("/InsertView.bo")
public class BoardInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertViewServlet() {
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
			String type = (request.getParameter("bType") == null)? "" : request.getParameter("bType");
			HttpSession session = request.getSession(true);
			
			if(type.equals("report")){
				session.setAttribute("bType", "report");
			}else{
				session.setAttribute("bType", "qna");
			}
			
			if((type.equals("report") && (request.getParameter("pickid") == null)) || (type.equals("report") && (request.getParameter("pickid") == ""))){
				response.sendRedirect("views/common/errorPage.jsp");
			}else{
				request.getRequestDispatcher("views/board/boardInsert.jsp").forward(request, response);
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
