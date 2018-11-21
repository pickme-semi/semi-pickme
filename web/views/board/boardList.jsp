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

<style>
.btnTest{ background-color: white; border: 1px solid #DEE2E6; border-radius:0px;
			width: 80px; height: 40px; font-size: 14px; font-weight:bold; }
			
#testli{ background-color: white; border-radius:0px; text-align:center;
		 font-size: 14px; font-weight:bold; }

.testa{text-align: center; width: 50px;}
</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( (session.getAttribute("user") == null)){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else{ %>
	<%@ include file="common/boardHeader.jsp" %>
	<div class="pm-section col-xs-12 col-md-8">
		<h1><%= (type.equals("report"))? "신고" : "질문" %> 게시판</h1>
		<br />
		
		<!-- 질문일때만 자주하는 질문 보여주기 -->
		<% if(!type.equals("report")){ %>
			<div id="divArea">
				<p class="h3">자주 하는 질문</p>
				<table id = "commonBoardList" class="table table-striped" style="text-align:center;  border: 1px solid #E6E6E6; font-weight:bold;">
				<% if( commonBoardList.size() != 0){ %>
					<% for(int i = 0; i < commonBoardList.size(); i++) { %>
						<tr class="row" style="background-color: RED">
							<input type="hidden" value="<%= commonBoardList.get(i).getId() %>">
							<td class="col"><%=commonBoardList.get(i).getTitle() %></td>
						</tr>
						
						<tr class="row common-answer" style="background-color: BLUE">
							<input type="hidden" value="<%= commonBoardList.get(i).getId() %>">
							<td class="col"><%=commonBoardList.get(i).getTitle() %></td>
						</tr>
						
						<tr class="row common-answer" style="background-color: BLUE">
							<input type="hidden" value="<%= commonBoardList.get(i).getId() %>">
							<td class="col"><%=commonBoardList.get(i).getTitle() %></td>
						</tr>
					<% } %>
				<% } %>
				</table>
			</div>
		<% } %>
		
		
				<div class="list" align="center" >
					<div class="col-md-12" align="center">
						<nav align="center">
							<ul class="pagination" id="testli">
								<li class="page-item" >
									<a class="testa" href="#">previous</a>
								</li>
								<li class="page-item">
									<a class="testa" href="#">1</a>
								</li>
								<li class="page-item">
									<a class="testa" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="testa" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="testa" href="#">4</a>
								</li>
								<li class="page-item">
									<a class="testa" href="#">last</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
		
		
		
		<br><br>
		<table id = "boardList" class="table table-striped" style="text-align:center;  border: 1px solid #E6E6E6; font-weight:bold;">
			<thead class="thead-light">
				<tr>
					<th width="80px">No.</th>
					<th width="403px">제목</th>
					<th width="120px">작성자</th>
					<th width="120px">작성일</th>
				</tr>				
			</thead>
			<tbody>
		<% if( boardList.size() != 0){ %>
			<% for (int i = 0 ; i < boardList.size(); i++){ %>
					<% if(type.equals("report")){ %>
						<tr style="background-color: #FAFAFA">	
						<% if(user.getUserId().equals("admin") || (user.getUserNo() == boardList.get(i).getUserNo())){ %>
							<input type="hidden" value="<%= boardList.get(i).getId() %>">
							<td ><%=boardList.get(i).getId()%></td>
							<td><a href="/pickme/selectOne.bo?id=<%=boardList.get(i).getId()%>"><%=boardList.get(i).getTitle() %></a></td>
							<td><%=boardList.get(i).getUserNo() %></td>
							<td><%=boardList.get(i).getEnrollDate() %></td>
						<% }else{ %>
							<td colspan="4">관리자와 작성자만 볼 수 있습니다.</td>
						<% } %>
						</tr>
					<% } else { %>
						<tr style="background-color: #FAFAFA">
						<input type="hidden" value="<%= boardList.get(i).getId() %>">
						<td><%=boardList.get(i).getId()%></td>
						<td><a href="/pickme/selectOne.bo?id=<%=boardList.get(i).getId()%>"><%=boardList.get(i).getTitle() %></a></td>
						<td><%=boardList.get(i).getUserNo() %></td>
						<td><%=boardList.get(i).getEnrollDate() %></td>
						</tr>
					<% } %>
			<% } %>
			
		<% }else{ %>
			<h1></h1>
			<tr>
				<td colspan="4" align="center">작성된 글이 없습니다.</td>
			</tr>
		<% } %>
			</tbody>
		</table>
		
		
			<div class="list" align="center">
						<div class="col-md-12" align="center">
						<nav >
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
		
		
		
		<div align="center">
			<% if(!type.equals("report")){ %>
				<button class="btnTest" onclick="boardInsert();">질문하기</button>
			<% } %>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function boardInsert(){
			location.href = "/pickme/InsertView.bo?bType=qna";
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
</body>
</html>