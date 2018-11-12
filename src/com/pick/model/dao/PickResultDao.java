package com.pick.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.common.JDBCTemplate.*;
import com.pick.model.vo.PickResult;

public class PickResultDao {

	private Properties prop = new Properties();
	
	public PickResultDao(){
		String filePath = PickResultDao.class
				.getResource("/config/pick-me.properties")
				.getPath();
		
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int getCurrentPick(Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updatePick(Connection con, PickResult pr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updatePick");
		
		
		try {
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, pr.getId());
			pstmt.setInt(2, pr.getUserno());
			pstmt.setInt(3, pr.getResult());
			pstmt.setDate(4, pr.getDdate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{ 
			close(pstmt);
		}
		return result;
		
		/*
		 PICK_ID
		USER_NO
		RESULT
		ENROLL_DATE
		 
		 
		 */
		
		
	}

}
