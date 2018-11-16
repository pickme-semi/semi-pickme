package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.common.SessionCheck;

/**
 * Servlet implementation class BoardReInsertViewServlet
 */
@WebServlet("/InsertReView.bo")
public class BoardReInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReInsertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if( !SessionCheck.login(request)) {
			response.sendRedirect("views/common/NotLogin.jsp");
		}else {
			int id = Integer.parseInt(request.getParameter("id"));
			HttpSession session = request.getSession(true);
			
		
			session.setAttribute("id", id);
			Board b = new BoardService().selectOne(id);
			
			String page = "";

			
			if(b != null){
				page = "views/board/boardReInsert.jsp";
				request.setAttribute("board", b);
				
			} else {
				page = "views/commcon/errorPage.jsp";
			
			}
			
			System.out.println("id : " + id);
			
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
