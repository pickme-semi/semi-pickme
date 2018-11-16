package com.stats.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pick.model.vo.PickResult;
import com.stats.model.service.StatsService;
import com.common.SessionCheck;

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
    
		// 세션에 유저 정보 체크
		// 로그인 유저만 접근가능
		if( !SessionCheck.login(request)) {
			response.sendRedirect("views/common/NotLogin.jsp");
		}else {
		// 로그인 된 유저
			int pickId = Integer.parseInt(request.getParameter("pickno"));
			
			PickResult pr = new PickResult();
			
			pr.setId(pickId);
			
			StatsService ss = new StatsService();
			
			HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
			ArrayList<Integer> list = new ArrayList<Integer>();
			
			//HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
			
			hmap = ss.countAge(pr);
			int cnt=0;
			
			for(int i = 0 ; i <= 50; i+=10){
				if(hmap.get(i) == null){
					cnt = 0;
				}else{
					cnt = hmap.get(i);
				}
				list.add(cnt);
			}
			
			
			
			
			
			response.getWriter().print(list);
			
			
			HttpSession session = request.getSession();
			
			session.setAttribute("ageList", list);
			
			System.out.println(list);
			
			response.sendRedirect("views/stats/statsOneList.jsp");
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
