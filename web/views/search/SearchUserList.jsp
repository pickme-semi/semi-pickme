<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.model.vo.User" %>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<User> uList = (ArrayList<User>)session.getAttribute("searchList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<title>유저 검색결과</title>
<style>

	.attr {
		height : 50px;
		position : relative;
		width : 50px;
			}
			
			
</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
		<div class="pm-section col-xs-12 col-md-8">
		
			<h1>유저 검색 결과 리스트 창</h1>
			
			<br /><br />
		<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col"><i class="fas fa-search"></i></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			<%if(uList.size() != 0){ %>
			<% for(int i = 0 ; i < uList.size(); i++){ %>
			 <tbody>
			    <tr class="table-primary">
			      <th scope="row"><%= i+1 %></th>
			      <% if(uList.get(i).getProfile() != null) {%>
			      <td><img src="/pickme/resources/profileImage/<%=uList.get(i).getProfile() %>" class="rounded-circle attr" /></td>
			      <% } else{ %>
			      <td><img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr"/></td>
			      <% }%>
			      <td><!-- 사용자 정보 페이지로 이동시키기 -->
				<% if(user.getUserNo() != uList.get(i).getUserNo()) { %>
				<a href="/pickme/uPage.pr?uno=<%= uList.get(i).getUserNo()%>"><%= uList.get(i).getUserId()%></a>
				<% } else { %>
				<a href="/pickme/mPicks.pr?uno=<%= user.getUserNo()%>"><%= uList.get(i).getUserId()%></a>
				<% } %></td>
			      <td></td>
			    </tr>
			    <% } %>
			</tbody>
			</table>
			
			<% }else { %>
				<div class="result-none">
					<h1>검색 결과 없음</h1>
				</div>
			<% } %>
		</div>
	
	<%@ include file="../common/footer.jsp" %>
<% } %>

</body>
</html>