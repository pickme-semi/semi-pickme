package com.point.model.service;

import com.point.model.dao.PointDao;
import com.point.model.vo.Point;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;

public class PointService {
	
	private PointDao pDao = new PointDao();

	public int addPoint(Point p) {
		Connection con = getConnection();
		
		
		Point bPoint = pDao.getCurrentPoint(con, p.getUserId());
		
		p.setBeforePoint(bPoint.getPoint());
		int result = pDao.addPoint(con, p);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public Point getCurrentPoint(int userId){
		Connection con = getConnection();
		
		Point p = pDao.getCurrentPoint(con, userId);
		
		return p; 
	}

}
