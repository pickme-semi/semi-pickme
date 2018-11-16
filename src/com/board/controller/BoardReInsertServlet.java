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
import com.oreilly.servlet.MultipartRequest;
import com.user.model.vo.User;

/**
 * Servlet implementation class BoardInserServlet
 */
@WebServlet("/reInsert.bo")
public class BoardReInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReInsertServlet() {
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
		}else{

			HttpSession session = request.getSession(true);
			User user = (User)session.getAttribute("user");
			
			int bid = Integer.parseInt(request.getParameter("bid"));	// 게시물 아이디
			String content = request.getParameter("content");			// 답변 내용
			int userNo = user.getUserNo();								// 답변인
			
			BoardService bs = new BoardService();
			Board b = new Board(bid, content, userNo);
			int result = bs.reInsertBoard(b);
			
			
			
			if(result > 0){
				response.sendRedirect("/pickme/list.bo?bType=admin");
			}
			
		}
	}

	
//	ID
//	BOARD_ID
//	USER_NO
//	CONTENT
//	ENROLL_DATE
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
