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
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/bUpdate.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
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
			BoardService bs = new BoardService();
			Board b = bs.selectOne(id);
			
			
			String content = request.getParameter("content");
			int pickId = (request.getParameter("pickId") != null)? Integer.parseInt(request.getParameter("pickId")) : 0; 
			
			
			
			System.out.println("content : " + content);
			System.out.println("id : " + id);
			System.out.println("pickid : " + pickId);
			
			b.setId(id);
			b.setContent(content);
			b.setPickId(pickId);
			
			int result = bs.updateBoard(b);
			
			if(result > 0){
				request.setAttribute("board", b);
				request.getRequestDispatcher("views/board/boardDetail.jsp");
			}else{
				request.getRequestDispatcher("views/common/errorPage.jsp");
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
