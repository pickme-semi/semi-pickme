<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.model.vo.User" %>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<User> uList = (ArrayList<User>)session.getAttribute("searchList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 검색결과</title>
</head>
<body>

<%@ include file="../common/header.jsp" %>

	<div class="pm-section col-xs-12 col-md-8">
	
		<h1>유저 검색 결과 리스트 창</h1>
		
		<%if(uList.size() != 0){ %>
		<% for(int i = 0 ; i < uList.size(); i++){ %>
			<!-- 사용자 정보 페이지로 이동시키기 -->
			<a href="?userno=<%= uList.get(i).getUserNo()%>"><%= uList.get(i).getUserId()%></a>
			<hr />
		<% } %>
		<% }else { %>
			<div class="result-none">
				<h1>검색 결과 없음</h1>
			</div>
		<% } %>
	</div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>