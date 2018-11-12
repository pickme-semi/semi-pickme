<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<% for(int i = 1 ; i < 10; i++){ %>
			<a href="?userno=<%=i%>">유저번호 <%= i %></a>
			<hr />
		<% } %>
	</div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>