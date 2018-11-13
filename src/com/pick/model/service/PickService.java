package com.pick.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.pick.model.dao.PickDao;
import com.pick.model.vo.Attachment;
import com.pick.model.vo.PickCategory;
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

	public int insertPick(PickMe pm/*, ArrayList<Attachment> list*/) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = pDao.insertPick(con, pm);
		if(result > 0) commit(con);
		else rollback(con);
		//int pid = pDao.selectCurrentBid(con);			
			/*for(int i = 0; i < list.size(); i++){
				list.get(i).setBid(bid);
			}*/									
		/*int result2 = pDao.insertAttachment(con, list);		
		if( result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;		
		} else rollback(con);*/	
		// 죽은 코드, 지워도 상관없을듯.
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> selectPickMeMap(int pid) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		hmap = pDao.selectPickMeMap(con, pid);
		
		return hmap;
	}

	public ArrayList<PickCategory> browseCategory() {
		Connection con = getConnection();

		ArrayList<PickCategory> pcArr = pDao.browseCategory(con);
		
		close(con);
		
		return pcArr;
	}

	public void insertPCategory(int boardNum, int cateId) {
		Connection con = getConnection();
	
		int result = pDao.insertCategory(con, boardNum, cateId);
		
		if(result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
	}	
	
	public int getPickCount()
	{
		Connection con = getConnection();
		
		int result = pDao.getPickCount(con);
		
		if(result > 0 ) 
				commit(con);
		else 
				rollback(con);
		
		close(con);
		
		return result;
	}

	
	
}
