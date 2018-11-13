package com.pick.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.pick.model.vo.Attachment;
import com.pick.model.vo.PickCategory;
import com.pick.model.vo.PickMe;


import static com.common.JDBCTemplate.*;


public class PickDao {
	
	private Properties prop = null;

	public PickDao() {
		prop = new Properties();
		String filePath = PickDao.class
				.getResource("/config/pick-me.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PickMe> selectList(Connection con) {
		ArrayList<PickMe> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPickMeOne");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<PickMe>();
			
			while(rset.next()){
				PickMe pm = new PickMe();
				
				pm.setId(rset.getInt("id"));
				pm.setSelect_1(rset.getString("select_1"));
				pm.setSelect_2(rset.getString("select_2"));
				pm.setTitle(rset.getString("title"));
				pm.setContent(rset.getString("content"));
				pm.setEdate(rset.getDate("enroll_date"));
				pm.setViewcount(rset.getInt("view_count"));
				pm.setDdate(rset.getDate("due_date"));
				pm.setType(rset.getString("type"));
				pm.setUserno(rset.getInt("userno"));
				pm.setCategory(0);
				
				list.add(pm);
			}
			
			
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int insertPick(Connection con, PickMe pm) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertPick");
		
		try {
			pstmt = con.prepareStatement(sql);		
						
			pstmt.setString(1, pm.getSelect_1());
			pstmt.setString(2, pm.getSelect_2());
			pstmt.setString(3, pm.getTitle());
			pstmt.setString(4, pm.getContent());
			pstmt.setDate(5, pm.getDdate());
			pstmt.setInt(6, pm.getUserno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int selectCurrentBid(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int pid = 0;
		
		String sql = prop.getProperty("selectCurrentBid");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				pid = rset.getInt(1); // "CURRVAL"
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return pid;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAttachment");
		
		try{
			
			for(int i = 0 ; i < list.size(); i++){
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, list.get(i).getBid());
				pstmt.setString(2, list.get(i).getOriginName());
				pstmt.setString(3, list.get(i).getChangeName());
				pstmt.setString(4, list.get(i).getFilePath());
				
				// 첫번째 데이터일 경우 대표 이미지로 level = 0
				// 나머지 데이터는 일반 이미지로 level = 1
				
				int level = 0;
				if(i != 0 ) level = 1;
				
				pstmt.setInt(5, level);
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> selectPickMeMap(Connection con, int pid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		PickMe p = null;
		
		String sql = prop.getProperty("selectPickMeOne");
		
		try {
			pstmt = con.prepareStatement(sql);			
			
			rset = pstmt.executeQuery();
			
		while(rset.next()){
			p.setId(pid);
			p.setTitle(rset.getString("title"));
			p.setContent(rset.getString("content"));
			p.setSelect_1(rset.getString("select_1"));
			p.setSelect_2(rset.getString("select_2"));
						
			System.out.println(p);
		}
		hmap = new HashMap<String, Object>();
		hmap.put("PickMe", p);	
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return hmap;
	}

	public ArrayList<PickCategory> browseCategory(Connection con) {
		ArrayList<PickCategory> pcArr = new ArrayList<PickCategory>();
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM PM_CATEGORY_TB";
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()){
				PickCategory pc = new PickCategory();
				
				pc.setCategoryid(rset.getInt("ID"));
				pc.setCategoryName(rset.getString("Name"));
				
				pcArr.add(pc);
			}
			System.out.println(pcArr);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return pcArr;
	}

	public int insertCategory(Connection con, int boardNum, int categoryNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCategory");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setInt(2, categoryNum);
			result = pstmt.executeUpdate();
			System.out.println("Pcategory DB 입력 완료!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getPickCount(Connection con) {
		int result = 0;
		String sql = prop.getProperty("getCountPick");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(sql);			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}
}
