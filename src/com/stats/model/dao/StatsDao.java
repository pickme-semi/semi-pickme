package com.stats.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static com.common.JDBCTemplate.*;

import com.pick.model.vo.PickResult;

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
		
		String sql = prop.getProperty("getAge");
		
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

}
