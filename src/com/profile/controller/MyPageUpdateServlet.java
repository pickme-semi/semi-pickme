package com.profile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.common.MyRenamePolicy;
import com.common.SessionCheck;
import com.oreilly.servlet.MultipartRequest;
import com.profile.model.service.ProfileService;
import com.profile.model.vo.Category;
import com.user.encrypt.EncryptWrapper;
import com.user.model.vo.User;

/**
 * Servlet implementation class MyPageUpdateServlet
 */
@WebServlet("/mPageUpdate.au")
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
		// 세션에 유저 정보 체크
		// 로그인 유저만 접근가능
		if( !SessionCheck.login(request)) {
			response.sendRedirect("views/common/NotLogin.jsp");
		}else {
			// 파일 처리용 MultipartRequest //
			
			// 1. 업로드할 파일의 최대 크기를 설정 10MB
			int maxSize = 1024 * 1024 * 10;
			
			// 2. multipart/form-data로 전송되었는지 확인!
			if(!ServletFileUpload.isMultipartContent(request)){
				request.setAttribute("msg", "enctype을 통한 multipart 전송이 되지 않았습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			// 3. 웹 상의 루트(최상위) 경로를 활용하여 저장할 폴더 위치를 선정한다.
			String root = request.getServletContext().getRealPath("/resources/");
			
			// 업로드 할 파일 명
			String savePath = root + "/profileImage/";
			System.out.println(savePath);
			MultipartRequest mrequest = new MultipartRequest(
					request,
					savePath,
					maxSize,
					"UTF-8",
					new MyRenamePolicy());
			
			
			String email = mrequest.getParameter("userEmail");
			String gender = mrequest.getParameter("gender");
			
			// String -> Date 형변환
			String birth = mrequest.getParameter("userBirth");
			System.out.println("birth : " +birth);
			java.sql.Date birthdate = null;
			
			if(!birth.equals("")){
			birthdate = java.sql.Date.valueOf(birth);
			}
			
			String type = mrequest.getParameter("userType");
			
			String profile = mrequest.getFilesystemName("profile");
			
			String category = mrequest.getParameterValues("interest")== null ?
				"" : String.join(", ", mrequest.getParameterValues("interest"));
			
			System.out.println(profile);
			
			ProfileService ps = new ProfileService();
			HttpSession session =  request.getSession(false);
			User user = (User)session.getAttribute("user");
			
			user.setUserEmail(email);
			user.setProfile(profile);
			user.setGender(gender);
			user.setBirthdate(birthdate);
			user.setType(type);
			
			
			System.out.println("회원 기존 정보 : " + session.getAttribute("user"));
			System.out.println("회원 정보 수정 시 전달 받은 값 : " + user);
			
			
			try{
		  ps.updateMyPage(user);
		  if(!category.equals("")){
		  ps.insertCategory(user.getUserNo(),category);}
			
			System.out.println("회원 정보 수정 완료! : " + user);
			response.sendRedirect("/pickme/mPicks.pr?uno=" + user.getUserNo());
			
			} catch(Exception e) {
				
			request.setAttribute("msg", "회원 정보 수정 실패!");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
