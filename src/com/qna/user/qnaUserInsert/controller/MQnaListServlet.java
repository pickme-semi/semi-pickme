package com.qna.user.qnaUserInsert.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qna.user.qnaUserInsert.model.service.QnaService;
import com.qna.user.qnaUserInsert.model.vo.PageInfo;
import com.qna.user.qnaUserInsert.model.vo.QnaBoard;

/**
 * Servlet implementation class MasterQnaListServlet
 */
@WebServlet("/qListM.bo")
public class MQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MQnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<QnaBoard> list = null;
		QnaService qs = new QnaService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 10;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = qs.getListCount();
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1 ;
		endPage = startPage + limit -1;
		
		if(endPage>maxPage) endPage = maxPage;
		
		list = qs.selectList(currentPage, limit);
		
		String page = "";
		
		if(list != null){
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			page = "views/qna/qnaMaster/qnaUserByM.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
		}else{
			page = "views/common/errorPage.jsp";
			
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
