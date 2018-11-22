package com.stats.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import com.stats.model.vo.ResultVo;
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
			
			// 이 픽을 선택한 사람의 픽통계
			
			HashMap<Integer,Integer> totalMap = new HashMap<Integer, Integer>();
			ArrayList<Integer> totalList = new ArrayList<Integer>();
			
			totalMap = ss.countTotal(pr);
			
			if(totalMap.get(1)==null){
				totalList.add(0);
			}else{
				totalList.add(totalMap.get(1));
			}
			
			if(totalMap.get(2)==null){
				totalList.add(0);
			}else{
				totalList.add(totalMap.get(2));
			}
				
			response.getWriter().print(totalList);
			session.setAttribute("totalList", totalList);
			System.out.println("totalList : " +totalList);
			
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
			
			
			// 성별통계 남자
			HashMap<Integer, Integer> genderMap1 = new HashMap<Integer,Integer>();
			ArrayList<Integer> genderList1 = new ArrayList<Integer>();
			
			genderMap1 = ss.countGender1(pr);
			
			for(int i = 1; i<=2; i++){
			if(genderMap1.get(i)==null){
				genderList1.add(0);
			}else{
				genderList1.add(genderMap1.get(i));
			}
			}
			response.getWriter().print(genderList1);
			session.setAttribute("genderList1", genderList1);
			System.out.println("genderList1 : " + genderList1);
			
			// 성별통계 여자
			HashMap<Integer, Integer> genderMap2 = new HashMap<Integer,Integer>();
			ArrayList<Integer> genderList2 = new ArrayList<Integer>();
			
			genderMap2 = ss.countGender2(pr);
			
			for(int i = 1; i<=2; i++){
			if(genderMap2.get(i)==null){
				genderList2.add(0);
			}else{
				genderList2.add(genderMap2.get(i));
			}
			}
			response.getWriter().print(genderList2);

			
			session.setAttribute("genderList2", genderList2);
			System.out.println("genderList2 : " + genderList2);


			// 카테고리 일치 여부 통계
			
			ArrayList<Integer> catList = new ArrayList<Integer>();
			
			
			catList = ss.countCat(pr);
			
			response.getWriter().println(catList);
			session.setAttribute("catList", catList);
			System.out.println("catList : " + catList);
			
			
			// 일자별 전체 통계
			
			ArrayList<ResultVo> dayList = new ArrayList<ResultVo>();
			
			dayList = ss.countDate(pr);
			
			response.getWriter().println(dayList);
			session.setAttribute("dayList", dayList);
			System.out.println("dayList : " + dayList);
			
			// 일자별 pick1 통계
			ArrayList<ResultVo> pick1List = new ArrayList<ResultVo>();
			ArrayList<ResultVo> dayPick1List = new ArrayList<ResultVo>();
			
			pick1List = ss.countPick1Date(pr);
			System.out.println(pick1List);
			int pick1Count = 0;
			for(int i = 0; i<dayList.size(); i++){
				if(pick1Count>=pick1List.size()){
					dayPick1List.add(new ResultVo(dayList.get(i).getCategory(),0));
				}else{
				if(dayList.get(i).getDate().equals(pick1List.get(pick1Count).getDate())){
					dayPick1List.add(pick1List.get(pick1Count));
					pick1Count++;
				}else{
					dayPick1List.add(new ResultVo(dayList.get(i).getDate(),0));
				}
				}
			}
			response.getWriter().println(dayPick1List);
			session.setAttribute("dayPick1List", dayPick1List);
			System.out.println("dayPick1List : " + dayPick1List);
			
			
			
			// 일자별 pick2 통계
			
			ArrayList<ResultVo> pick2List = new ArrayList<ResultVo>();
			ArrayList<ResultVo> dayPick2List = new ArrayList<ResultVo>();
			
			pick2List = ss.countPick2Date(pr);
			System.out.println(pick2List);
			int pick2Count = 0;
			for(int i = 0; i<dayList.size(); i++){
				if(pick2Count>=pick2List.size()){
					dayPick2List.add(new ResultVo(dayList.get(i).getCategory(),0));
				}else{
				if(dayList.get(i).getDate().equals(pick2List.get(pick2Count).getDate())){
					dayPick2List.add(pick2List.get(pick2Count));
					pick2Count++;
				}else{
					dayPick2List.add(new ResultVo(dayList.get(i).getDate(),0));
				}
				}
			}
			response.getWriter().println(dayPick2List);
			session.setAttribute("dayPick2List", dayPick2List);
			System.out.println("dayPick2List : " + dayPick2List);
			
			
			
			// 카테고리별 전체 TOP5
			ArrayList<ResultVo> cat5List = new ArrayList<ResultVo>();
			
			cat5List = ss.cat5Count(pr);
			
			response.getWriter().println(cat5List);
			session.setAttribute("cat5List", cat5List);
			System.out.println("cat5List : " + cat5List);
			
			
			
			/*// 카테고리 별 pick1 TOP5
			ArrayList<ResultVo> c5Pick1List = new ArrayList<ResultVo>();
			ArrayList<ResultVo> cat5Pick1List = new ArrayList<ResultVo>();
			
			c5Pick1List = ss.cat5Pick1Count(pr,cat5List);
			
			int cat1Count = 0;
			for(int i= 0; i<cat5List.size(); i++){
				if(cat1Count>=c5Pick1List.size()){
					cat5Pick1List.add(new ResultVo(cat5List.get(i).getCategory(),0));
				}else{
				if(cat5List.get(i).getCategory().equals(c5Pick1List.get(cat1Count).getCategory())){
					cat5Pick1List.add(c5Pick1List.get(cat1Count));
					cat1Count++;
				}else{
					cat5Pick1List.add(new ResultVo(cat5List.get(i).getCategory(),0));
				}
				}
			}
			response.getWriter().println(cat5Pick1List);
			session.setAttribute("cat5Pick1List", cat5Pick1List);
			System.out.println("cat5Pick1List : " + cat5Pick1List);
			
			
			// 카테고리 별 pick2 TOP5
			ArrayList<ResultVo> c5Pick2List = new ArrayList<ResultVo>();
			ArrayList<ResultVo> cat5Pick2List = new ArrayList<ResultVo>();
			
			c5Pick2List = ss.cat5Pick2Count(pr,cat5List);
			System.out.println(c5Pick2List);
			int cat2Count = 0;
//			for(int i= 0; i<cat5List.size(); i++){
//				if(cat2Count>=c5Pick2List.size()){
//					cat5Pick2List.add(new ResultVo(cat5List.get(i).getCategory(),0));
//				}else{
//				if(cat5List.get(i).getCategory().equals(c5Pick2List.get(cat2Count).getCategory())){
//					cat5Pick2List.add(c5Pick2List.get(cat2Count));
//					cat2Count++;
//				}else{
//					cat5Pick2List.add(new ResultVo(cat5List.get(i).getCategory(),0));
//				}
//				}
//			}
			
			for(int i = 0 ; i<cat5List.size();i++){
				if(cat2Count>=c5Pick2List.size()){
					cat5Pick2List.add(new ResultVo(cat5List.get(i).getCategory(),0));
				}else{
					for(int j = 0; j<cat5List.size();j++){
						if(cat2Count>=c5Pick2List.size()){
							break;
						}else if(cat5List.get(j).getCategory().equals(c5Pick2List.get(cat2Count).getCategory())){
							cat5Pick2List.add(c5Pick2List.get(cat2Count));
							cat2Count++;
							break;
						}
					}
				
				}
			}
			
			response.getWriter().println(cat5Pick2List);
			session.setAttribute("cat5Pick2List", cat5Pick2List);
			System.out.println("cat5Pick2List : " + cat5Pick2List);*/
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
