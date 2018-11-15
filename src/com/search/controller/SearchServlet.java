package com.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.SessionCheck;
import com.pick.model.vo.PickMe;
import com.search.model.service.SearchService;
import com.user.model.vo.User;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.se")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
			// userSearch
			// @유저 검색,
			// #카테고리 검색,
			// 아무것도 없을때 픽검색
			String search = request.getParameter("userSearch");
			String option = "";
			
			SearchService ss = new SearchService();
			
			ArrayList searchList = null;
			
			switch (search.charAt(0)) {
			case '@':
				option = "user";
				search = search.substring(1);
				searchList = new ArrayList<User>();
				searchList = ss.searchUser(search);
				break;
			case '#':
				option = "category";
				search = search.substring(1);
				searchList = new ArrayList<PickMe>();
				searchList = ss.searchCategoryPick(search);
				break;
			default:
				option = "pick";
				searchList = new ArrayList<PickMe>();
				searchList = ss.searchPick(search);
				break;
			}
			
			
			HttpSession session = request.getSession(true);
			session.setAttribute("searchList", searchList);
			
			System.out.println("서치리스트 : " + searchList);
			System.out.println("검색 옵션 : " + option);
			System.out.println("검색할 단어 : " + search);
			
			if(option == "user") {
				System.out.println("user");
				response.sendRedirect("views/search/SearchUserList.jsp");
			}else {
				System.out.println("pick & cate");
				response.sendRedirect("views/search/SearchPickList.jsp");
			}
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
