package com.pick.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pick.model.service.PickService;

/**
 * Servlet implementation class PickSelectOne
 */
@WebServlet("/pickview.pv")
public class PickSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PickSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("id"));
		
		HashMap<String, Object> Pick = new PickService().selectPickMeMap(pid);
		
		System.out.println(Pick);
		
		String page ="";
		if(Pick != null){
			page = "views/Pickpage/PickMain.jsp";
			request.setAttribute("PickMe", Pick.get("PickMe"));
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "pick출력 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
