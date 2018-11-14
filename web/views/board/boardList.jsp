<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.Board" %>
<%
	String type = (String)session.getAttribute("bType");
	ArrayList<Board> boardList = (ArrayList<Board>)session.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= (type.equals("report"))? "신고" : "질문" %>게시판</title>
</head>
<body>
	<%@ include file="common/boardHeader.jsp" %>
	<div class="pm-section col-xs-12 col-md-8">
		<h1><%= (type.equals("report"))? "신고" : "질문" %> 게시판</h1>
		
		<% if( boardList != null){ %>
			<h1>리스트 있음</h1>
		<% }else{ %>
			<h1>리스트 없음</h1>
		<% } %>
		<button onclick="boardInsert();"><%= (type.equals("report"))? "신고" : "질문" %>하기</button>
	</div>
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function boardInsert(){
			location.href = "/pickme/InsertView.bo?bType=" + "<%=type%>";
		}
	</script>
</body>
</html>