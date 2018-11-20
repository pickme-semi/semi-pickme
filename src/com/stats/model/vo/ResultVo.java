package com.stats.model.vo;

import java.sql.Date;

public class ResultVo {
	private Date date;
	private int result;
	private String category;
	private int catCount;
	
	
	public ResultVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ResultVo(Date date, int result) {
		super();
		this.date = date;
		this.result = result;
	}
	
	public ResultVo(String category, int catCount){
		super();
		this.category = category;
		this.catCount = catCount;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getCatCount() {
		return catCount;
	}


	public void setCatCount(int catCount) {
		this.catCount = catCount;
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
		return "ResultVo [date=" + date + ", result=" + result + ", category=" + category + ", catCount=" + catCount
				+ "]";
	}


	
	
	
}
