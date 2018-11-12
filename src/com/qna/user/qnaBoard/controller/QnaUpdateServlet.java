package com.qna.user.qnaBoard.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qna.user.qnaBoard.model.service.QnaNoticeService;
import com.qna.user.qnaBoard.model.vo.QnaNotice;

/**
 * Servlet implementation class QnaUpdateServlet
 */
@WebServlet("/qUpdate.no")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		String writer = request.getParameter("writer");
		String userId = request.getParameter("userId");
//		Date writeDay = new Date(new GregorianCalendar().getTimeInMillis());
		
		QnaNotice q = new QnaNotice();
		
//		q.setQwriter(userId);
		q.setQcategory(category);
		q.setQtitle(title);
		q.setQcontent(content);
//		q.setQdate(writeDay);
		
		
		QnaNoticeService ns = new QnaNoticeService();
		
		
		int result = ns.insertNotice(q);
		
		if(result > 0){
			response.sendRedirect("qnaList.no");
		
		}else{
			request.getRequestDispatcher("views/common/errorPage.jps").forward(request, response);
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
