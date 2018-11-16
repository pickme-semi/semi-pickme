<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.pick.model.vo.*"%>
<%
	User users = (User)request.getAttribute("user");

	ArrayList<PickMe> userPick = (ArrayList<PickMe>)request.getAttribute("userPick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
<style>
	.parent {
		margin-left : auto;
		margin-right : auto;
	}
	.child1 {
		z-index : 5;
		position: relative;
		border : 1px solid black;
		width: 200px;
		height : 200px;
		margin: auto; 
	}
	.child2 {
		z-index : 1;
		position: relative;
		border : 1px solid black;
		width: 200px;
		height : 200px;
		margin: auto; 
	}
	.caption-container{
		margin-left : auto;
		margin-right : auto;
		border : 1px solid red;
		position: absoulte;
		width : auto;
		height : auto;
		word-break:break-all;
	}
	
	.or {
	z-index : 3;
	background-color: rgb(1, 5, 0);
	border-radius: 50%;
	color: #b3b3b3;
	font-size: 1.3em;
	line-height: 50px;
	position: relative;
	text-align: center;
	text-transform: uppercase;
	top: calc(50% - 25px);
	vertical-align: middle;
	width: 50px
</style>

</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
	<div class="col-md-12 text-center user">
	 
	<% if(users.getProfile() != null) {%>
	  <img src="/pickme/resources/profileImage/<%= users.getProfile() %>" alt="Me" class="rounded-circle attr">
	<% } else{ %>
		<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
	<% }%>
	<h2><%= users.getUserId() %></h2>
	<h5>한 줄 소개</h5>
	<button id="fbtn" value="<%=users.getUserNo() %>">follow</button>
	<button id="fbtn2"style="display:none" value="<%=user.getUserNo() %>">follow 취소</button>
	
	<br />
	<br />
	
	</div>
	
	<section class="col-xs-12 col-md-12">
	 <% for (int i=0; i<userPick.size(); i++) {%>
		
		<div class="parent" align=center>
			<img class="child1" src="/pickme/resources/PickUploadFiles/<%=userPick.get(i).getSelect_1() %>" />
			<span class="or">or</span>
			<img class="child2" src="/pickme/resources/PickUploadFiles/<%=userPick.get(i).getSelect_2() %>" />
	    <div class="caption-container parent col-sm-5 col-md-4" align=center >
	    <dl>
	    	<dt> <%= userPick.get(i).getTitle() %></dt>
	    	<dd style ="vertical-align : middle;"> <%= userPick.get(i).getContent() %></dd>
	    </dl>
	 	</div>
	  </div>
		
	<br />
	<% } %>
	
	</section>
	
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		// 팔로우 확인
		$(function (){
			
			$.ajax({
				url : '/pickme/fCheck.pr',
				type : 'get',
				data :  {
					uno1 : $('#fbtn').val(),
					uno2 : $('#fbtn2').val()
				},success : function(data){
					if(data > 0){
						$("button").toggle()
					}
				}, error : function(request, status, error){
					alert(request + "\n" 
						  + status + "\n"
						  + error)
				}
				
			});
		});
		
		//팔로우 버튼
		$("#fbtn").click(function(){
		
		$.ajax({
			url : '/pickme/fInsert.pr',
			type : 'get',
			data : {
				uno1 : $('#fbtn').val(),
				uno2 : $('#fbtn2').val()
			},
			success : function(data){
				
				if(data > 0){
					
				$("button").toggle()
				}else{
					alert("불러오기 실패")
				}
			},error : function(request, status, error){
				alert(request + "\n"
					  + status + "\n"
					  + error);
			}
			
			});
		});
		
		// 팔로우 취소 버튼
		$("#fbtn2").click(function(){
		
		$.ajax({
			url : '/pickme/fDelete.pr',
			type : 'get',
			data : {
				uno1 : $('#fbtn').val(),
				uno2 : $('#fbtn2').val()
			},
			success : function(data){
				
				if(data > 0){
					
				$("button").toggle()
				
				}else{
					alert("불러오기 실패!")
				}
				
			},error : function(request, status, error){
				alert(request + "\n"
					  + status + "\n"
					  + error);
			}
			
		});
	});
	</script>
<% } %>
</body>
</html>