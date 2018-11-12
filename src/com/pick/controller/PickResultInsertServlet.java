package com.pick.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pick.model.service.PickResultService;
import com.pick.model.vo.PickResult;

/**
 * Servlet implementation class PickResultInsertServlet
 */
@WebServlet("/pickresult.pr")
public class PickResultInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PickResultInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int resultPickId = Integer.parseInt(request.getParameter("resultPickId"));
		int selectUserNo = Integer.parseInt(request.getParameter("selectUserNo"));
		int selectResult = Integer.parseInt(request.getParameter("selectResult"));
		Date selectDdate =  Date.valueOf(request.getParameter("selectDdate"));
		
		
		System.out.println("resultPickId = " +resultPickId
				+"selectUserNo = " +selectUserNo
				+"selectResult = " +selectResult
				+"selectDdate = " +selectDdate
				);
		
		
		// 우선 보류 
		/*
		PickResult pr = new PickResult();
			pr.setId(resultPickId);
			pr.setUserno(selectUserNo);
			pr.setResult(selectResult);
			pr.setDdate(selectDdate);
			
			int result = new PickResultService().updatePick(pr);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
