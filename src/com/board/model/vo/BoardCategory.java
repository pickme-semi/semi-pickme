package com.board.model.vo;

import java.io.Serializable;

/**
 * @author user1
 *
 */
public class BoardCategory implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3934937925287432668L;
	
	private int id;
	private String conetent;
	private String type;
	
	public BoardCategory(){
		
	}

	public BoardCategory(int id, String conetent, String type) {
		super();
		this.id = id;
		this.conetent = conetent;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConetent() {
		return conetent;
	}

	public void setConetent(String conetent) {
		this.conetent = conetent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "BoardCategory [id=" + id + ", conetent=" + conetent + ", type=" + type + "]";
	}
	
}
