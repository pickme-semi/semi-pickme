<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.user.model.vo.User"%>
<%
   ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
   int followingCount = (Integer)request.getAttribute("followingCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	<!-- 프로필 사진 업을 때 기본이미지 보여주기 -->
	<% if(user.getProfile() != null) {%>
	  <img src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr">
	<% } else{ %>
	   <img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
	<% }%>
	<h2><%= user.getUserId() %></h2>
	<h3>한 줄 소개</h3>
	
	<a href="/pickme/fList.pr">Follower</a>
	<a href="/pickme/fiList.pr">Following</a>
	<a href="/pickme/mPicks.pr?uno=<%= user.getUserNo() %>">My Picks</a>
	<a href="/pickme/mPage.pr">My Page</a>
	
	</div>
	
	<section class="works text-center">
	
	<div class="outer">
	   <h2 align="center">Following</h2>
	   <h5><%=followingCount %>명</h5>
	      <br /><br /><br />
	      
	      <div class="followerArea container col-sm-4">
	         
	         <% for (User followingList : list) { %>
	         <div class="row">
	            <div class="following-list col" align="center" 
	            onclick="location.href='<%= request.getContextPath() %>/uPage.pr?uno='+<%=followingList.getUserNo() %>">
	 				  <% if(user.getProfile() != null) {%>
	                 <img src="/pickme/resources/profileImage/<%= followingList.getProfile() %>" alt="Me" class="rounded-circle attr">
	               <% } else{ %>
	               <img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
	               <% }%>
	            </div>
	            <div class="col">
	               <%= followingList.getUserId() %> 
	            </div>
	            <div class="col">
	           		<input id="i1" type="hidden" value="<%= followingList.getUserNo()%>"/><i id="circle1" class="far fa-circle fa-2x"></i>
	           		<input id="i2" type="hidden" value="<%= user.getUserNo()%>" /><i id="circle2" class="far fa-check-circle fa-2x" style="display:none"></i>
	            </div>
	            <div>
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