package com.pick.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.pick.model.service.PickService;
import com.pick.model.vo.PickMe;

/**
 * Servlet implementation class PickUpload
 */
@WebServlet("/pickup.pm")
public class PickUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PickUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PickService ps = new PickService();
		PickMe pm = new PickMe();
				
		String ptitle = request.getParameter("title");
		String pwriter = request.getParameter("userid");
		String pick1 = request.getParameter("pick1");
		String pick2 = request.getParameter("pick2");
		String pcontent = request.getParameter("content");
		String pcategory = request.getParameter("category");
		
		
		pm.setTitle(ptitle);
		
		pm.setSelect_1(pick1);
		pm.setSelect_2(pick2);
		pm.setContent(pcontent);
		pm.setCategory(category);
		
		int result = ps.insertNotice(pm);
		
		if(result > 0 ) {
			response.sendRedirect("pickmain.pm");
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
