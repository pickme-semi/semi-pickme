package com.point.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.board.model.dao.BoardDao;
import com.point.model.vo.Point;

import static com.common.JDBCTemplate.*;

public class PointDao {
	
	private Properties prop = new Properties();
	
	public PointDao(){
		String filePath = BoardDao.class
				.getResource("/config/point-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int addPoint(Connection con, Point p) {
		System.out.println("addpoint : " + p);
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("addpoint");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p.getUserId());
			pstmt.setInt(2, p.getBeforePoint());
			pstmt.setInt(3, p.getPoint());
			pstmt.setInt(4, p.getPoint()+p.getBeforePoint());
			pstmt.setInt(5, p.getPointContentId());
			pstmt.setString(6, p.getStatus());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Point getCurrentPoint(Connection con, int userId) {
		PreparedStatement pstmt = null;
		Point p = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getCurrentPoint");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			p = new Point();
			if(rset.next()){
				p.setAfterPoint(rset.getInt(1));
			}else{
				p.setPoint(0);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

}
