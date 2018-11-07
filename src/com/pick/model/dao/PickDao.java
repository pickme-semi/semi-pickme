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
import java.util.Properties;

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
		
		String sql = prop.getProperty("");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<PickMe>();
			
			while(rset.next()){
				PickMe pm = new PickMe();
				
				pm.setId(rset.getInt("id"));				
				
			}
			
			
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
			
			pstmt.setString(1, pm.getTitle());
			pstmt.setString(2, pm.getSelect_1());
			pstmt.setString(3, pm.getSelect_2());
			pstmt.setString(4, pm.getContent());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

}
