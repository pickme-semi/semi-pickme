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
			HttpSession session = request.getSession();
			
			// pick 1을 선택한 사람의 나이 통계
			HashMap<Integer,Integer> hmap1 = new HashMap<Integer,Integer>();
			ArrayList<Integer> list1 = new ArrayList<Integer>();
			
			//HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
			
			hmap1 = ss.countAge(pr);
			int cnt=0;
			
			for(int i = 0 ; i <= 50; i+=10){
				if(hmap1.get(i) == null){
					cnt = 0;
				}else{
					cnt = hmap1.get(i);
				}
				list1.add(cnt);
			}

			response.getWriter().print(list1);

			
			session.setAttribute("ageList1", list1);
			
			//System.out.println(list1);
			
			// pick 2를 선택한 사람의 나이 통계
			HashMap<Integer,Integer> hmap2 = new HashMap<Integer,Integer>();
			ArrayList<Integer> list2 = new ArrayList<Integer>();
			
			hmap2 = ss.countAge2(pr);
			
			for(int i = 0 ; i <= 50; i+=10){
				if(hmap2.get(i) == null){
					cnt = 0;
				}else{
					cnt = hmap2.get(i);
				}
				list2.add(cnt);
			}
			
			response.getWriter().print(list2);

			
			session.setAttribute("ageList2", list2);
			
			//System.out.println(list2);
			
			// 성별통계 전체
			HashMap<String, Integer> genderMap = new HashMap<String,Integer>();
			ArrayList<Integer> genderList = new ArrayList<Integer>();
			
			genderMap = ss.countGender(pr);
			
			
			if(genderMap.get("M")==null){
				genderList.add(0);
			}else{
				genderList.add(genderMap.get("M"));
			}
			
			if(genderMap.get("F")==null){
				genderList.add(0);
			}else{
				genderList.add(genderMap.get("F"));
			}
				
			
			
			response.getWriter().print(genderList);

			
			session.setAttribute("genderList", genderList);
			
			System.out.println("genderList : " +genderList);
			
			
			/* 여기 오류나서 일단 막아놓음 미완성... 
			
			// 성별통계 남자
			HashMap<Integer, Integer> genderMap1 = new HashMap<Integer,Integer>();
			ArrayList<Integer> genderList1 = new ArrayList<Integer>();
			
			genderMap1 = ss.countGender1(pr);
			
			
			
			
				
			
			
			response.getWriter().print(genderList1);

			
			session.setAttribute("genderList", genderList1);
			
			//System.out.println("genderList : " +genderList);
			*/
			
			
			
			
			
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
