<%@page import="com.profile.controller.FollowerListServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.user.model.vo.User"%>
<%
	ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
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
	<h5>한 줄 소개</h5>
	<a href="/pickme/fList.pr">Follower</a>
	<a href="/pickme/fiList.pr">Following</a>
	<a href="/pickme/mPicks.pr?uno=<%= user.getUserNo() %>">My Picks</a>
	<a href="/pickme/mPage.pr">My Page</a>
	
	</div>
	
	<section class="works text-center">
	
	
	<div class="outer">
		<h2 align="center">Follower</h2>
			<h5><%= followerCount %>명</h5>
			<br /><br /><br />
			
			<div class="followerArea container col-sm-4">
			
				<% for (User followerList : list) { %>
				
			<div class="row">
				<div class="follower-list col" align="center" 
				onclick="location.href='<%= request.getContextPath() %>/uPage.pr?uno='+<%=followerList.getUserNo() %>">
					<% if(user.getProfile() != null) {%>
					<img src="/pickme/resources/profileImage/<%=followerList.getProfile() %>" class="rounded-circle" width="100px" height="50px" /> &nbsp;
					<% } else{ %>
					<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
					<% }%> 
					</div>
					<div class="col">
					<%= followerList.getUserId() %>
					</div>
					 <div class="col">
	           		<input id="i1" type="hidden" value="<%= followerList.getUserNo()%>"/><i id="circle1" class="far fa-circle fa-2x" ></i>
	           		<input id="i2" type="hidden" value="<%= user.getUserNo()%>" /><i id="circle2" class="far fa-check-circle fa-2x" style="display:none"></i>
	            </div>
				</div>
	         <% } %>
		</div>
	</div>
	</section>
	
		<%@ include file="../common/footer.jsp" %>
		
	
	<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
	
	<script>
	// 팔로우 확인
	$(function (){
		
		$.ajax({
			url : '/pickme/fCheck.pr',
			type : 'get',
			data :  {
				uno1 : $('#i1').val(),
				uno2 : $('#i2').val()
			},success : function(data){
				if(data > 0){
					$("i").toggle()
				}
			}
			
		});
	});
	
	//팔로우 버튼
	$("#circle1").click(function(){
	
	$.ajax({
		url : '/pickme/fInsert.pr',
		type : 'get',
		data : {
			uno1 : $('#i1').val(),
			uno2 : $('#i2').val()
		},
		success : function(data){
			
			if(data > 0){
				
			$("i").toggle()
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
	$("#circle2").click(function(){
	
	$.ajax({
		url : '/pickme/fDelete.pr',
		type : 'get',
		data : {
			uno1 : $('#i1').val(),
			uno2 : $('#i2').val()
		},
		success : function(data){
			
			if(data > 0){
				
			$("i").toggle();
			
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