package com.qna.user.qnaUserInsert.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qna.user.qnaUserInsert.model.service.QnaService;
import com.qna.user.qnaUserInsert.model.vo.QnaBoard;

/**
 * Servlet implementation class MQnaSelectOne
 */
@WebServlet("/MselectOne.qno")
public class MQnaSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MQnaSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qid = Integer.parseInt(request.getParameter("qno"));
		
		QnaBoard q = new QnaService().mSelectOne(qid);
		String page = "";
		
		if(q != null){
			page = "views/qna/qnaMaster/userQnaDetail.jsp";
			request.setAttribute("qnaboard", q);
			
		}else{
			page = "view/common/errorPage.jsp";
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
