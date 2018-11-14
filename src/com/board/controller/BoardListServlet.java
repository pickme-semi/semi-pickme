package com.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.board.model.vo.BoardCategory;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/list.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = (request.getParameter("bType") == null)? "" : request.getParameter("bType");
		HttpSession session = request.getSession(true);
		BoardService bs = new BoardService();
		ArrayList<BoardCategory> cateList = null;
		ArrayList<Board> boardList = null;
		ArrayList<Board> commonBoardList = null;
		
		if(type.equals("report")){
			cateList = bs.getBoardCategory("report");
			boardList = bs.getBoardList("report");
			session.setAttribute("bType", "report");
		}else{
			cateList = bs.getBoardCategory("qna");
			boardList = bs.getBoardList("qna");
			commonBoardList = bs.getCommonBoardList();
			
			System.out.println("컴먼 : " + commonBoardList);
			
			session.setAttribute("bType", "qna");
			session.setAttribute("commonBoardList", commonBoardList);
		}
		
		session.setAttribute("cateList", cateList);
		session.setAttribute("boardList", boardList);
		
		System.out.println(cateList);
		System.out.println(boardList);
		
		
		request.getRequestDispatcher("views/board/boardList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
