package test;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;

public class TestService {
	private TestDao tDao = new TestDao();
	
	public int testInsert() {
		Connection con = getConnection();
		
		int result = tDao.testInsert(con);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
}
