package com.pick.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.pick.model.dao.PickDao;
import com.pick.model.vo.PickMe;

import static com.common.JDBCTemplate.*;

public class PickService {
	
	private  PickDao pDao = new PickDao();

	public ArrayList<PickMe> selectList() {
		
		ArrayList<PickMe> list = null;
		Connection con = getConnection();
		
		list = pDao.selectList(con);
		
		close(con);
		
		return list;
	}

	public int insertNotice(PickMe pm) {
		int result = 0;
		
		Connection con = getConnection();
		
		result = pDao.insertPick(con, pm);
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
