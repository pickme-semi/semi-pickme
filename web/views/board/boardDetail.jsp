<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.Board" %>
<%@ page import="com.board.model.vo.BoardAnswer" %>
<%
	String type = (String)session.getAttribute("bType");
	Board b = (Board)request.getAttribute("board");
	BoardAnswer ba = ((BoardAnswer)request.getAttribute("answer") != null)? (BoardAnswer)request.getAttribute("answer") : null;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 하는 질문 </title>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( (session.getAttribute("user") == null)){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else{ %>
	<%@ include file="common/boardHeader.jsp" %>
	
	<div class="pm-section col-xs-12 col-md-8">
		
		<table class="table table-bordered">
				<thead class="thead-light">
					<tr>
						<th>문의 유형</th>
						<th><span><%= b.getCategoryId() %></span></th>
						<th>문의 제목</th>
						<th><span><%= b.getTitle() %></span></th>								
					</tr>
					<tr>
						<th>작성자</th>
						<th><span><%= b.getUserNo() %></span></th>								
						<th>작성일</th>
						<th><span><%= b.getEnrollDate() %></span></th>
					</tr>
				</thead>
				<tr> 
					<td colspan="4" class="answer" style="height:300px">
						<div class="inner">
							<p id="content"><%= b.getContent() %></p>
						</div>
					</td>
				</tr>
			<% if(ba != null){ %>
				<tr>
					<td colspan="4" align="center">답변</td>
				</tr>
				<tr>							
					<td>작성일</td>
					<td><span><%= ba.getEnrollDate() %></span>
					<td>담당자</td>
					<td><span><%= ba.getUserNo() %></span>
				</tr>
				<tr> 
					<td colspan="4" class="answer" >
					<div class="inner"><br><br>
					<p id="content"><%= ba.getContent() %></p>
					</div>
					</td>
				</tr>		
			<% }else{ %>
				<tr>
					<td colspan="4" align="center">등록된 답변이 없습니다.</td>
				</tr>
			<% } %>
			</tbody>
			</table>
			
		<div align="center">
			
			<% if(type.equals("admin")){ %>
			<button class="btn btn-primary" id="boardReInsert">답변하기</button>
			
			<% }else if(user.getUserNo() == b.getUserNo()){ %>
			<button class="btn btn-primary" id="boardUpdate">수정하기</button>
			
			<%}else{ %>
			<button class="btn btn-primary" onclick="boardInsert();"><%= (type.equals("report"))? "신고" : "질문" %>하기</button>
			<%} %>
			
			<button class="btn btn-primary" onclick="list();">목록으로</button>
			
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function boardInsert(){
			location.href = "/pickme/InsertView.bo?bType=" + "<%=type%>";
		}
		
		function boardUpdate(){
			location.href = "/pickme/UpdateView.bo?id=" + "<%=b.getId()%>";
		}
	
		
		function list(){
			location.href = "/pickme/list.bo?bType=" + "<%=type%>";
		}
		
		$('#boardUpdate').click(function(){
			location.href = "/pickme/bUpView.bo?id=" + "<%=b.getId()%>";
		})
		
		$('#boardReInsert').click(function(){
			location.href = "/pickme/InsertReView.bo?id=" + "<%=b.getId()%>";
		});
		

	</script>
<% }  %>
</body>


</html>