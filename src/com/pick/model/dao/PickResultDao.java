package com.pick.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Properties;
import static com.common.JDBCTemplate.*;
import static com.common.JDBCTemplate.close;

import com.pick.model.vo.PickResult;

public class PickResultDao {

   private Properties prop = new Properties();
   
   public PickResultDao(){
      String filePath = PickResultDao.class
            .getResource("/config/pick-me.properties")
            .getPath();
      
      
      try {
         prop.load(new FileReader(filePath));
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   
   public int getCurrentPick(Connection con,  PickResult pr2) {
      PreparedStatement pstmt1 = null;
      PreparedStatement pstmt2 = null;
      ResultSet rset1 = null;
      ResultSet rset2 = null;
      int result1 = 0;
      int result2 = 0;
      int finalResult = 0;
      // 전체 선택된 수 랑 왼쪽인지 오른쪽인지 확인해서 숫자 파악한다.
      String sqlAll = prop.getProperty("returnAllPickResult");
      String sqlSelect = prop.getProperty("returnPickResult");
      
      
      try {
        // System.out.println("실행되니?");
         pstmt1 = con.prepareStatement(sqlAll);
         pstmt2 = con.prepareStatement(sqlSelect);
         //System.out.println("pr.getId() = "+pr2.getId());
         //System.out.println("pr.getResult() = "+pr2.getResult());
         pstmt1.setInt(1, pr2.getId());
         pstmt2.setInt(1, pr2.getId());
         pstmt2.setInt(2, pr2.getResult());
         
         rset1 = pstmt1.executeQuery();
         rset2 = pstmt2.executeQuery();
         
         ResultSetMetaData rsmd=null;
         ResultSetMetaData rsmd2=null;

         rsmd=rset1.getMetaData();
         rsmd2=rset2.getMetaData();

         int rowCnt1 = rsmd.getColumnCount();
         int rowCnt2 = rsmd2.getColumnCount();

         //System.out.println("rowCnt1 = "+rowCnt1);
         //System.out.println("rowCnt2 = "+rowCnt2);

         if(rset1.next()){
            
            result1 = rset1.getInt(1);
            
         }
         if(rset2.next()){
            
            result2 = rset2.getInt(1);
            
         }
         
         
         //System.out.println("result1="+result1);
         //System.out.println("result2="+result2);
         //System.out.println("이것만보자 "+((double)result2/(double)result1)*100);
         finalResult =(int)(((double)result2/(double)result1)*100);
         //System.out.println("과연   "+ finalResult);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      finally{ 
         close(pstmt1);
         close(pstmt2);
         close(rset1);
         close(rset2);
      }
      return finalResult;
   }

   public int updatePick(Connection con, PickResult pr) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String sql = prop.getProperty("updatePick");
      
      
      try {
         pstmt = con.prepareStatement(sql);
      
         pstmt.setInt(1, pr.getId());
         pstmt.setInt(2, pr.getUserno());
         pstmt.setInt(3, pr.getResult());
         pstmt.setDate(4, pr.getDdate());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      finally{ 
         close(pstmt);
      }
      return result;
      
      /*
       PICK_ID
      USER_NO
      RESULT
      ENROLL_DATE
       
       
       */
      
      
   }

}