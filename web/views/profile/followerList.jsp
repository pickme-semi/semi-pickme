<%@page import="com.profile.controller.FollowerListServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.profile.model.vo.*"%>
<%
	ArrayList<Follow> list = (ArrayList<Follow>)request.getAttribute("list");
	int followerCount = (Integer)request.getAttribute("followerCount");
	int userNo = (Integer)request.getAttribute("userNo");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<title>My Pick Page</title>

<style>
		.attr {
		height : 50px;
		position : relative;
		width : 50px;
			}
			
		li {
		padding-left : 15px;
		padding-right : 15px;
			}
	
		.nav-item:hover {
			
			border-bottom : 5px solid blue;
			color : none;
			text-decoration : none;
			
		}
		
		.comment {
		
			border : none;
			width : auto;
			text-align : center;
			padding-top : 5px;
		}
		
		.col {
			
			margin-top : auto;
			margin-bottom : auto;
		}
</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
	<div class="col-md-12 text-center user">
	<% if(user.getProfile() != null) {%>
	  <img src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr">
	<% } else{ %>
		<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
	<% }%> 
	<h2><%= user.getUserId() %></h2>
	
	<input type="text" class="comment" value=""/>
	<br /><br />
	
	<input type="hidden" id="userNo" value="<%=user.getUserNo() %>" />
	
	<ul class="nav justify-content-center" >
	  <li class="nav-item active">
	    <a href="/pickme/fList.pr" style="color : none;
		text-decoration : none;">팔로워</a>
	  </li>
	  <li class="nav-item">
	    <a href="/pickme/fiList.pr" style="color : none;
		text-decoration : none;">팔로잉</a>
	  </li>
	  <li class="nav-item">
	    <a href="/pickme/mPicks.pr?uno=<%= user.getUserNo() %>" style="color : none;
		text-decoration : none;">나의 픽's</a>
	  </li>
	</ul>
	</div>
	<hr />
	<br />
	<br />
	
	<section class="works text-center">
	
	
	<div class="outer">
		<h2 align="center">Follower</h2>
			<h5><%= followerCount %>명</h5>
			<br /><br /><br />
			
			<div class="followerArea container col-sm-4">
			
				<% for (Follow followerList : list) { %>
				
			<div class="row">
				<div class="follower-list col" align="center">
					<% if(followerList.getProfile() != null) {%>
					<img src="/pickme/resources/profileImage/<%=followerList.getProfile() %>" class="rounded-circle" width="100px" height="50px" /> &nbsp;
					<% } else{ %>
					<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
					<% }%> 
					</div>
					<div class="col" onclick="location.href='<%= request.getContextPath() %>/uPage.pr?uno='+<%=followerList.getUserNo() %>">
					<%= followerList.getUserId() %>
					</div>
					 <div class="col">
					 <% if(followerList.getFollowingChk().equals("Y")) { %>
	           		<input id="i1_<%=followerList.getUserNo() %>" type="hidden" value="<%= followerList.getUserNo()%>"/>
	           		<i class="far fa-check-circle fa-2x" ></i> <i class="far fa-circle fa-2x" style="display:none"></i>
	           		<% }else { %>
	           		<input id="i1_<%=followerList.getUserNo() %>" type="hidden" value="<%= followerList.getUserNo()%>"/>
	           		<i class="far fa-circle fa-2x" ></i><i class="far fa-check-circle fa-2x" style="display:none"></i>
	            	<% } %>
	            </div>
			</div>
				
	         <% } %>
		</div>
	</div>
	</section>
	
		<%@ include file="../common/footer.jsp" %>
			
	<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
	
	<script>
	
	// comment 불러오기
	$(function(){
		$.ajax({
			url : '/pickme/cBrowse.pr',
			type : 'get',
			data :  {
				uno : $('#userNo').val()
			},success : function(data){
				$('.comment').val(data);
			}
			
		});
	});

	// 마이페이지로 이동
	$('#user').click(function(){
		 location.href="/pickme/mPage.pr";
	});
	
	// comment 수정
	$('#pencil').click(function(){
		
		$('.comment').val("");
		$('.comment').attr("style", "border : 1px solid black");
		$('#pencil').attr("style", "display:none");
		$('#check').attr("style","display:block");
		
		
	});
	
	//팔로우 버튼
	
	$(".fa-circle").click(function(){
		
	$.ajax({
		url : '/pickme/fInsert.pr',
		type : 'get',
		data : {
			uno1 : $(this).siblings('input').val(),
			uno2 : $('#userNo').val()
		},
		success : function(data){
			console.log(data);
			if(data > 0){
				window.location.reload()
				
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
	$('.fa-check-circle').click(function(){

		$.ajax({
			url : '/pickme/fDelete.pr',
			type : 'get',
			data : {
				uno1 : $(this).siblings('input').val(),
				uno2 : $('#userNo').val()
			},
			success : function(data){
				
				if(data > 0){

					window.location.reload()
					
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