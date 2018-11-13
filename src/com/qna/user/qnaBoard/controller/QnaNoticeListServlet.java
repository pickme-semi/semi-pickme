package com.qna.user.qnaBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qna.user.qnaBoard.model.vo.QnaNotice;
import com.qna.user.qnaBoard.model.vo.PageInfo;
import com.qna.user.qnaBoard.model.service.QnaNoticeService;

/**
 * Servlet implementation class QnaNoticeListServlet
 */
@WebServlet("/qnaList.no")
public class QnaNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<QnaNotice> qlist = null;
		QnaNoticeService qs = new QnaNoticeService();
		
		System.out.println("servlet");
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 10;
		
		if(request.getParameter("currentPage") != null ){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = qs.getListCount();
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage/limit + 0.9) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		
		if(endPage > maxPage) endPage = maxPage;
		qlist = qs.QnaSelectList(currentPage, limit);
		
		System.out.println("qlist " + qlist);
		
		String page = "";
		
		
		if(qlist != null){
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	
				page = "views/qna/qnaMaster/qnaListM.jsp";
				request.setAttribute("pi", pi);
				request.setAttribute("qlist", qlist);
				
				
				
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시글 목록 조회 실패!");
			}
			
			request.getRequestDispatcher(page).forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
