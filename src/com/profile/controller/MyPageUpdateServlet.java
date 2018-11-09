package com.profile.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.profile.model.service.ProfileService;
import com.user.model.vo.User;

/**
 * Servlet implementation class MyPageUpdateServlet
 */
@WebServlet("/mPageUpdate.pr")
public class MyPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProfileService ps = new ProfileService();
		
		if(ServletFileUpload.isMultipartContent(request)){
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getServletContext().getRealPath("/resources");
			
			String savePath = root + "/profileImage/";
			
			MultipartRequest mrequest = new MultipartRequest(
					request,
					savePath,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy());
			
			HttpSession session = request.getSession(false);
			
			User user = (User)session.getAttribute("user");
			
			String userPass = mrequest.getParameter("userPass");
			String userEmail = mrequest.getParameter("userEmail");
			
			
			
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
