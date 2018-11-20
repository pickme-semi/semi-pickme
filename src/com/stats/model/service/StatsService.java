package com.stats.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import static com.common.JDBCTemplate.*;

import com.stats.model.dao.StatsDao;
import com.stats.model.vo.ResultVo;
import com.pick.model.vo.PickResult;

public class StatsService {
	
	private StatsDao sDao = new StatsDao();
	

	public HashMap<Integer,Integer> countAge(PickResult pr) {
		Connection con = getConnection();
		
		HashMap<Integer,Integer> hmap = sDao.countAge(con,pr);
		
		close(con);
		
		return hmap;
	}


	public HashMap<Integer, Integer> countAge2(PickResult pr) {
		Connection con = getConnection();
		
		HashMap<Integer,Integer> hmap = sDao.countAge2(con, pr);
		
		close(con);
		return hmap;
	}


	public HashMap<String, Integer> countGender(PickResult pr) {
		Connection con = getConnection();
		
		HashMap<String,Integer> hmap = sDao.countGender(con,pr);
		
		close(con);
		
		return hmap;
	}


	public HashMap<Integer, Integer> countGender1(PickResult pr) {
		Connection con = getConnection();
		
		HashMap<Integer,Integer> hmap = sDao.countGender1(con,pr);
		
		close(con);
		
		return hmap;
	}


	public HashMap<Integer, Integer> countGender2(PickResult pr) {
		Connection con = getConnection();
		
		HashMap<Integer,Integer> hmap = sDao.countGender2(con,pr);
		
		close(con);
		
		return hmap;
	}


	public ArrayList<Integer> countCat(PickResult pr) {
		
		Connection con = getConnection();
		
		ArrayList<Integer> list = sDao.countCat(con,pr);
		
		close(con);
		
		return list;
	}


	public ArrayList<ResultVo> countDate(PickResult pr) {

		Connection con = getConnection();
		
		ArrayList<ResultVo> list = sDao.countDate(con,pr);
		
		close(con);
		
		return list;
	}


	public ArrayList<ResultVo> countPick1Date(PickResult pr) {
		Connection con = getConnection();
		
		ArrayList<ResultVo> list = sDao.countPick1Date(con,pr);
		
		close(con);
		
		return list;
	}


	public ArrayList<ResultVo> countPick2Date(PickResult pr) {
		Connection con = getConnection();
		
		ArrayList<ResultVo> list = sDao.countPick2Date(con,pr);
		
		close(con);
		
		return list;
	}


	public HashMap<Integer, Integer> countTotal(PickResult pr) {
		Connection con = getConnection();
		
		HashMap<Integer,Integer> hmap = sDao.countTotal(con,pr);
		
		close(con);
		
		return hmap;
	}


	public ArrayList<ResultVo> cat5Count(PickResult pr) {
		Connection con = getConnection();
		
		ArrayList<ResultVo> list = sDao.cat5Count(con, pr);
		
		close(con);
		
		return list;
	}


	public ArrayList<ResultVo> cat5Pick1Count(PickResult pr, ArrayList<ResultVo> cat5List) {
		Connection con = getConnection();
		
		ArrayList<ResultVo> list = sDao.cat5Pick1Count(con, pr ,cat5List);
		
		close(con);
		
		return list;
	}


	public ArrayList<ResultVo> cat5Pick2Count(PickResult pr, ArrayList<ResultVo> cat5List) {
		Connection con = getConnection();
		
		ArrayList<ResultVo> list = sDao.cat5Pick2Count(con, pr ,cat5List);
		
		close(con);
		
		return list;
	}




}
