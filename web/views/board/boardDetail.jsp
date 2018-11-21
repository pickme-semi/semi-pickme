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

<style>
#sub{background: white;}
.areafont{text-align: center; font-weight:bold;}
#testarea{background: #E9ECEF;}
.btnTest{ background-color: white; border: 1px solid #DEE2E6; border-radius:0px;
			width: 80px; height: 40px; font-size: 14px; font-weight:bold; }


</style>
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
					<tr class="areafont">
					
					<!-- w 733 -->
					
						<th width="100px">문의 유형</th>
						<th id = "sub" width="120px"><span><%= b.getCategoryId() %></span></th>
						<th width="100px">작성자</th>
						<th id = "sub" width="130px"> <span><%= b.getUserNo() %></span></th>
						<th width="100px">작성일</th>
						<th id = "sub" width="150px"><span><%= b.getEnrollDate() %></span></th>							
					</tr>
					<tr class="areafont">
						<th >문의 제목</th>
						<th id = "sub" colspan="5"><span><%= b.getTitle() %></span></th>
					</tr>
				</thead>
				<tr> 
					<td colspan="6" class="answer" style="height:300px; font-weight:bold;">
						<div class="inner">
							<p id="content" style="padding: 10px"><%= b.getContent() %></p>
						</div>
					</td>
				</tr>
		</table>
		
	
			<% if(ba != null){ %>
		<table class="table table-bordered" id="fontColor">
				<tr class="areafont">
					<td colspan="6" align="center">답변</td>
				</tr>
				<tr class="areafont">		
					<td width="100px" id="testarea">담당자</td>
					<td width="300px"><span><%= ba.getUserNo() %></span>
									
					<td width="100px" id="testarea">작성일</td>
					<td ><span><%= ba.getEnrollDate() %></span>

				</tr>
				<tr> 
					<td colspan="6" class="answer" >
					<div class="inner" style="padding: 10px; font-weight:bold;">
					<p id="content"><%= ba.getContent() %></p>
					</div>
					</td>
				</tr>
			</table>		
			<% }else{ %>
			<table class="table table-bordered" style="font-weight:bold;">
				<tr>
					<td colspan="6" align="center">등록된 답변이 없습니다.</td>
				</tr>
			</table>
			<% } %>
			</tbody>
			
			
		<div align="center">
			
			<% if(type.equals("admin")){ %>
			<button class="btnTest" id="boardReInsert">답변하기</button> &nbsp;&nbsp;
			
			<% }else if(user.getUserNo() == b.getUserNo()){ %>
			<button class="btnTest" id="boardUpdate">수정하기</button> &nbsp;&nbsp;
			
			<%}else{ %>
				<% if(type.equals("qna")){ %>
					<button class="btnTest" onclick="boardInsert();">질문하기</button> &nbsp;&nbsp;
				<% } %>
			<%} %>
			
			<button class="btnTest" onclick="list();">목록으로</button> &nbsp;&nbsp;
			
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function boardInsert(){
			location.href = "/pickme/InsertView.bo?bType=qna";
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