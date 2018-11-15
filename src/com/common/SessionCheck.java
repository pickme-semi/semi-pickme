package com.common;

import javax.servlet.http.HttpServletRequest;

public class SessionCheck {
	// 세션의 유저 체크 클래스
	public static boolean login(HttpServletRequest request){
		if(request.getSession(true).getAttribute("user") == null){
			return false;
		}else{
			return true;
		}
	}
}
