package com.stats.model.vo;

import java.sql.Date;

public class ResultVo {
	private Date date;
	private int result;
	
	
	public ResultVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ResultVo(Date date, int result) {
		super();
		this.date = date;
		this.result = result;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public int getResult() {
		return result;
	}


	public void setResult(int result) {
		this.result = result;
	}


	@Override
	public String toString() {
		return "ResultVo [date=" + date + ", result=" + result + "]";
	}
	
	
	
	
}
