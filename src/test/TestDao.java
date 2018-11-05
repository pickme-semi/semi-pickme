package test;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;


import static com.common.JDBCTemplate.*;

public class TestDao {
	
	private Properties prop;

	public TestDao() {
		prop = new Properties();
		String filePath = TestDao.class
				.getResource("/config/test-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int testInsert(Connection con) {
		int result = 0;
		Statement stmt = null;
		
		try {
			stmt = con.createStatement();
			String sql = prop.getProperty("testInsert");
			result = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(con);
		}
		
		return result;
	}

}
