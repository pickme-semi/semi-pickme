package com.stats.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static com.common.JDBCTemplate.*;

import com.pick.model.vo.PickResult;
import com.stats.model.vo.ResultVo;

public class StatsDao {
	
	private Properties prop = new Properties();
	
	public StatsDao(){
		String filePath = StatsDao.class.getResource("/config/stats.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	

	public HashMap<Integer,Integer> countAge(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getAge1");
		
		HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				int age = rset.getInt(1);
				int no = rset.getInt(2);
				hmap.put(age,no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		
		return hmap;
	}



	public HashMap<Integer, Integer> countAge2(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getAge2");
		
		HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				int age = rset.getInt(1);
				int no = rset.getInt(2);
				hmap.put(age,no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		
		return hmap;
	}



	public HashMap<String, Integer> countGender(Connection con, PickResult pr) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getGender");
		
		HashMap<String,Integer> hmap = new HashMap<String,Integer>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				String gender = rset.getString(1);
				int cnt = rset.getInt(2);
				hmap.put(gender, cnt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}



	public HashMap<Integer, Integer> countGender1(Connection con, PickResult pr) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("menPicks");
		
		HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				int result = rset.getInt(1);
				int picks = rset.getInt(2);
				hmap.put(result, picks);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}



	public HashMap<Integer, Integer> countGender2(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("womenPicks");
		
		HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				int result = rset.getInt(1);
				int picks = rset.getInt(2);
				hmap.put(result, picks);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}



	public ArrayList<Integer> countCat(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getCategory");

		ArrayList<Integer> list = new ArrayList<Integer>();
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			pstmt.setInt(2, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				int result = rset.getInt(1);
				list.add(result);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public ArrayList<ResultVo> countDate(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("dayCount");

		ArrayList<ResultVo> list = new ArrayList<ResultVo>();
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				ResultVo rv = new ResultVo();
				Date day = rset.getDate(1);
				int cnt = rset.getInt(2);
				rv.setDate(day);
				rv.setResult(cnt);
				list.add(rv);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public ArrayList<ResultVo> countPick1Date(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("dayPick1Count");

		ArrayList<ResultVo> list = new ArrayList<ResultVo>();
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				ResultVo rv = new ResultVo();
				Date day = rset.getDate(1);
				int cnt = rset.getInt(2);
				rv.setDate(day);
				rv.setResult(cnt);
				list.add(rv);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public ArrayList<ResultVo> countPick2Date(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("dayPick2Count");

		ArrayList<ResultVo> list = new ArrayList<ResultVo>();
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				ResultVo rv = new ResultVo();
				Date day = rset.getDate(1);
				int cnt = rset.getInt(2);
				rv.setDate(day);
				rv.setResult(cnt);
				list.add(rv);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public HashMap<Integer, Integer> countTotal(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("totalPick");
		
		HashMap<Integer,Integer> hmap = new HashMap<Integer,Integer>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				int result = rset.getInt(1);
				int cnt = rset.getInt(2);
				hmap.put(result, cnt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}



	public ArrayList<ResultVo> cat5Count(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("cat5Count");

		ArrayList<ResultVo> list = new ArrayList<ResultVo>();
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				ResultVo rv = new ResultVo();
				String category = rset.getString(1);
				int catCount = rset.getInt(2);
				rv.setCategory(category);
				rv.setCatCount(catCount);
				list.add(rv);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}


/*
	public ArrayList<ResultVo> cat5Pick1Count(Connection con, PickResult pr, ArrayList<ResultVo> list2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("cat5Pick1Count");

		ArrayList<ResultVo> list = new ArrayList<ResultVo>();
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			pstmt.setString(2, list2.get(0).getCategory());
			pstmt.setString(3, list2.get(1).getCategory());
			pstmt.setString(4, list2.get(2).getCategory());
			pstmt.setString(5, list2.get(3).getCategory());
			pstmt.setString(6, list2.get(4).getCategory());
			for(int i = 0; i<5; i++){
				System.out.println(list2.get(i).getCategory());
			}
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				ResultVo rv = new ResultVo();
				String category = rset.getString(1);
				int catCount = rset.getInt(2);
				rv.setCategory(category);
				rv.setCatCount(catCount);
				list.add(rv);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public ArrayList<ResultVo> cat5Pick2Count(Connection con, PickResult pr, ArrayList<ResultVo> cat5List) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("cat5Pick2Count");

		ArrayList<ResultVo> list = new ArrayList<ResultVo>();
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr.getId());
			pstmt.setString(2, cat5List.get(0).getCategory());
			pstmt.setString(3, cat5List.get(1).getCategory());
			pstmt.setString(4, cat5List.get(2).getCategory());
			pstmt.setString(5, cat5List.get(3).getCategory());
			pstmt.setString(6, cat5List.get(4).getCategory());
			for(int i = 0; i<5; i++){
				System.out.println(cat5List.get(i).getCategory());
			}
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				ResultVo rv = new ResultVo();
				String category = rset.getString(1);
				int catCount = rset.getInt(2);
				rv.setCategory(category);
				rv.setCatCount(catCount);
				list.add(rv);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
*/


	public int resultCheck(Connection con, String pickId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("isResult");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pickId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) result = rset.getInt(1);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}




}
