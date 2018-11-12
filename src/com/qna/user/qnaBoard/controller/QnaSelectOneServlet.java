package com.qna.user.qnaBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qna.user.qnaBoard.model.service.QnaNoticeService;
import com.qna.user.qnaBoard.model.vo.QnaNotice;

/**
 * Servlet implementation class QnaSelectOneServlet
 */
@WebServlet("/qSelectOne.no")
public class QnaSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnno = Integer.parseInt(request.getParameter("qnno"));
		QnaNoticeService ns = new QnaNoticeService();
		
		QnaNotice q = ns.qnaSelectOne(qnno);
		String page = "";
		
		if(q != null){
			page = "views/qna/qnaMaster/QnaNoticeDetail.jsp";
			request.setAttribute("qnaNotice", q);
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
