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
<style>
.btnTest{ background-color: white; border: 1px solid #DEE2E6; border-radius:0px;
			width: 80px; height: 40px; font-size: 14px; font-weight:bold; }
</style>
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
				<table id = "boardList" class="table table-striped" style="text-align:center;  border: 1px solid #E6E6E6; font-weight:bold; ">
				<thead >
					<th width="80px">No.</th>
					<th width="403px">제목</th>
					<th width="120px">작성자</th>
					<th width="120px">등록일</th>
				</thead>
				<% for (int i = 0 ; i < boardListQ.size(); i++){ %>
						<tr style="background-color: #FAFAFA">
						<input type="hidden" value="<%= boardListQ.get(i).getId() %>">
						<td><%=boardListQ.get(i).getId() %></td>
						<td><a href="/pickme/selectOne.bo?id=<%=boardListQ.get(i).getId()%>"><%=boardListQ.get(i).getTitle() %></a></td>
						<td><%=boardListQ.get(i).getUserName() %></td>
						<td><%=boardListQ.get(i).getEnrollDate() %></td>
						</tr>
					<% } %>
				<% } %>
				
						
				</table>
				
				<table >
				<div class="col-md-12" align="center" >
						<nav align="center" >
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link" href="#">previous</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">1</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">4</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">last</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				
				</table>
				
				
			<br><br>
			
			<% if( boardList.size() != 0){ %>
			<h3> 신고 </h3>
			<table id = "boardList" class="table table-striped" style="text-align:center; border: 1px solid #E6E6E6; font-weight:bold;">
				<thead>
					<th width="80px">No.</th>
					<th width="403px">제목</th>
					<th width="120px">작성자</th>
					<th width="120px">등록일</th>
				</thead>
				<% for (int i = 0 ; i < boardList.size(); i++){ %>
						<tr style="background-color: #FAFAFA">
						<input type="hidden" value="<%= boardList.get(i).getId() %>">
						<td><%=boardList.get(i).getId()%></td>
						<td><a href="/pickme/selectOne.bo?id=<%=boardList.get(i).getId()%>"><%=boardList.get(i).getTitle() %></td>
						<td><%=boardList.get(i).getUserName() %></td>
						<td><%=boardList.get(i).getEnrollDate()%></td>
						</tr>
				<% } %>
		
			</table>
			
			<% } %>
			
									<div class="list" align="center">
						<div class="col-md-12" align="center">
							<nav align="center">
								<ul class="pagination">
									<li class="page-item">
										<a class="page-link" href="#">previous</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">1</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">2</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">3</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">4</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">last</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
	
	
	
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