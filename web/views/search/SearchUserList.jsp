<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.model.vo.User" %>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<User> uList = (ArrayList<User>)session.getAttribute("searchList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
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
	
		<div class="pm-section col-xs-12 col-md-8" style="margin-left:auto;margin-right:auto">
		
			<%if(uList.size() != 0){ %>
		<table class="table table-hover">
			  <thead>
			    <tr>
			      	<th scope="col"><i class="fas fa-search"></i></th>
					<th scope="col" colspan="3" class="text-center">사용자 검색</th>
			    </tr>
			  </thead>
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
			<table class="table table-hover" >
			  <thead>
			    <tr>
			      <th scope="col"><i class="fas fa-search"></i></th>
			      <th scope="col" colspan="3" class="text-center">사용자 검색</th>
			    </tr>
			  </thead>
			  </table>
			  
			  	<div align="center" style="margin-top: 50px; margin-bottom : 500px;"><h5>검색결과가 없습니다.</h5></div>
			<% } %>
		</div>
	
	<%@ include file="../common/footer.jsp" %>
<% } %>

</body>
</html>