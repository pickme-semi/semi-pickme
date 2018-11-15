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
import com.common.SessionCheck;

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
		// 세션에 유저 정보 체크
		// 로그인 유저만 접근가능
		if( !SessionCheck.login(request)) {
			response.sendRedirect("views/common/NotLogin.jsp");
		}else {
			String type = (request.getParameter("bType") == null)? "" : request.getParameter("bType");
			HttpSession session = request.getSession(true);
			BoardService bs = new BoardService();
			ArrayList<BoardCategory> cateList = null;
			ArrayList<Board> boardList = null;
			ArrayList<Board> commonBoardList = null;
			
			ArrayList<BoardCategory> cateListQ = null;
			ArrayList<Board> boardListQ = null;
			
			if(type.equals("report")){
				cateList = bs.getBoardCategory("report");
				boardList = bs.getBoardList("report");
				session.setAttribute("bType", "report");
				
			
			}else if(type.equals("admin")){
				cateList = bs.getBoardCategory("report");
				boardList = bs.getBoardList("report");
				cateListQ = bs.getBoardCategory("qna");
				boardListQ = bs.getBoardList("qna");
				session.setAttribute("bType", "admin");
				
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
			session.setAttribute("cateListQ", cateListQ);
			session.setAttribute("boardListQ", boardListQ);
			
			
			
			System.out.println(cateList);
			System.out.println(boardList);
			System.out.println(cateListQ);
			System.out.println(boardListQ);
			
			if(type.equals("admin")){
				request.getRequestDispatcher("views/board/adminList.jsp").forward(request, response);
			}else{
			request.getRequestDispatcher("views/board/boardList.jsp").forward(request, response); }
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
