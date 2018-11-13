package com.search.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.pick.model.vo.PickMe;
import com.search.model.dao.SearchDao;
import com.user.model.vo.User;

import static com.common.JDBCTemplate.*;


public class SearchService {
	
	private SearchDao sDao = new SearchDao();

	// 검색어로 유저 검색
	public ArrayList searchUser(String search) {
		Connection con = getConnection();
		
		ArrayList<User> list = sDao.searchUser(con, search);
		
		close(con);
		
		return list;
	}

	// 카테고리를 검색어로 픽 검색
	public ArrayList<PickMe> searchCategoryPick(String search) {
		Connection con = getConnection();
		
		ArrayList<PickMe> list = sDao.searchCategoryPick(con, search);
		
		close(con);
		
		return list;
		
	}

	// 픽 제목으로 픽 검색
	public ArrayList<PickMe> searchPick(String search) {
		Connection con = getConnection();
		
		ArrayList<PickMe> list = sDao.searchPick(con, search);
		
		close(con);
		
		return list;
		
	}

}
