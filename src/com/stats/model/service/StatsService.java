package com.stats.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.common.JDBCTemplate.*;

import com.stats.model.dao.StatsDao;
import com.pick.model.vo.PickResult;

public class StatsService {
	
	private StatsDao sDao = new StatsDao();
	

	public ArrayList<Integer> countAge(PickResult pr) {
		Connection con = getConnection();
		
		ArrayList<Integer> list = sDao.countAge(con,pr);
		
		close(con);
		
		return list;
	}


}
