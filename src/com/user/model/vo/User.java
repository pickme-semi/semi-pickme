package com.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int userNo;
	private String userId;
	private String userPass;
	private String userEmail;
	private String userName;
	private Date birthdate;
	private String gender;
	private String type;
	private String profile;
	private String comment;
	
	
	public User() {
		super();
	}

	
	public User(String userId, String userPass) {
		super();
		this.userId = userId;
		this.userPass = userPass;
	}


	public User(int userNo, String profile) {
		super();
		this.userNo = userNo;
		this.profile = profile;
	}



	public User( String userId, String userPass, String userEmail, String userName) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userEmail = userEmail;
		this.userName = userName;
	}



	public User(int userNo, String userId, String userPass, String userEmail, String userName, Date birthdate,
			String gender, String type) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPass = userPass;
		this.userEmail = userEmail;
		this.userName = userName;
		this.birthdate = birthdate;
		this.gender = gender;
		this.type = type;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPass() {
		return userPass;
	}



	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public Date getBirthdate() {
		return birthdate;
	}



	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}


	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}

	

	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPass=" + userPass + ", userEmail=" + userEmail
				+ ", userName=" + userName + ", birthdate=" + birthdate + ", gender=" + gender + ", type=" + type
				+ ", profile=" + profile + ", comment=" + comment + "]";
	}


	



	
	
	
	
	
	

	
}
