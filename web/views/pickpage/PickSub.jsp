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
#profile { /* 프로필 사진 크기 고정. */
	height: 80px;
	position: relative;
	width: 80px;
	max-width: 100%;
	max-height : 100%;		
}

.icon{
	height: 32px;
	position: relative;
	width: 32px;
	max-width: 100%;
	max-height : 100%;
}

.userprofile{
width:95%;
height:95%;
}

.replyArea {

width:100%;
height:100%;
border:3px solid #F8E5D0;
}

.replyArea textArea {
	border-radius: 5px;
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
#leftPick {
	height: 250px;
	position: relative;
	width: 250px;
	max-width: 100%;
	max-height : 100%;
	border: 3px solid lightskyblue;
}
#rightPick {
	height: 250px;
	position: relative;
	width: 250px;
	max-width: 100%;
	max-height : 100%;
	border: 3px solid lightskyblue;
}

/* pick 게시글 내용 말풍선 스타일. */
.arrow_box {
	position: relative;
	background: #ebfff4;
	border: 3px solid #c7eaff;
	border-radius: 10px;
	width:100%;
	height:100%;		
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


/*댓글 등록, 수정, 삭제 버튼 아이콘으로 변경 아이콘 출처 http://icooon-mono.com*/
#addReply {
	background: url( "<%= request.getContextPath() %>/resources/icons/insert.png" ) no-repeat;
	border: none;
    width: 32px;
    height: 32px;
    cursor: pointer;
}

#updateBtn{
background: url( "<%= request.getContextPath() %>/resources/icons/update.png" ) no-repeat;
	border: none;
    width: 32px;
    height: 32px;
    cursor: pointer;

}

#updateBtn2 {
	background: url( "<%= request.getContextPath() %>/resources/icons/insert.png" ) no-repeat;
	border: none;
    width: 32px;
    height: 32px;
    cursor: pointer;
}
#delteBtn {
	background: url( "<%= request.getContextPath() %>/resources/icons/delete.png" ) no-repeat;
	border: none;
    width: 32px;
    height: 32px;
    cursor: pointer;
}

