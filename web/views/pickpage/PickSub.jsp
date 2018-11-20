<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pick.model.vo.PickMe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.reply.model.vo.*" %>
<%
	PickMe p = (PickMe) request.getAttribute("PickMe");
	User u = (User) session.getAttribute("user");
	
	ArrayList<PickComment> pclist = (ArrayList<PickComment>)request.getAttribute("clist"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 상세보기 페이지</title>
</head>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">
<script src="/pickme/resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>


<style>
#pick1 {
	/*픽 이미지 1 크기 조절 */
	max-width: 100%;
	width: 230px;
	height : 230px;
	max-height : 100%;
}

#pick2 {
	/*픽 이미지 2 크기 조절 */
	max-width: 100%;
	width: 230px;
	height : 230px;
	max-height : 100%;	
}

#profile {
	height: 80px;
	position: relative;
	width: 80px;
	max-width: 100%;
	max-height : 100%;	
}

textarea {
	height: auto;
	overflow: visible;
}

div {
 width: 100%;
 text-align: center;
}

div.inner {
 width: 100%;
 text-align: center;
}

.replyArea textArea {
	border-radius: 10px;
	resize: none;
}



</style>

<body>
	<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
	<%
		if (session.getAttribute("user") == null) {
	%>
	<%@ include file="../common/NotLogin.jsp"%>
	<%
		} else { 
	%>
	<%@ include file="../common/header.jsp"%>


	
	<div class="container-fluid col-md-8 col-xs-12" align="center">
		<h1><%=p.getTitle()%></h1>
		<br><br>
		<div class="container col-md-8 col-xs-12" align="center">
			<div class="outer" align="center">
				<div class="inner" align="center">
					<div class="">
						<img alt="pick1" id="pick1" onerror="imgError(this);" 
							src="<%=request.getContextPath()%>/resources/PickUploadFiles/<%=p.getSelect_1()%>" />
						<img alt="pick2" id="pick2" onerror="imgError(this);" 
							src="<%=request.getContextPath()%>/resources/PickUploadFiles/<%=p.getSelect_2()%>" />
					</div>					
				</div>
				<br><br>
			<div class="row userprofile">				
				<div class="col-md-3" >
					<% if(p.getProfile() != null) {%>
		 		   <img src="/pickme/resources/profileImage/<%= p.getProfile() %>" alt="Me" 
				    class="" id="profile">
					<% } else{ %>
					<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" 
					class="" id="profile">
					<% }%>					
				</div>
				<div class="col-md-2">
					<br>				
					<h3><%=p.getUserId()%></h3>
				</div>
				<div class="col-md-4"></div>						
				<div class="col-md-3" style:align="right">
				<br>
					<button>팔로우 </button>
				</div>
			</div>			
								
				<br><br>
				
				<div class="content">
					<div class="">					
						<p><%=p.getContent()%></p>
					</div>
				</div>
				
				<br><br><br><br>
				
				<div class="replyArea">
					<div class="replyWriteArea">
						<form role="form" class="form-inline" action="/pickme/reply.pm">
						<input type="hidden" name="writer" value="<%= u.getUserNo()%>"/>
						<input type="hidden" name="writerid" value="<%= u.getUserId() %>"/>
						<input type="hidden" name="Pid" value="<%=p.getId() %>" />
						<input type="hidden" name="refcno" value="0" />
						<input type="hidden" name="clevel" value="1" />
							<table style="width: 100%; height: 100%;">
								<tr>									
									<td><textArea rows="2" cols="50" id="replyContent" name="replyContent"></textArea></td>									
									<td><button type="submit" id="addReply">댓글 등록</button></td>										
								</tr>								
							</table>		
						</form>
					</div>
					
				<div id="replySelectArea">
	     		 <% if( pclist != null ) { %>
			      	<% for(PickComment pc : pclist) { %>
			      	<table id="replySelectTable"
			      	 style="margin-left : <%= (pc.getClevel()-1) * 35 %>px;
	    		  	 		width : <%= 400 - ((pc.getClevel()-1) * 15)%>px;"
	      			 class="replyList<%=pc.getClevel()%>">
		  				<tr>
		 		 			<td rowspan="2"> </td>
							<td><b><%=pc.getName()%></b></td>
							<td><%= pc.getEdate() %></td>
							<td align="center">
							<%if(u.getUserNo() == pc.getUserno()) { %>
								<input type="hidden" name="cno" value="<%=pc.getCid()%>"/>
									  
								<button type="button" class="updateBtn" 
									onclick="updateReply(this);">수정하기</button>
							
								<button type="button" class="updateConfirm"
									onclick="updateConfirm(this);"
									style="display:none;" >수정완료</button> &nbsp;&nbsp;
							
								<button type="button" class="deleteBtn"
									onclick="deleteReply(this);">삭제하기</button>
							
							<% } else if( pc.getClevel() < 3) { %>
								<input type="hidden" name="writer" value="<%=u.getUserNo()%>"/>
								<input type="hidden" name="refcno" value="<%= pc.getCid()%>" />
								<input type="hidden" name="clevel" value="<%=pc.getClevel() %>" />
								<button type="button" class="insertBtn" 
									  onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp; 
							 
								<button type="button" class="insertConfirm"
									onclick="reConfirm(this);"
									style="display:none;" >댓글 추가 완료</button> 
							
							<% } else {%>
								<span> 마지막 레벨입니다.</span>
							<% } %>
							</td>
						</tr>
						<tr class="comment replyList<%=pc.getClevel()%>">
							<td colspan="3" style="background : transparent;">
							<textarea class="reply-content" cols="75" rows="3"
							 readonly="readonly"><%= pc.getCcontent() %></textarea>
							</td>
						</tr>
					</table>
			  		<% } } %>
				</div>					
				</div>
			</div>
		</div>
		
		<br><br>
		
	</div>
	
	<script>
		function updateReply(obj) {
			// 현재 위치와 가장 근접한 textarea 접근하기
			$(obj).parent().parent().next().find('textarea')
			.removeAttr('readonly');
			
			
			// 수정 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.updateConfirm').css('display','inline');
			
			// 수정하기 버튼 숨기기
			$(obj).css('display', 'none');
		}
		
		function updateConfirm(obj) {
			// 댓글의 내용 가져오기
			var content
			  = $(obj).parent().parent().next().find('textarea').val();
			
			// 댓글의 번호 가져오기
			var cno = $(obj).siblings('input').val();
			
			// 게시글 번호 가져오기
			var pid = '<%= p.getId() %>';
			
			location.href="/pickme/updateComment.pm?"
					 +"cno="+cno+"&Pid="+pid+"&content="+content;
		}
		
		function deleteReply(obj){
			// 댓글의 번호 가져오기
			var cno = $(obj).siblings('input').val();
			
			// 게시글 번호 가져오기
			var pid = '<%= p.getId() %>';
			
			location.href="/pickme/deleteComment.pm"
			+"?cno="+cno+"&Pid="+pid;
		}
		
		function reComment(obj){
			// 추가 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.insertConfirm').css('display','inline');
			
			// 클릭한 버튼 숨기기
			$(obj).css('display', 'none');
			
			// 내용 입력 공간 만들기
			var htmlForm = 
				'<tr class="comment"><td></td>'
					+'<td colspan="3" style="background : transparent;">'
						+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
					+ '</td>'
				+ '</tr>';
			
			$(obj).parents('table').append(htmlForm);
			
		}
		
		function reConfirm(obj) {
			// 댓글의 내용 가져오기
			
			// 참조할 댓글의 번호 가져오기
			var refcno = $(obj).siblings('input[name="refcno"]').val();
			var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
			
			// console.log(refcno + " : " + level);
			
			// 게시글 번호 가져오기
			var pid = '<%=p.getId()%>';
			
			var parent = $(obj).parent();
			var grandparent = parent.parent();
			var siblingsTR = grandparent.siblings().last();
			
			var content = siblingsTR.find('textarea').val();
			
			// console.log(parent.html());
			// console.log(grandparent.html());
			// console.log(siblingsTR.html());
			
			// console.log(content);

			// writer, replyContent
			// pid, refcno, clevel
			
			location.href='/pickme/reply.pm'
			           + '?writer=<%= u.getUserNo() %>' 
			           + '&replyContent=' + content
			           + '&Pid=' + pid
			           + '&refcno=' + refcno
			           + '&clevel=' + level;
		}
	</script>
	

	<%@ include file="../common/footer.jsp"%>
	<%
		}
	%>
</body>
</html>