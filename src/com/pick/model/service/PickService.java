package com.pick.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.pick.model.dao.PickDao;
import com.pick.model.vo.Attachment;
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

	public int insertPick(PickMe pm, ArrayList<Attachment> list) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		int result1 = pDao.insertPick(con, pm);
		if(result1 > 0){
			int bid = pDao.selectCurrentBid(con);
			
			for(int i = 0; i < list.size(); i++){
				list.get(i).setBid(bid);
			}
			result = 1;			
		}
		
		/*int result2 = pDao.insertAttachment(con, list);
		
		if( result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
			
		} else rollback(con);*/
		
		
		close(con);
		
		return result;
	}

	
}
