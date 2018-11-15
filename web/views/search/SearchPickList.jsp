<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pick.model.vo.PickMe" %>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<PickMe> pList = (ArrayList<PickMe>)session.getAttribute("searchList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 검색결과</title>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
		<div class="pm-section col-xs-12 col-md-8">
		
			<h1>픽&카테고리 검색 결과 리스트 창</h1>
			
			<% if(pList.size() != 0){ %>
			<% for(int i = 0 ; i < pList.size(); i++) { %>
				<a href="?pickno?<%=pList.get(i).getId()%>"><strong>픽 제목<%=pList.get(i).getTitle()%></strong> 상세보기</a>
				<hr />
			<% } %>
			<% }else{ %>
				<div class="result-none">
					<h1>검색 결과 없음</h1>
				</div>
			<% } %>
		
		</div>
		
	<%@ include file="../common/footer.jsp" %>
<% } %>
</body>
</html>