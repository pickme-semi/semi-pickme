package com.profile.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.profile.model.dao.ProfileDao;
import com.profile.model.vo.Category;
import com.user.model.vo.User;
import static com.common.JDBCTemplate.*;

public class ProfileService {
	
	private ProfileDao pDao = new ProfileDao();
	
	public ArrayList<User> followerList(int userNo){
		Connection con = getConnection();
		
		ArrayList<User> list = pDao.followerList(con, userNo);
		
		
		close(con);
		
		return list;
		
	}

	public ArrayList<User> followingList(int userNo) {
		Connection con = getConnection();
		
		ArrayList<User> list = pDao.followingList(con, userNo);
		
		close(con);
		
		return list;
	}

	public int followerCount(int userNo) {
		Connection con = getConnection();
		
		// 팔로워 수 
		int followerCount = pDao.followerCount(con, userNo);
		
		close(con);
		
		return followerCount;
	}

	public int followingCount(int userNo) {
		
		Connection con = getConnection();
		
		// 팔로워 수 
		int result = pDao.followingCount(con, userNo);
		
		close(con);
		
		return result;
	}

	public	int updateMyPage(User user) {
		Connection con = getConnection();
		
		int result = pDao.updateMyPage(con, user);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int deleteUser(int userNo) {
		Connection con = getConnection();
		
		int result = pDao.deleteUser(con, userNo);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int followDel(int userNo) {
		Connection con = getConnection();
		
		int fResult = pDao.followDel(con, userNo);
		
		if(fResult > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return fResult;
	}

	public ArrayList<Category> browseCategory() {
		Connection con = getConnection();

		ArrayList<Category> cArr = pDao.browseCategory(con);
		
		close(con);
		
		return cArr;
	}

	public void insertCategory(int userNo, String category) {
		Connection con = getConnection();
		
		int result = pDao.insertCategory(con, userNo, category);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
	}

	
	
	

}
