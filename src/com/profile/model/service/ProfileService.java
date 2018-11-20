package com.profile.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.pick.model.vo.PickMe;
import com.pick.model.vo.PickResult;
import com.point.model.vo.Point;
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
		
		int result1 = pDao.deleteCategory(con,userNo); 
		int result2  = pDao.insertCategory(con, userNo, category);
		
		if(result1 > 0  || result2 > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
	}

	public ArrayList<Category> getCategory(int userNo) {
		Connection con = getConnection();
		
		ArrayList<Category> result = pDao.getCategory(con,userNo);
		
		close(con);
		
		return result;
	}

	
	public User userPage(int userNo) {
		Connection con = getConnection();
		
		User user = pDao.userPage(con, userNo);
		
		close(con);
		
		return user;
	}

	public int followInsert(int userNo1, int userNo2) {
		Connection con = getConnection();
		
		int result = pDao.followInsert(con, userNo1, userNo2);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		return result;
	}

	public ArrayList<PickMe> browseMyPick(int userNo) {
		Connection con = getConnection();

		ArrayList<PickMe> myPick = pDao.browseMyPick(con, userNo);
		
		close(con);
		
		return myPick;
	}

	public int categoryDel(int userNo) {
		Connection con = getConnection();
		
		int cResult = pDao.categoryDel(con, userNo);
		
		if(cResult > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return cResult;
	}

	public int followDelete(int userNo1, int userNo2) {
		Connection con = getConnection();
		
		int result = pDao.followDelete(con, userNo1, userNo2);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		return result;
	}

	public int followCheck(int userNo1, int userNo2) {
		Connection con = getConnection();
		
		int result = pDao.followCheck(con, userNo1, userNo2);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		return result;
	}

	public ArrayList<PickMe> browseUserPick(int userNo) {
		
		Connection con = getConnection();

		ArrayList<PickMe> userPick = pDao.browseUserPick(con, userNo);
		
		close(con);
		
		return userPick;
	}

	public int browsePoint(int userNo) {
		Connection con = getConnection();
		
		int pointResult= pDao.browsePoint(con, userNo);
		
		close(con);
		
		return pointResult;
	}

	public int updateMyPage2(User user) {
		Connection con = getConnection();
		
		int result = pDao.updateMyPage2(con, user);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
		
	}

	public int followingCheck(int userNo1, int userNo2) {
		Connection con = getConnection();
		
		int result = pDao.followingCheck(con, userNo1, userNo2);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		return result;
	}

	public int commentUpdate(int uno, String comment) {
		Connection con = getConnection();
		int result = pDao.commentUpdate(con, uno, comment);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public String browseComment(int uno) {
		Connection con = getConnection();
		
		String pointResult= pDao.browseComment(con, uno);
		
		close(con);
		
		return pointResult;
	}
}
