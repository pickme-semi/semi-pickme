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
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/reply.pm")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int writer = Integer.parseInt(request.getParameter("writer"));
		String ccontent = request.getParameter("replyContent");
		int pid = Integer.parseInt(request.getParameter("Pid"));		
		int clevel = Integer.parseInt(request.getParameter("clevel"));
		int refcno = Integer.parseInt(request.getParameter("refcno"));
		String name = request.getParameter("writerid");
		
		PickComment pc = new PickComment();
		pc.setUserno(writer);
		pc.setCcontent(ccontent);
		pc.setPid(pid);			
		pc.setClevel(clevel);
		pc.setRefcno(refcno);
		pc.setName(name);
		
		
		int result = new PickCommentService().insertComment(pc);
		
		System.out.println("result : " + result);
		System.out.println("result pc : " + pc);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()
					+"/pickview.pv?Pid="+pid);
		} else {
			request.setAttribute("msg", "댓글 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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
