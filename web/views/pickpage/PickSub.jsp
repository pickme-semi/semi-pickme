<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pick.model.vo.PickMe"%>
<%@page import="java.util.ArrayList"%>
<%
	PickMe p = (PickMe) request.getAttribute("PickMe");
	User u = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 상세보기 페이지</title>
</head>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">
<script src="/pickme/resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>


<style>
#pick1 {
	/*픽 이미지 1 크기 조절 */
	max-width: 100%;
	width: 250px;
	height : 250px;
	max-height : 100%;
}

#pick2 {
	/*픽 이미지 2 크기 조절 */
	max-width: 100%;
	width: 250px;
	height : 250px;
	max-height : 100%;	
}

#profile {
	height: 80px;
	position: relative;
	width: 80px;
	max-width: 100%;
	max-height : 100%;	
}

textarea {
	height: auto;
	overflow: visible;
}

div {
 width: 100%;
 text-align: center;
}

div.inner {
 width: 100%;
 text-align: center;
}


</style>

<body>
	<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
	<%
		if (session.getAttribute("user") == null) {
	%>
	<%@ include file="../common/NotLogin.jsp"%>
	<%
		} else { 
	%>
	<%@ include file="../common/header.jsp"%>

	<div class="container-fluid col-md-8 col-xs-12" align="center">
		<h1><%=p.getTitle()%></h1>
		<br><br>
		<div class="container col-md-8 col-xs-12" align="center">
			<div class="outer" align="center">
				<div class="inner" align="center">
					<div class="">
						<img alt="pick1" id="pick1" onerror="imgError(this);" 
							src="<%=request.getContextPath()%>/resources/PickUploadFiles/<%=p.getSelect_1()%>" />
						<img alt="pick2" id="pick2" onerror="imgError(this);" 
							src="<%=request.getContextPath()%>/resources/PickUploadFiles/<%=p.getSelect_2()%>" />
					</div>					
				</div>
				<br><br>
			<div class="row userprofile">				
				<div class="col-md-3" >
					<% if(p.getProfile() != null) {%>
		 		   <img src="/pickme/resources/profileImage/<%= p.getProfile() %>" alt="Me" 
				    class="" id="profile">
					<% } else{ %>
					<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" 
					class="" id="profile">
					<% }%>					
				</div>
				<div class="col-md-2">
					<br>				
					<h3><%=p.getUserId()%></h3>
				</div>
				<div class="col-md-4"></div>						
				<div class="col-md-3" style:align="right">
				<br>
					<button>팔로우 </button>
				</div>
			</div>			
								
				<br><br>
				
				<div class="content">
					<div class="">					
						<p><%=p.getContent()%></p>
					</div>
				</div>
				
				<br><br><br><br>
				
				<div class="">
					<div class="replyinsert">
						<form role="form" class="form-inline">
						<input type="hidden" name="writer" value="<%= u.getUserId()%>"/>
						<input type="hidden" name="pid" value="<%=p.getId() %>" />
						<input type="hidden" name="refcno" value="0" />
						<input type="hidden" name="clevel" value="1" />
							<table style="width: 100%; height: 100%;">
								<tr>									
									<td><textArea rows="2" cols="50" id="replyContent" name="replyContent"></textArea></td>
									<td><button type="submit" id="addReply">댓글 등록</button></td>										
								</tr>								
							</table>		
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<br><br>
		
		<div class="" align="center">
		<table align="center" style="width: 75%; height: 100%;">
			<tr class="comment replyList">
				<td colspan="3" style="background: transparent;">
				<textarea class="reply-content" cols="100" rows="2"
						style="width: 80%; height: 80%;" readonly="readonly">댓글1</textarea>
				</td>
			</tr>
		</table>
	</div>		
		
	</div>
	

	<%@ include file="../common/footer.jsp"%>
	<%
		}
	%>
</body>
</html>