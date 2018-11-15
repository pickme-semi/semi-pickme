package com.stats.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pick.model.vo.PickResult;
import com.stats.model.service.StatsService;

/**
 * Servlet implementation class StatsOneList
 */
@WebServlet("/statsOneList.st")
public class StatsOneList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatsOneList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pickId = Integer.parseInt(request.getParameter("id"));
		
		PickResult pr = new PickResult();
		
		pr.setId(pickId);
		
		StatsService ss = new StatsService();
		
		ArrayList<Integer> ageList = new ArrayList<Integer>();
		
		ageList = ss.countAge(pr);
		
		
		
		response.sendRedirect("views/stats/statsOneList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
