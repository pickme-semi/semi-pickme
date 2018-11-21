package com.search.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pick.model.vo.PickMe;
import com.user.model.vo.User;

import static com.common.JDBCTemplate.*;

public class SearchDao {
	
	private Properties prop;
	
	public SearchDao(){
		prop = new Properties();
		String filePath = SearchDao.class
				.getResource("/config/search.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 유저 아이디로 검색
	public ArrayList<User> searchUser(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String sql = prop.getProperty("searchUser");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,"%"+ search + "%");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<User>();
			
			while(rset.next()){
				User u = new User();

				u.setUserNo(rset.getInt(1));
				u.setUserId(rset.getString(2));
				u.setUserPass(rset.getString(3));
				u.setUserEmail(rset.getString(4));
				u.setUserName(rset.getString(5));
				u.setBirthdate(rset.getDate(6));
				u.setGender(rset.getString(7));
				u.setType(rset.getString(8));
				u.setProfile(rset.getString(9));
				
				System.out.println("리스트 : " + u);
				
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 카테고리로 검색 
	// 쿼리 수정하기
	public ArrayList<PickMe> searchCategoryPick(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PickMe> list = null;
		
		String sql = prop.getProperty("searchCategoryPick");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				PickMe pm = new PickMe();
				
				pm.setTitle(rset.getString(1));
				pm.setUserId(rset.getString(2));
				pm.setSelect_1(rset.getString(3));
				pm.setSelect_2(rset.getString(4));
				pm.setUserno(rset.getInt(5));
				
				list.add(pm);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 픽 제목으로 검색
	public ArrayList<PickMe> searchPick(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PickMe> list = null;
		
		String sql = prop.getProperty("searchPick");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				PickMe pm = new PickMe();
				
				pm.setTitle(rset.getString(1));
				pm.setUserId(rset.getString(2));
				pm.setSelect_1(rset.getString(3));
				pm.setSelect_2(rset.getString(4));
				pm.setUserno(rset.getInt(5));
				
				list.add(pm);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
