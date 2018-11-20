package com.point.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import com.common.SessionCheck;
import com.point.model.service.PointService;
import com.point.model.vo.Point;

/**
 * Servlet implementation class PointAddServlet
 */
@WebServlet("/pointAdd.po")
public class PointAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!SessionCheck.login(request)){
			
		}else{
			int userno = Integer.parseInt(request.getParameter("userno"));
			int point = Integer.parseInt(request.getParameter("point"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			String pstatus = request.getParameter("pstatus");	// 획득(PST001), 사용 (PST002)
			
			Point p = new Point(userno, point , pid, pstatus);
			
			PointService ps = new PointService();
			
			int result = ps.addPoint(p);
			
			if(result > 0){
				System.out.println("포인트 추가 성공");
			}else{
				System.out.println("포인트 추가 실패");
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
