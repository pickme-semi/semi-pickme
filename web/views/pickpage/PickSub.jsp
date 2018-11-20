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

.com-main{
	background : blue;
}

.com-sub{
	background : red;
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
				
				<div class="row comment-total-div" style="border:1px solid green">
					<div>
							<input type="hidden" name="writer" value="<%= u.getUserNo()%>"/>
							<input type="hidden" name="writerid" value="<%= u.getUserId() %>"/>
							<input type="hidden" name="Pid" value="<%=p.getId() %>" />
							<input type="hidden" name="refcno" value="0" />
							<input type="hidden" name="clevel" value="1" />
							<textarea class="form-control" name="replyContent" id="" cols="30" rows="3"></textarea>
							<p class="text-right" style="height:auto"><button type="submit"  onclick="InsertComment()">등록</button></p>
					</div>
					<% if(pclist != null) { %>
						
						<div class="pm-comment-set-div">
						<% for( int i = 0 ; i < pclist.size(); i++){ %>
								
								<% if(pclist.get(i).getClevel() <= 1) { %>
								<div class="pm-comment-div" style="background:lightgreen; border:1px solid red">
									<p class="text-left"><%= pclist.get(i).getName() %> [<%= pclist.get(i).getEdate() %>]</p>
									<p class="text-left"><%= pclist.get(i).getCcontent() %></p>
									<p class="text-left">
										<button onclick="recommentOpen(this, <%=pclist.get(i).getCid()%>);">답글 달기</button>
										<input type="hidden" value="open" />
									</p>
								</div>
								
								<% } else { %>
								<div class="pm-re-comment-div" style="border:1px solid blue;background:gray;">
									<div style="border:1px solid black;">
										<div class="pm-re-comment" style="border:1px solid gold">
											<p class="text-left" style="margin-left:20px;">ㄴ<%= pclist.get(i).getName() %> [<%= pclist.get(i).getEdate() %>]</p>
											<p class="text-left" style="margin-left:20px;">&nbsp;&nbsp;<%= pclist.get(i).getCcontent() %></p>
											<input type="hidden" name="refcno" value="<%= pclist.get(i).getRefcno() %>" />
											<input type="hidden" name="clevel" value="2" />
										</div>
									</div>
								</div>
								<% } %>
							<% }%>
						</div>	
					<% } %>
					
				</div>

			</div>
		</div>
		
		<br><br>
		
	</div>
	

	<%@ include file="../common/footer.jsp"%>
	<%
		}
	%>
		<script>
		$(function(){
			//$("div.pm-re-comment-div").attr("style", "display:");
			console.log("시작");
			
		});
		
		
		function recommentOpen(obj, cid){
			console.log("cid : " + cid);
			$(obj).parent().parent().append('<div class="pm-re-comment-div" style="border:1px solid blue;background:gray;display:;">' + 
					'<div style="border:1px solid black;">' + 
					'<p class="text-left" style="margin-left:20px;"></p>' + 
					'<p class="text-left" style="margin-left:20px;"></p>' + 
				'</div>' + 
				'<textarea class="form-control" name="reCommentContent" id="" cols="30" rows="3"></textarea>' + 
				'<p class="text-right"><button onclick="InsertReComment(this,' +  cid +')">등록</button></p>' + 
			'</div>');				
		}
		
		
		function InsertComment(){
			var writer = $("input[name=writer]").val();
			var writerid = $("input[name=writerid]").val();
			var replyContent = $("textarea[name=replyContent]").val();
			var Pid = $("input[name=Pid]").val();
			var refcno = $("input[name=refcno]").val();
			var clevel = $("input[name=clevel]").val();
			
			console.log("userno : " + writerid);
			
			var d = new Date();

			var month = d.getMonth()+1;
			var day = d.getDate();

			var output = d.getFullYear() + '/' +
			    (month<10 ? '0' : '') + month + '/' +
			    (day<10 ? '0' : '') + day;
			
			console.log("replyContent : " + replyContent);
			
			$.ajax({
				url : "/pickme/reply.pm",
				type : "post",
				data : {"writer" : writer,
						"writerid" : writerid,
						"Pid" : Pid,
						"replyContent" : replyContent,
						"refcno" : refcno,
						"clevel" : clevel
				},success : function(data){
					console.log(data);
					
					if(data > 0){
						$("textarea[name=replyContent]").val("");
						$(".comment-total-div").append('<div class="pm-comment-set-div">' +
								'<div class="pm-comment-div" style="background:lightgreen; border:1px solid red">' + 
								'<p class="text-left">' +  writerid + '[' + output + ']</p>' +
								'<p class="text-left">' +  replyContent + '</p>' +
								'<p class="text-left">' +
									'<button onclick="recommentToggle(this);">답글 열기</button>' + 
									'<input type="hidden" value="close" />' + 
								'</p>' + 
							'</div>' +
							'<div class="pm-re-comment-div" style="border:1px solid blue;background:gray;display:none;">' + 
								'<div style="border:1px solid black;">' + 
									'<p class="text-left" style="margin-left:20px;"></p>' + 
									'<p class="text-left" style="margin-left:20px;"></p>' + 
								'</div>' + 
								'<textarea class="form-control" name="" id="" cols="30" rows="3"></textarea>' + 
								'<p class="text-right"><button>등록</button></p>' + 
							'</div>' +
						'</div>');
					}else{
						alert("댓글 등록 실패");
					}
				},error : function(data){
					console.log("error : " + data);
				}
				
			});
		}
		
		function InsertReComment(obj, refcno){
			var writer = $("input[name=writer]").val();
			var writerid = $("input[name=writerid]").val();
			var replyContent = $("textarea[name=reCommentContent]").val();
			var Pid = $("input[name=Pid]").val();
			var refcno = refcno;
			var clevel = 2;
			
			console.log("userno : " + writerid);
			
			console.log("refcno : " + refcno);
			
			var d = new Date();

			var month = d.getMonth()+1;
			var day = d.getDate();

			var output = d.getFullYear() + '/' +
			    (month<10 ? '0' : '') + month + '/' +
			    (day<10 ? '0' : '') + day;
			
			console.log("replyContent : " + replyContent);
			
			$.ajax({
				url : "/pickme/reply.pm",
				type : "post",
				data : {"writer" : writer,
						"writerid" : writerid,
						"Pid" : Pid,
						"replyContent" : replyContent,
						"refcno" : refcno,
						"clevel" : clevel
				},success : function(data){
					console.log(data);
					
					if(data > 0){
						$("textarea[name=reCommentContent]").val("");
						$(obj).parent().parent().parent("div").siblings(".pm-re-comment-div:last()").append('<div class="pm-re-comment" style="border:1px solid gold">' +
								'<p class="text-left" style="margin-left:20px;">ㄴ' + writer + ' [' + output + ']</p>' +
								'<p class="text-left" style="margin-left:20px;">&nbsp;&nbsp;' + replyContent + '</p>' + 
								'<input type="hidden" name="refcno" value="' +  refcno + '" />' + 
								'<input type="hidden" name="clevel" value="2" />' + 
								'</div>');
						
						
						
						
						
					}else{
						alert("댓글 등록 실패");
					}
				},error : function(data){
					console.log("error : " + data);
				}
				
			});
		}
		
		
		function recommentToggle(obj){
			console.log(obj);
			if($(obj).siblings("input").val() == "close"){
				$(obj).siblings("input").val("open");
				$(obj).parent().parent().parent().siblings("div").children(".pm-re-comment-div").attr("style", "background:gray;display:");
			}else{
				$(obj).siblings("input").val("close");
				$(obj).parent().parent().parent().siblings("div").children(".pm-re-comment-div").attr("style", "background:gray;display:none");				
			}
		}
		
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
</body>
</html>