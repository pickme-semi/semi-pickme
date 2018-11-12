package com.user.model.service;

import com.user.exception.UserException;
import com.user.model.dao.UserDao;
import com.user.model.vo.User;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;

public class UserService {
	
	private UserDao uDao = new UserDao();

	public int JoinUser(User u) throws UserException {
		Connection con = getConnection();
		
		int result = uDao.joinUser(con, u);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		System.out.println("resulotservier : " + result);
		return result;
	}
	
	public User loginUser(User u) throws UserException {
		Connection con = getConnection();
		
		User result = uDao.loginUser(con, u);
		
		close(con);
		
		if(result == null) throw new UserException("아이디나 비밀번호가 일치하는 회원이 없습니다.");
		
		return result;
		
		
	}
	
	public int idDupCheck(String id) {
		
		Connection con = getConnection();
		
		int result = uDao.idDupCheck(con,id);
		
		close(con);
		
		return result;

	}

	public int emailDupCheck(String email ) {
		
		Connection con = getConnection();
		
		int result = uDao.emailDupCheck(con,email);
		
		close(con);
		
		return result;
	}

	public String idSearch(String username, String email) {

		Connection con = getConnection();
		
		String result = uDao.idSearch(con,username,email);
		
		close(con);
		
		
		return result;
	}

	public String passSearch(String userid, String useremail) {
		
		Connection con = getConnection();

		String result = "";
		
		int check = uDao.passSearch(con, userid, useremail);
		
		if(check == 1){
			for(int i = 0; i<6; i++){
				int rndVal =(int)(Math.random() * 62);
				if(rndVal <10) {
					result += rndVal;
				} else if(rndVal > 35){
					result += (char)(rndVal + 61);
				} else{
					result += (char)(rndVal +55);
				}
			}
		}else{
			result = "fail";
		}
		
		close(con);
		
		return result;
	}

	public int updatePass(String id, String pass) throws UserException{
		Connection con = getConnection();
		
		int result = uDao.updatePass(con,id,pass);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
	
	

}
