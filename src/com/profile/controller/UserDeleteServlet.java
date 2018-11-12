package com.profile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.profile.model.service.ProfileService;
import com.user.model.vo.User;

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/uDelete.pr")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProfileService ps = new ProfileService();

		HttpSession session = request.getSession(false);
		int userNo = ((User)session.getAttribute("user")).getUserNo();
		
		// 팔로우 정보 지우기
		int fResult = ps.followDel(userNo);
		
		int result = ps.deleteUser(userNo);
		
		if(result > 0){
			System.out.println("회원 탈퇴 완료!");
			session.invalidate();
			response.sendRedirect("/pickme");
		}else{
			request.setAttribute("msg", "회원 탈퇴 중 에러 발생");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
