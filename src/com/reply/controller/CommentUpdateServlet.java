package com.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.service.PickCommentService;
import com.reply.model.vo.PickComment;

/**
 * Servlet implementation class CommentUpdateServlet
 */
@WebServlet("/updateComment.pm")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int pid = Integer.parseInt(request.getParameter("Pid"));
		String content = request.getParameter("content");
		
		PickCommentService pcs = new PickCommentService();
		PickComment pc = new PickComment();
		
		pc.setCid(cno);
		pc.setCcontent(content);
		
		int result = pcs.updateComment(pc);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()
					+"/pickview.pv?Pid="+pid);
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
