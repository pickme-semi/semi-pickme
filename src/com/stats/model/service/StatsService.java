package com.stats.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import static com.common.JDBCTemplate.*;

import com.stats.model.dao.StatsDao;
import com.pick.model.vo.PickResult;

public class StatsService {
	
	private StatsDao sDao = new StatsDao();
	

	public HashMap<Integer,Integer> countAge(PickResult pr) {
		Connection con = getConnection();
		
		HashMap<Integer,Integer> hmap = sDao.countAge(con,pr);
		
		close(con);
		
		return hmap;
	}


}
