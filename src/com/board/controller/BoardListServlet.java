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
import com.board.model.vo.BoardAnswer;
import com.board.model.vo.BoardCategory;
import com.board.model.vo.PageInfo;
import com.common.SessionCheck;
import com.user.model.vo.User;

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
			ArrayList<Board> boardQnaList = null;
			BoardService bs = new BoardService();
			
			// -- 페이징 처리(데이터를 일정량 끊어서 가져오는 기술 ) -- //
			
			int startPage;	// 한번에 표시되는 첫 페이지 (1,2,3,4,5) --> 1
			int endPage;	// 한번에 표시되는 페이지의 마지막 페이지 (1,2,3,4,5) --> 5
			int maxPage;	// 전체 페이지의 마지막 페이지 (21, 22) --> 22
			int currentPage;// 현재 사용자가 위치한 페이지
			int limit;		// 한번에 보여줄 페이지 수
			
			// 게시판은 1페이지부터 시작 한다.
			currentPage = 1;
			
			limit = 10; // 한 번에 보여줄 페이지 수 / 한 페이지에 표시할 게시글 수
			
			// 만약에 사용자가 현재 페이지의 현재 접속한 페이지의 정보를 가진다면
			// 해당 페이지의 정보를 받을 수 있어야 한다.
			if(request.getParameter("currentPage") != null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// 전체 게시글 수 조회하기
			int listCount = bs.getListCount(type);
			
			System.out.println("전체 게시글 수  : " + listCount);
			
			// 전체 게시글 수를 통한 
			// 페이지 내 게시글 수 계산
			// 1,2,3,4,5 --> 50개
			// 전체 게시글 수가 13개라면
			// 페이지는 1, 2
			// 짜투리 게시글도 하나의 페이지로 처리하는 계산을 수행한다.
			// 10/1 --> 0.1 --> 0.1+0.9
			
			maxPage = (int)((double)listCount / limit + 0.9);
			
			// 시작 페이지와 마지막 페이지 계산하기
			startPage = ((int)((double)currentPage / limit + 0.9)-1)*limit + 1;
			
			// 마지막 페이지
			endPage = startPage + limit - 1;
			
			// 마지막 페이지 보다 현재 게시글의 페이지가 적다면
			// endPage를 maxPage로 바꿔준다.
			
			if(endPage > maxPage){
				endPage = maxPage;
			}
			
			
			HttpSession session = request.getSession(true);
			ArrayList<BoardCategory> cateList = null;
			ArrayList<Board> commonBoardList = null;
			ArrayList<Board> boardList = null;
			ArrayList<BoardAnswer> commonAnswerList = null;
			
			ArrayList<BoardCategory> cateListQ = null;
			ArrayList<Board> boardListQ = null;
			
			boardList = bs.selectList(currentPage, limit, type);
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit,
								maxPage, startPage, endPage);
			session.setAttribute("pi", pi);
			
			if(type.equals("report")){
				cateList = bs.getBoardCategory("report");
//				boardList = bs.getBoardList("report");
				session.setAttribute("bType", "report");
			
			}else if(type.equals("admin")){
				cateList = bs.getBoardCategory("report");
				boardList = bs.getBoardList("report");
				cateListQ = bs.getBoardCategory("qna");
				boardListQ = bs.getBoardList("qna");
				session.setAttribute("bType", "admin");
				
			}else{
				cateList = bs.getBoardCategory("qna");
//				boardList = bs.getBoardList("qna");
				commonBoardList = bs.getCommonBoardList();
				commonAnswerList = bs.getCommonAnswerList();
				
				System.out.println("컴먼 : " + commonBoardList);
				
				session.setAttribute("bType", "qna");
				session.setAttribute("commonBoardList", commonBoardList);
				session.setAttribute("commonAnswerList", commonAnswerList);
				
			}
			
			session.setAttribute("boardQnaList", boardQnaList);
			session.setAttribute("cateList", cateList);
			session.setAttribute("boardList", boardList);
			session.setAttribute("cateListQ", cateListQ);
			session.setAttribute("boardListQ", boardListQ);
			
			System.out.println(cateList);
			System.out.println(boardList);
			System.out.println(cateListQ);
			System.out.println(boardListQ);
			
			if(type.equals("admin")){
				User u = (User)request.getSession(true).getAttribute("user");
				
				if(u.getUserId().equals("admin")){
					request.getRequestDispatcher("views/board/adminList.jsp").forward(request, response);
				}else{
					// not admin
					request.getRequestDispatcher("views/common/NotAdmin.jsp").forward(request, response);
				}
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
