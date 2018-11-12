<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 검색결과</title>
</head>
<body>

<%@ include file="../common/header.jsp" %>

	<div class="pm-section col-xs-12 col-md-8">
	
		<h1>픽&카테고리 검색 결과 리스트 창</h1>
		
		<% for(int i = 0 ; i < 10; i++) { %>
			<a href="?pickno?<%=i%>"><strong>픽 <%=i%></strong> 상세보기</a>
			<hr />
		<% } %>
	
	</div>
	
<%@ include file="../common/footer.jsp" %>

</body>
</html>