textarea{
	border : none;
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
	
	<div class="container-fluid col-md-8 col-xs-12" align="center" style="background-color : aliceblue">
		<h1><%=p.getTitle()%></h1>
		
		<form method="post" action="<%=request.getContextPath()%>/InsertView.bo?bType=report&pickid=<%=p.getId()%>" align="right">
	      	<input type="hidden" id="selectUserNo" value="<%= u.getUserNo() %>"/> 
	      	<input type="hidden" id="pickid" name="pickid"  class="current" value="<%= p.getId() %>"/>
	      	<b><a id="shareBtn" href="#" data-toggle="modal" data-target="#shareModal" 
	      	style="color : none; text-decoration : none;" data-toggle="tooltip" data-placement="right" title="게시물 공유하기">
	      			   		    
			<img src="<%= request.getContextPath() %>/resources/icons/share.png" id="shareicon"
			 name="shareicon" class="icon">
			</a></b>
			&nbsp;&nbsp;
			
		    <b><a href="#" data-toggle="modal" data-target="#reportModal"
		   		  style="color : none; text-decoration : none;" data-toggle="tooltip" data-placement="right" title="게시물 신고하기">
		   		  		   		    
			<img src="<%= request.getContextPath() %>/resources/icons/report.png" id="reporticon"
			 name="reporticon" class="icon">
			</a></b>
		</form>
		
		<br>		
		<br>
		
		<input type="hidden" id="selectUserNo" value="<%= u.getUserNo() %>"/> 
	    <input type="hidden" id="resultPickId" name="Pid"  class="current" value="<%= p.getId() %>"/> 
	    
	    
		<div class="container col-xs-12" >	 
	   <div class="mySlides">          
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
			<div class="row userprofile col-xs-12" >			    				
				<div class="col-xs-12" align="left" >
					<% if(p.getProfile() != null) {%>
		 		   <img src="/pickme/resources/profileImage/<%= p.getProfile() %>" alt="Me" 
				    class="" id="profile">
					<% } else{ %>
					<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" 
					class="" id="profile">
					<% }%>				
					&emsp;&emsp;&emsp;
					
					<b><a href="/pickme/uPage.pr?uno=<%= p.getUserno()%>" style="color : none;
					text-decoration : none;"><%=p.getUserId()%></a></b>
					
				</div>		
				
			</div>			
								
				<br>				
				<div class="content arrow_box col-xs-12" align="left">												
					<p><%=p.getContent()%></p>					
				</div>
				
				<br><br>
				
	<div class="replyArea col-xs-12" >
		<div id="replySelectArea" style="background-color : aliceblue">
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
                         	 ㄴ Re <img src="img/reply_icon.gif"> 
                     <% } %>                    
                       <b><%=pc.getName()%></b><br>
                        <font size="2" color="lightgray"><%= pc.getEdate() %></font>
                    </div>
                </td>
                <!-- 본문내용 -->
                <td width="550">
                    <div class="text_wrapper">
                       <textarea class="reply-content" readonly="readonly"
                       style="background-color : aliceblue"><%= pc.getCcontent() %></textarea>
                    </div>
                </td>
                <!-- 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;" align="center">
                       <%if(u.getUserNo() == pc.getUserno()) { %>
								<input type="hidden" name="cno" value="<%=pc.getCid()%>"/>
								&nbsp;	  
								<button type="button" class="updateBtn" id="updateBtn" 
									onclick="updateReply(this);"></button> 
							
								<button type="button" class="updateConfirm" id="updateBtn2"
									onclick="updateConfirm(this);"
									style="display:none;" ></button> &nbsp;
																	
								<button type="button" class="deleteBtn" id="delteBtn"
									onclick="deleteReply(this);"></button>
							
							<% } else if( pc.getClevel() < 3) { %>
								<input type="hidden" name="writer" value="<%=u.getUserNo()%>"/>
								<input type="hidden" name="refcno" value="<%= pc.getCid()%>" />
								<input type="hidden" name="clevel" value="<%=pc.getClevel() %>" />
								<!-- <button type="button" class="insertBtn" 
									  onclick="reComment(this);">댓글 달기</button>  -->							 
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
                        <button type="submit" id="addReply"></button>                            
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
			$(obj).parent().parent().prev().find('textarea')
			.removeAttr('readonly');			
			$(obj).parent().parent().prev().find('textarea').css('background-color', 'white');
			// 수정 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.updateConfirm').css('display','inline');
			
			// 수정하기 버튼 숨기기
			$(obj).css('display', 'none');
		}
		
		function updateConfirm(obj) {
			// 댓글의 내용 가져오기
			var content
			  = $(obj).parent().parent().prev().find('textarea').val();
			
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
		
		$('#inserticon').click(function(){
			 location.href="/pickme/reply.pm";
		});
		
	</script>
	
<!-- Modal -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	게시물을 신고하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="reportYesBtn">예</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="reportNoBtn">아니오</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="shareModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 공유</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<input type="text" value="" id="shareinput" />
      	&nbsp;&nbsp;클립보드에 복사 
      	<span class="glyphicon glyphicon-plus"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="shareYesBtn">복사</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="shareNoBtn">취소</button>
      </div>
    </div>
  </div>
</div>

<script>
	$("#reportYesBtn").on('click', function(){
		location.href= "<%=request.getContextPath()%>/InsertView.bo?bType=report&pickid=<%=p.getId()%>";
	});
	
	$("#shareBtn").click(function(){
		var url = window.location.href;     // Returns full URL
		
		$.ajax({
			type : "post",
			url : "/pickme/shorturl.sh",
			data : {"url" : url},
			success : function(data){
				$("#shareinput").val(data);
			},error : function(data){
				console.log(data);				
			}
			
		});
	});
	
	$("#shareYesBtn").on('click', function(){
		var copyText = $("#shareinput");
		copyText.select();
		document.execCommand("copy");
		
	});

</script>
	<%@ include file="../common/footer.jsp"%>
	<%
		}
	%>
</body>
</html>