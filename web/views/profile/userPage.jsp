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

<link rel="preload" href="/pickme/resources/css/swell-2472ebd5fc.css" as="style" onload="this.rel='stylesheet'">

<title>User Page</title>
<style>

@font-face {
	font-family : 'NANUMBARUNGOTHIC.TTF';
	src : url('/pickme/resources/font/NANUMBARUNGOTHIC.TTF') format("truetype");
	

* {	font-family : 'NANUMBARUNGOTHIC.TTF';
	color: #505050;
	}
	
	
	.attr {
	
		height : 150px;
		position : relative;
		width : 150px;
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
	width: 50px }
	
	#live-swell-img {
    max-width: 400px;
    overflow: hidden;
	}
	
	#userp img {
	    width: 100%;
	    height : 100%;
	    object-fit: contain;
	} 
	
	.live-swell__pics{
	margin-left : 25px;
	margin-right : 25px;
	padding-left : 0px;
	padding-right : 0px;
	}
	
	.comment {
			border : none;
			width : auto;
			text-align : center;
			padding-top : 5px;
		}
		
	
</style>



</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
	<div class="col-md-12 text-center user" id="userp">
	 
	<% if(users.getProfile() != null) {%>
	  <img src="/pickme/resources/profileImage/<%= users.getProfile() %>" alt="Me" class="rounded-circle attr">
	<% } else{ %>
		<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
	<% }%>
	<h2 class=""><%= users.getUserId() %></h2>
	<input type="hidden" class="comment" value=""/>
	<br />
	<button id="fbtn" value="<%=users.getUserNo() %>" class="btn btn-danger">follow</button>
	<button id="fbtn2" style="display:none" value="<%=user.getUserNo() %>" class="btn btn-danger">follow 취소</button>
	
	<br />
	<br />
	
	</div>
	
	<hr />
	
	<section class="col-xs-12 col-md-12"  >
	 
	 <div class="live-swell xs-12 container" id="userp">
	 <div class="row">
	 
	 <% if(!userPick.isEmpty()) { %>
	 <% for (int i=0; i<userPick.size(); i++) {%> 
	 
            <div class="live-swell__pics col-sm" style="padding:0px; flex-grow : 0">
              <div id="live-swell-img-a " class="live-swell__pics__pic live-swell__pics__pic--a">
              <img src="/pickme/resources/PickUploadFiles/<%= userPick.get(i).getSelect_1() %>" alt="" />
              </div>
              <div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b">
              <img src="/pickme/resources/PickUploadFiles/<%= userPick.get(i).getSelect_2() %>" alt="" />
              </div>
                <div class="live-swell__pics__or">or</div>
                  </div>
                   <% } %>
     </div>
              </div>
	    
	
		  <% } else{ %>
		  <div align="center" style = "margin-top : 100px; margin-bottom : 300px; margin-left : auto; margin-right : auto;" ><h5>작성한 게시글이 없습니다.</h5></div>
		  <% } %> 
		
	
	
	</section>
	
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
	
		// comment 불러오기
		$(function(){
			$.ajax({
				url : '/pickme/cBrowse.pr',
				type : 'get',
				data :  {
					uno : $('#fbtn').val()
				},success : function(data){
					if(data = null ){
						$('.comment').attr("type","hidden");
					}else{
					$('.comment').attr("type","text");
					$('.comment').val(data);
					}
				}
				
			});
		});
	
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