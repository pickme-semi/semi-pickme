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
#profile {
	height: 80px;
	position: relative;
	width: 80px;
	max-width: 100%;
	max-height : 100%;
	margin-left: 20px;		
}

.replyArea {

width:90%;
height:90%;

}

.replyArea textArea {
	border-radius: 10px;
	resize: none;
	width:100%;
	height:100%;	 
	
}

section{
		background : white;
		margin-left: auto;
		margin-right: auto;
	}

body {
  font-family: Arial;  /*글꼴 수정 Arial 고딕체 계열 */
  margin: 0; 
  overflow-x:scroll;
   
}

* {
  box-sizing: border-box;   /* 테두리를 포함한 크기를 지정할 수 있다 */
}

img{
  vertical-align: bottom;   /* 인라인요소의 수직 정렬 */
   width: 100%;
    object-fit: contain;
    
}

.arrow_box {
	position: relative;
	background: #ebfff4;
	border: 4px solid #c7eaff;
	width:90%;
	height:90%;
	
	
}
.arrow_box:after, .arrow_box:before {
	bottom: 100%;
	left: 10%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.arrow_box:after {
	border-color: rgba(235, 255, 244, 0);
	border-bottom-color: #ebfff4;
	border-width: 20px;
	margin-left: -20px;
}
.arrow_box:before {
	border-color: rgba(199, 234, 255, 0);
	border-bottom-color: #c7eaff;
	border-width: 26px;
	margin-left: -26px;
}
.replyarea{
 	margin-left: 80px;
	margin-right : 80px;

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
	
	<div class="container-fluid col-md-12 col-xs-12" align="center">
		<h1><%=p.getTitle()%></h1>
		<button type="button">신고하기</button>
		<br>		
		<br>
		
		<input type="hidden" id="selectUserNo" value="<%= u.getUserNo() %>"/> 
	    <input type="hidden" id="resultPickId" name="Pid"  class="current" value="<%= p.getId() %>"/> 
	    
	    
		<div class="container " >	 
	   <div class="mySlides" style="background-color : blue">          
	        <div class="row" align="center">
		<div class="col-md-6" align="center" style="background-color : aliceblue" >
			<img id="leftPick" onerror="imgError(this);" 
			src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=p.getSelect_1() %>" 
			style="width:100%" onclick="checkNumber(<%=p.getId() %>);"  />
		</div>	
		<div class="col-md-6" align="center" style="background-color : aliceblue"> 
			<img id="rightPick" 
			src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=p.getSelect_2() %>" 
			style="width:100%"onclick="checkNumber(<%=p.getId() %>);"/>
		</div>
		</div> 
	    </div>
	  </div>
	  	 <script>
	 var checkN;
	 function checkNumber(a)
		{
			checkN =a;
			console.log('%d는 숫자 %d는 다음숫자', a, checkN);
		}	
	 	var countLeft = 1;
	 	var countRight =2;
		// img의 id에 pick 있으면 선택하기 
	 $('img[id^="leftPick"]').click(function(){
		 console.log("수정값"+checkN);
		    alert("왼쪽클릭");
		});
	 $('img[id^="leftPick"]').click(function(){
			$.ajax({
				url : "/pickme/pickresult.pr",
				type : "get",
				data : {
					selectUserNo : $('#selectUserNo').val(),
					resultPickId : checkN,
					selectResult : countLeft
					
				}, success : function(data){
					// 선택한후 몇%의 값인지 우선 전달완료
					console.log("데이터 전달 성공!"+data);
					
					// 게시글 내용도 같이 추가해야 함
					// 예시 : $('.caption-container p').text(data.content);
					
				}, error :  function(request, status, error) {
					console.log("실패!!!");
					console.log(request);
					console.log(status);
					console.log(error);
				}, complete : function(){
					console.log("무조건 실행하는 함수");
				}
			});
		});
	 $('img[id^="rightPick"]').click(function(){
		 console.log("수정값"+checkN);
		    alert("오른쪽클릭");
		});
	 $('img[id^="rightPick"]').click(function(){
			$.ajax({
				url : "/pickme/pickresult.pr",
				type : "get",
				data : {
					selectUserNo : $('#selectUserNo').val(),
					resultPickId : checkN,
					selectResult : countRight
					
				}, success : function(data){
					// 선택한후 몇%의 값인지 우선 전달완료
					console.log("데이터 전달 성공!"+data);
					
					// 게시글 내용도 같이 추가해야 함
					// 예시 : $('.caption-container p').text(data.content);
					
				}, error :  function(request, status, error) {
					console.log("실패!!!");
					console.log(request);
					console.log(status);
					console.log(error);
				}, complete : function(){
					console.log("무조건 실행하는 함수");
				}
			});
		});
	 </script>
	  
	  
	  
				<br><br>
			<div class="row userprofile">
			    <div class="col-md-1"></div>				
				<div class="col-md-7" align="left" >
					<% if(p.getProfile() != null) {%>
		 		   <img src="/pickme/resources/profileImage/<%= p.getProfile() %>" alt="Me" 
				    class="" id="profile">
					<% } else{ %>
					<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" 
					class="" id="profile">
					<% }%>				
					&emsp;&emsp;
					<b><%=p.getUserId()%></b>
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<button >팔로우 </button>
				</div>		
				
			</div>			
								
				<br><br>				
				<div class="content arrow_box">								
					<p><%=p.getContent()%></p>					
				</div>
				
				<br><br>
				
	<div class="replyArea">
		<div id="replySelectArea">
    	    <table border="1" bordercolor="lightgray">
    		<!-- 댓글 목록 -->    
   		    <% if( pclist != null ) { %>
		  		<% for(PickComment pc : pclist) { %>
           		<tr>
                <!-- 아이디, 작성날짜 -->
                <td width="150">
                    <div>   
	      			 <% if(pc.getClevel() > 1) {%>                        
                            &nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->
                            <p>ㄴ re </p>
                            <img src="img/reply_icon.gif">
                     <% } %>                    
                       <b><%=pc.getName()%></b><br>
                        <font size="2" color="lightgray"><%= pc.getEdate() %></font>
                    </div>
                </td>
                <!-- 본문내용 -->
                <td width="550">
                    <div class="text_wrapper">
                       <textarea class="reply-content" 
							 readonly="readonly"><%= pc.getCcontent() %></textarea>
                    </div>
                </td>
                <!-- 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;" align="center">
                       <%if(u.getUserNo() == pc.getUserno()) { %>
								<input type="hidden" name="cno" value="<%=pc.getCid()%>"/>
								&nbsp;	  
								<button type="button" class="updateBtn" 
									onclick="updateReply(this);">수정하기</button> 
							
								<button type="button" class="updateConfirm"
									onclick="updateConfirm(this);"
									style="display:none;" >수정완료</button> &nbsp;
																	
								<button type="button" class="deleteBtn"
									onclick="deleteReply(this);">삭제하기</button>
							
							<% } else if( pc.getClevel() < 3) { %>
								<input type="hidden" name="writer" value="<%=u.getUserNo()%>"/>
								<input type="hidden" name="refcno" value="<%= pc.getCid()%>" />
								<input type="hidden" name="clevel" value="<%=pc.getClevel() %>" />
								<button type="button" class="insertBtn" 
									  onclick="reComment(this);">댓글 달기</button> 
							 
								<button type="button" class="insertConfirm"
									onclick="reConfirm(this);"
									style="display:none;" >댓글 추가 완료</button> 
							
							<% } else {%>
								<span> 마지막 레벨입니다.</span>
							<% } %>
                    </div>
                </td>
            </tr>         
       		<% } %>
       
            
            <!-- 로그인 했을 경우만 댓글 작성가능 -->
            <div class="replyWriteArea">
            <tr bgcolor="#F5F5F5">
             <form role="form" class="form-inline" action="/pickme/reply.pm">
             <input type="hidden" name="writer" value="<%= u.getUserNo()%>"/>
			 <input type="hidden" name="writerid" value="<%= u.getUserId() %>"/>
			 <input type="hidden" name="Pid" value="<%=p.getId() %>" />
			 <input type="hidden" name="refcno" value="0" />
			 <input type="hidden" name="clevel" value="1" />
                <!-- 아이디-->
                <td width="150">
                    <div>
                       <b><%= u.getUserId()%></b>
                    </div>
                </td>
                <!-- 본문 작성-->             
                <td width="550">
                    <div>
                        <textarea id="replyContent" name="replyContent"  ></textarea>
                    </div>
                </td>
                <!-- 댓글 등록 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;">
                        <button type="submit" id="addReply">댓글 등록</button>    
                    </div>
                </td>
            </form>
            </tr>    
        </table>
        </div>
    </div>
    <% } %>			
	</div>
		
		<br><br>
		
	
	
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
						+ '<textarea class="reply-content" style="background : ivory;" cols="75" rows="3"></textarea>'
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