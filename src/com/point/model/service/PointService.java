package com.point.model.service;

import com.point.model.dao.PointDao;
import com.point.model.vo.Point;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;

public class PointService {
	
	private PointDao pDao = new PointDao();

	public int addPoint(Point p) {
		Connection con = getConnection();
		
		
		Point cp = pDao.getCurrentPoint(con, p.getUserId());
		
		Point p2 = new Point();
		
		System.out.println("유저의 마지막 포인트 : " + cp);
		System.out.println("증가할 포인트 " + p.getPoint());
		System.out.println("증가하기전 포인트 : " + cp.getAfterPoint());
		System.out.println("증가후 포인트 : " + (p.getPoint() + cp.getAfterPoint()));
		
		p2.setUserId(p.getUserId());
		p2.setBeforePoint(cp.getAfterPoint());
		p2.setPoint(p.getPoint());
		p2.setAfterPoint(cp.getAfterPoint()+p.getPoint());
		p2.setPointContentId(p.getPointContentId());
		p2.setStatus(p.getStatus());
		
		int result = pDao.addPoint(con, p2);
		
		if(result > 0 ) {
			commit(con);
			System.out.println("result : " + result);
		}
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
