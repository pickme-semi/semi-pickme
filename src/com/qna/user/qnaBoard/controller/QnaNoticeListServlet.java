package com.qna.user.qnaBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qna.user.qnaBoard.model.vo.QnaNotice;
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
		ArrayList<QnaNotice> qlist = new ArrayList<QnaNotice>();
		QnaNoticeService qs = new QnaNoticeService();
		qlist = qs.QnaSelectList();
		String page ="";
		
		if(qlist != null){
			page = "views/qna/qnaMaster/qnaListM.jsp";
			request.setAttribute("qlist", qlist);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute(null, response);
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
