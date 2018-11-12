package com.pick.model.service;
import static com.common.JDBCTemplate.*;

import java.sql.Connection;

import com.pick.model.dao.PickResultDao;
import com.pick.model.vo.PickResult;
public class PickResultService {

		private PickResultDao prDao = new PickResultDao();
		
		
		// 현재 픽의 정보 받아오기
		public int getCurrentPick()
		{
			Connection con = getConnection();
			
			int currentPick = prDao.getCurrentPick(con);
			
			close(con);
			
			return currentPick;
		}
		
		// 선택시 픽의 정보 전달하기 
		
		public int updatePick(PickResult pr){
			Connection con = getConnection();
			
			int result = prDao.updatePick(con,pr);
			
			if(result > 0) commit(con);
			else rollback(con);
			
			close(con);
			
			return result;
		}
}
