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

	public ArrayList<User> searchUser(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String sql = prop.getProperty("searchUser");
		
		System.out.println("sql : " + sql);
		System.out.println("search : " + search);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
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

	public ArrayList searchCategoryPick(Connection con, String search) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList searchPick(Connection con, String search) {
		// TODO Auto-generated method stub
		return null;
	}

}
