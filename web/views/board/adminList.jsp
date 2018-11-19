<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.*" %>
<%@ page import="com.user.model.vo.User" %>
<%
	String type = (String)session.getAttribute("bType");
	ArrayList<Board> boardList = (ArrayList<Board>)session.getAttribute("boardList");
	ArrayList<Board> commonBoardList = (ArrayList<Board>)session.getAttribute("commonBoardList");
	ArrayList<Board> boardListQ = (ArrayList<Board>)session.getAttribute("boardListQ");
	ArrayList<Board> commonBoardListQ = (ArrayList<Board>)session.getAttribute("commonBoardListQ");

	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전용 QNA 페이지</title>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( (session.getAttribute("user") == null)){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else{ %>
	<% User u = (User)session.getAttribute("user"); %>
	<% if(!u.getUserId().equals("admin")){ %>
		<%@ include file="../common/NotLogin.jsp" %>
	<% }else{ %>
		<%@ include file="common/boardHeader.jsp" %>
		<div class="pm-section col-xs-12 col-md-8">
			<h1>	관리자 전용 QNA 페이지 </h1>
			<br><br>
			<% if( boardListQ.size() != 0){ %>
			
			<h3> 질문  </h3>
				<table id = "boardList" class="table table-striped">
				<thead>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</thead>
				<% for (int i = 0 ; i < boardListQ.size(); i++){ %>
						<tr>
						<input type="hidden" value="<%= boardListQ.get(i).getId() %>">
						<td><%=boardListQ.get(i).getId() %></td>
						<td><a href="/pickme/selectOne.bo?id=<%=boardListQ.get(i).getId()%>"><%=boardListQ.get(i).getTitle() %></a></td>
						<td><%=boardListQ.get(i).getUserNo() %></td>
						<td><%=boardListQ.get(i).getEnrollDate() %></td>
						</tr>
					<% } %>
				<% } %>
				</table>
			<br><br>
			
			<% if( boardList.size() != 0){ %>
			<h3> 신고 </h3>
			<table id = "boardList" class="table table-striped">
				<thead>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</thead>
				<% for (int i = 0 ; i < boardList.size(); i++){ %>
						<tr>
						<input type="hidden" value="<%= boardList.get(i).getId() %>">
						<td><%=boardList.get(i).getId()%></td>
						<td><a href="/pickme/selectOne.bo?id=<%=boardList.get(i).getId()%>"><%=boardList.get(i).getTitle() %></td>
						<td><%=boardList.get(i).getUserNo() %></td>
						<td><%=boardList.get(i).getEnrollDate()%></td>
						</tr>
				<% } %>
			</table>
			<% } %>
	
	
	
		</div>
		<%@ include file="../common/footer.jsp" %>
		
		<script>
			function boardInsert(){
				location.href = "/pickme/InsertView.bo?bType=" + "<%=type%>";
			}
			
			
			$(function(){
				$("#commonBoardList td").mouseenter(function(){
					//$(this).parent().css({"cursor":"pointer"});
				}).click(function(){
					//var id = $(this).parent().find("input").val();
					//location.href="<%=request.getContextPath()%>/selectOne.bo?id=" + id;
				});
			});
			
			$(function(){
				$("#boardList td").mouseenter(function(){
					//$(this).parent().css({"cursor":"pointer"});
				}).click(function(){
					//var id = $(this).parent().find("input").val();
					//location.href="<%=request.getContextPath()%>/selectOne.bo?id=" + id;
				});
			});
		</script>
	<% } %>
<% } %>
</body>
</html>