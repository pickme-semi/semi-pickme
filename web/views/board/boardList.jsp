<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.Board" %>
<%
	String type = (String)session.getAttribute("bType");
	ArrayList<Board> boardList = (ArrayList<Board>)session.getAttribute("boardList");
	ArrayList<Board> commonBoardList = (ArrayList<Board>)session.getAttribute("commonBoardList");
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
		<br />
		
		<!-- 질문일때만 자주하는 질문 보여주기 -->
		<% if(!type.equals("report")){ %>
			<div id="divArea">
			
				<p>자주 하는 질문</p>
				<hr />
				<table id = "commonBoardList">
				<% if( commonBoardList.size() != 0){ %>
					<% for(int i = 0; i < commonBoardList.size(); i++) { %>
						<tr>
						<input type="hidden" value="<%= commonBoardList.get(i).getId() %>">
						<td><%=commonBoardList.get(i).getTitle() %></td><br>
						</tr>
					<% } %>
				<% } %>
				</table>
			</div>
		<% } %>
		<br>
		<hr>
		<br><br>
		<% if( boardList.size() != 0){ %>
			<% for (int i = 0 ; i < boardList.size(); i++){ %>
			<div>
				<table id = "boardList">
				<% if(type.equals("report")){ %>
					<tr>
					<% if(user.getUserId().equals("admin") || (user.getUserNo() == boardList.get(i).getUserNo())){ %>
						<input type="hidden" value="<%= boardList.get(i).getId() %>">
						<td><%=boardList.get(i).getTitle() %></td>
					<% }else{ %>
						<td>관리자와 작성자만 볼 수 있습니다.</td>
					<% } %>
					</tr>
				<% } else { %>
					<tr>
					<input type="hidden" value="<%= boardList.get(i).getId() %>">
					<td><%=boardList.get(i).getTitle() %></td>
					</tr>
				<% } %>
				</table>
			</div>
			
			<hr />
			<% } %>
		<% }else{ %>
			<h1>리스트 없음</h1>
		<% } %>
		<div align="center">
			<button class="btn btn-primary" onclick="boardInsert();"><%= (type.equals("report"))? "신고" : "질문" %>하기</button>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function boardInsert(){
			location.href = "/pickme/InsertView.bo?bType=" + "<%=type%>";
		}
		
		
		$(function(){
			$("#commonBoardList td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			}).click(function(){
				var id = $(this).parent().find("input").val();
				location.href="<%=request.getContextPath()%>/selectOne.bo?id=" + id;
			});
		});
		
		$(function(){
			$("#boardList td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			}).click(function(){
				var id = $(this).parent().find("input").val();
				location.href="<%=request.getContextPath()%>/selectOne.bo?id=" + id;
			});
		});
	</script>
</body>
</html>