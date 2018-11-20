package com.profile.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.user.model.vo.User;

public class Follow extends User implements Serializable {
	
	private String followingChk;

	public Follow(String followingChk) {
		super();
		this.followingChk = followingChk;
	}

	public Follow() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Follow(int userNo, String userId, String userPass, String userEmail, String userName, Date birthdate,
			String gender, String type) {
		super(userNo, userId, userPass, userEmail, userName, birthdate, gender, type);
		// TODO Auto-generated constructor stub
	}

	public Follow(int userNo, String profile) {
		super(userNo, profile);
		// TODO Auto-generated constructor stub
	}

	public Follow(String userId, String userPass, String userEmail, String userName) {
		super(userId, userPass, userEmail, userName);
		// TODO Auto-generated constructor stub
	}

	public Follow(String userId, String userPass) {
		super(userId, userPass);
		// TODO Auto-generated constructor stub
	}

	public String getFollowingChk() {
		return followingChk;
	}

	public void setFollowingChk(String followingChk) {
		this.followingChk = followingChk;
	}

	@Override
	public String toString() {
		return "Follow [followingChk=" + followingChk + ", getUserNo()=" + getUserNo() + ", getUserId()=" + getUserId()
				+ ", getUserPass()=" + getUserPass() + ", getUserEmail()=" + getUserEmail() + ", getUserName()="
				+ getUserName() + ", getBirthdate()=" + getBirthdate() + ", getGender()=" + getGender() + ", getType()="
				+ getType() + ", getProfile()=" + getProfile() + ", toString()=" + super.toString() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
