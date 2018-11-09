package com.pick.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.common.MyRenamePolicy;
import com.pick.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;
import com.pick.model.service.PickService;
import com.pick.model.vo.PickMe;

/**
 * Servlet implementation class PickUpload
 */
@WebServlet("/pickup.pm")
public class PickUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PickUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)){
			// 만약 multipart/form-data 로 전송이 되었다면 실행
			
			// 전송할 파일의 용량 선정
			int maxSize = 1024 * 1024 * 10;
			
			// 저장할 경로 설정하기
			String root = request.getServletContext().getRealPath("/resources");
			
			System.out.println("root 경로 확인 : " + root);
					
			String savePath = root + "/PickUploadFiles//";			
			
			
			System.out.println("저장 경로 : " + savePath);
			
			MultipartRequest mrequest = 
					new MultipartRequest(request, 
										savePath,
										maxSize,
										"UTF-8",
										new MyRenamePolicy());
			
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본 파일 명
			ArrayList<String> originFiles = new ArrayList<String>();
			
			// 폼으로 전송된 파일 이름들을 받아온다.
			Enumeration<String> files
			 = mrequest.getFileNames();
			
			while(files.hasMoreElements()){
				// 각 파일의 정보를 가져와서 DB에 저장할 내용을 추출한다.
				
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				
				saveFiles.add(mrequest.getFilesystemName(name));
				originFiles.add(mrequest.getOriginalFileName(name));				
			}		
		
		PickMe pm = new PickMe();
		
		
		pm.setTitle(mrequest.getParameter("title")); 
		pm.setSelect_1(mrequest.getFile("pick1").getPath()); // 파일 업로드 경로 DB 저장		
		/*System.out.println(mrequest.getFile("pick1").getAbsolutePath());
		System.out.println(mrequest.getFile("pick1").getCanonicalPath());
		System.out.println(mrequest.getFile("pick1").getPath());*/				
		pm.setSelect_2(mrequest.getFile("pick2").getPath());
		pm.setContent(mrequest.getParameter("content"));
		System.out.println(Integer.parseInt(mrequest.getParameter("userId")));
		pm.setUserno(Integer.parseInt(mrequest.getParameter("userId")));		
		
		
		
		// System.out.println(mrequest.getParameter("ddate"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date ddate;
		try {
			
			ddate = new java.sql.Date(sdf.parse(mrequest.getParameter("ddate")).getTime());

			pm.setDdate(ddate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
		System.out.println("pm :" +pm);
		
		
		
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		
		for(int i = originFiles.size() -1 ; i >= 0 ; i--){
			// 기존에 역순으로 저장된 파일 리스트를 올바른 순서로 재정렬하기
			Attachment at = new Attachment();
			
			at.setFilePath(savePath);
			at.setOriginName(originFiles.get(i));
			at.setChangeName(saveFiles.get(i));
			
			System.out.println("at : " + at);
			list.add(at);
		}
		
		PickService ps = new PickService();
		
		int result = ps.insertPick(pm, list);
		
		if(result > 0 ) {
			response.sendRedirect("pickmain.pm");
			System.out.println(pm);
			System.out.println(list);
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