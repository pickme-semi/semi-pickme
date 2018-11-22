package com.pick.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SessionCheck;
import com.pick.model.service.PickResultService;
import com.pick.model.vo.PickResult;
import com.point.model.service.PointService;
import com.point.model.vo.Point;

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
		// 세션에 유저 정보 체크
		// 로그인 유저만 접근가능
		if( !SessionCheck.login(request)) {
			response.sendRedirect("views/common/NotLogin.jsp");
		}else {
			
			// Pick 결과 넣기 
			int selectUserNo = Integer.parseInt(request.getParameter("selectUserNo"));
			int resultPickId = Integer.parseInt(request.getParameter("resultPickId"));
			int selectResult = Integer.parseInt(request.getParameter("selectResult"));
			Date selectDdate =  new Date(new GregorianCalendar().getTimeInMillis());
	
			// print 
			System.out.println("selectUserNo  : " + selectUserNo);
			System.out.println("resultPickId  : " + resultPickId);
			System.out.println("selectResult  : " + selectResult);
			System.out.println(selectDdate);
			
		   
			PickResult pr = new PickResult();
			PickResult pr2 = new PickResult();
			
			pr.setId(resultPickId);
			pr.setUserno(selectUserNo);
			pr.setResult(selectResult);
			pr.setDdate(selectDdate);
			
			pr2.setId(resultPickId);
			pr2.setResult(selectResult);
			
			int result = new PickResultService().updatePick(pr);
			
			// 선택 결과값 보여주기 
			PickResultService prs = new PickResultService();
			int result2= prs.getCurrentPick(pr2);
			
			System.out.println("최종 PickResultServlet="+result2);
			
			PointService ps = new PointService();
			Point p = new Point(selectUserNo, 1, 7, "PST001");
			ps.addPoint(p);
			
			System.out.println("픽선택 포인트 증가");

			// 전송하기 
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result2);
		
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
