package com.profile.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.profile.model.dao.ProfileDao;
import com.user.model.vo.User;
import static com.common.JDBCTemplate.*;

public class ProfileService {
	
	private ProfileDao pDao = new ProfileDao();
	
	public ArrayList<User> followerList(){
		Connection con = getConnection();
		
		ArrayList<User> list = pDao.followerList(con);
		
		
		close(con);
		
		return list;
		
	}

	public ArrayList<User> followingList() {
		Connection con = getConnection();
		
		ArrayList<User> list = pDao.followingList(con);
		
		close(con);
		
		return list;
	}

	public int followerCount() {
		Connection con = getConnection();
		
		// 팔로워 수 
		int result = pDao.followerCount(con);
		
		close(con);
		
		return result;
	}

	public int followingCount() {
		
		Connection con = getConnection();
		
		// 팔로워 수 
		int result = pDao.followingCount(con);
		
		close(con);
		
		return result;
	};
	
	
	

}
