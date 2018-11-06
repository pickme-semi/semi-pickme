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
		
		return result;
	}
	
	public User loginUser(User u) throws UserException {
		Connection con = getConnection();
		
		User result = uDao.loginUser(con, u);
		
		close(con);
		
		if(result == null) throw new UserException("아이디나 비밀번호가 일치하는 회원이 없습니다.");
		
		return result;
		
		
	}

}
