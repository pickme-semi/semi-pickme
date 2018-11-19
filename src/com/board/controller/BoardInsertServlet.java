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
import com.user.model.vo.User;

/**
 * Servlet implementation class BoardInserServlet
 */
@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
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
			HttpSession session = request.getSession(true);
			User user = (User)session.getAttribute("user");
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int categoryId = Integer.parseInt(request.getParameter("category"));
			int userNo = user.getUserNo();
			String bType = (request.getParameter("bType").equals("report")? "BOT001" :"BOT002");
			int pickId = (request.getParameter("pickId") != null)? Integer.parseInt(request.getParameter("pickId")) : 0;
			
			System.out.println("서블릿 pickid : " + pickId);
			
			BoardService bs = new BoardService();
			Board board = null;
			

			
			
			
			if(bType.equals("BOT001")) {
				board = new Board(title, content, categoryId, userNo, pickId ,bType);
			}else {
				board = new Board(title, content, categoryId, userNo, bType);
			}
			
			int result = bs.insertBoard(board);
			
			System.out.println("result : " + result);
			
			if(result > 0) {
				String view = "list.bo?bType=";
				if(bType.equals("BOT001")) {
					view += "report";
				}else {
					view += "qna";
				}
				
				response.sendRedirect(view);
				
			}else {
				request.setAttribute("msg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
