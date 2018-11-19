package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.board.model.vo.BoardAnswer;
import com.common.SessionCheck;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/selectOne.bo")
public class BoardSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectOneServlet() {
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
			int id = Integer.parseInt(request.getParameter("id"));
			
			System.out.println(id);
			
			Board b = new BoardService().selectOne(id);
			BoardAnswer ba = new BoardService().selectReOne(id);
			
			String page = "";
			
			if(b != null){
				page = "views/board/boardDetail.jsp";
				request.setAttribute("board", b);
				if(b.getStatus().equals("STA002")) request.setAttribute("answer", ba);
				
				System.out.println("b : " + b);
				System.out.println("ba : " + ba);
				
			} else {		
				page = "views/commcon/errorPage.jsp";
				
			}
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
