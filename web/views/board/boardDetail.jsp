<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.Board" %>
<%
	String type = (String)session.getAttribute("bType");
	Board b = (Board)request.getAttribute("board");
	Board br = (Board)request.getAttribute("boredRe");
	
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
		
		<table>


				<tr>
					<td>문의 유형</td>
					<td><span><%= b.getCategoryId() %></span></td>
					<td>문의 제목</td>
					<td><span><%= b.getTitle() %></span></td>								
					<td>작성일</td>
					<td><span><%= b.getEnrollDate() %></span>
				</tr>
														
									
				<tr> 
					<td colspan="2" class="answer" >
					<div class="inner"><br><br>
												
					<p id="content"><%= b.getContent() %></p>
					
					
									
					</div>
					</td>
				</tr>
						
										
				</tbody>
			</table>
			
			<% if(br.getContent() != null){ %>
			<table>
				<hr><br><br>
				<h5>답변</h5>
				
				<tr>							
					<td>작성일</td>
					<td><span><%= br.getEnrollDate() %></span>
					<td>담당자</td>
					<td><span><%= br.getUserNo() %></span>
				</tr>
														
									
				<tr> 
					<td colspan="2" class="answer" >
					<div class="inner"><br><br>
												
					<p id="content"><%= br.getContent() %></p>
									
					</div>
					</td>
				</tr>		
			
			</table>
			<%} %>
			
			
			
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