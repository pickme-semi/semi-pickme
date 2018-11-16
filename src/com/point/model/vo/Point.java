package com.point.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Point implements Serializable {
	
	private int id; 			// 포인트 히스토리 구분 ID
	private int userId; 		// 사용 유저 번호
	private Date pointDate; 	// 사용or획득 일시
	private int beforePoint;	// 사용or획득전 포인트
	private int point; 			// 사용or획득 포인트
	private int afterPoint; 	// 사용or획득 후 포인트
	private int pointContentId; // 사용or획득 내역 
	private String status;      // 사용or획득 구분
	
	public Point() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Point(int id, int userId, Date pointDate, int beforePoint, int point, int afterPoint, int pointContentId,
			String status) {
		super();
		this.id = id;
		this.userId = userId;
		this.pointDate = pointDate;
		this.beforePoint = beforePoint;
		this.point = point;
		this.afterPoint = afterPoint;
		this.pointContentId = pointContentId;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	public int getBeforePoint() {
		return beforePoint;
	}

	public void setBeforePoint(int beforePoint) {
		this.beforePoint = beforePoint;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getAfterPoint() {
		return afterPoint;
	}

	public void setAfterPoint(int afterPoint) {
		this.afterPoint = afterPoint;
	}

	public int getPointContentId() {
		return pointContentId;
	}

	public void setPointContentId(int pointContentId) {
		this.pointContentId = pointContentId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Point [id=" + id + ", userId=" + userId + ", pointDate=" + pointDate + ", beforePoint=" + beforePoint
				+ ", point=" + point + ", afterPoint=" + afterPoint + ", pointContentId=" + pointContentId + ", status="
				+ status + "]";
	}
	
	
	
	
	
	

}
