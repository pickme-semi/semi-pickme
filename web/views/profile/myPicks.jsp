
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.pick.model.vo.*"%>
<%
ArrayList<PickMe> myPick = (ArrayList<PickMe>)request.getAttribute("myPick");
int point = (Integer)request.getAttribute("point");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="preload" href="/pickme/resources/css/swell-2472ebd5fc.css" as="style" onload="this.rel='stylesheet'">

<title>My Pick Page</title>

<style>

@font-face {
	font-family : 'NANUMBARUNGOTHIC.TTF';
	src : url('/pickme/resources/font/NANUMBARUNGOTHIC.TTF') format("truetype");}
	

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
	width: 50px
}

	.card {
	
	margin-left : auto;
	margin-right : auto;
	max-width: 10rem;
	max-height : 10rem;
	
	}
	
	#live-swell-img {
     max-width: 100px;
    overflow: hidden;
	}
	
	
	.live-swell__pics{
		margin-left : 25px;
		margin-right : 25px;
		margin-top : 25px;
		margin-bottom : 25px;
		padding-left : 0px;
		padding-right : 0px;
	}
	

	li {
		padding-left : 15px;
		padding-right : 15px;
	}
	
	.nav-item:hover {
		
		border-bottom : 5px solid #ffb8d8;
		color : none;
		text-decoration : none;
		
	}
	
	.comment {
		border : none;
		width : auto;
		text-align : center;
		padding-top : 5px;
	}
	
	.col-sm {

	flex-grow : 0;
	
 	}
 	
 	img {
	    width: 100%;
	    height : 100%; 
	    object-fit: contain;
	    
	} 
 	
</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>

	<%@ include file="../common/header.jsp" %>
	
	<div class="col-md-12 text-center user" id="divImg">
	 
	<% if(user.getProfile() != null) {%>
	  <img src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr">
	<% } else{ %>
		<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
	<% }%><br>
	<h2 style="font-size:24pt; font-weight:bold;"><%= user.getUserId() %>&nbsp;<i id="user" class="fas fa-cog" ></i></h2>
	<!-- 아이디 전송을 위한 input 박스 -->
	<input type="hidden" id="getNo" value="<%= user.getUserNo() %>" />
	
	<input type="text" class="comment" value="" style="font-size:11pt;"/>
	<i id="check" class="fas fa-chevron-circle-down fa-2x" style="display:none"></i>
	<i id="pencil" class="fas fa-pencil-alt"></i>
	<br /><br />
	
	
	<div class="card bg-light md-4 text-center user" style="border: 1px solid white;" >

    <p class="card-text" style="background-color: white; font-weight:bold; font-size:11pt;">My point &nbsp; : &nbsp; <%=point %></p>

	</div>
	<br /><br /><br />
	
	
	<ul class="nav justify-content-center" style="font-size:12pt; font-weight: bold;">
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
	
	<section class="col-xs-12 col-md-12">
	 
	 <div class="live-swell xs-12 container" id="divImg">
	 <div class="row">
	 
	 <% if(!myPick.isEmpty()) { %>
	 <% for (int i=0; i<myPick.size(); i++) {%> 
	 
            <div class="live-swell__pics col-sm" style="padding:0px; flex-grow : 0">
            	<a href="/pickme/pickview.pv?Pid=<%=myPick.get(i).getId()%>" target="_blank">
              <div id="live-swell-img-a " class="live-swell__pics__pic live-swell__pics__pic--a">
              <img src="/pickme/resources/PickUploadFiles/<%= myPick.get(i).getSelect_1() %>" alt="" />
              </div>
              <div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b">
              <img src="/pickme/resources/PickUploadFiles/<%= myPick.get(i).getSelect_2() %>" alt="" />
              </div>
              </a>
                <div class="live-swell__pics__or">or</div>
                  </div>
                   <% } %>
     </div>
              </div>
	    
	
		  <% } else{ %>
		  <div align="center" style = "margin-top : 100px; margin-bottom : 300px; margin-left : auto; margin-right : auto;" ><h5 style="text-size:24pt; color: gray; font-weight:bold;">작성한 게시글이 없습니다.</h5></div>
		  <% } %> 
		
	
	
	</section>
	
	<%@ include file="../common/footer.jsp" %>
	<% } %>
	<script>
	
	// comment 불러오기
		$(function(){
			$.ajax({
				url : '/pickme/cBrowse.pr',
				type : 'get',
				data :  {
					uno : $('#getNo').val()
				},success : function(data){
					$('.comment').val(data);
				}
				
			});
		});
	
		$('#user').click(function(){
			 location.href="/pickme/mPage.pr";
		});
		
		$('#pencil').click(function(){
			
			$('.comment').val("");
			$('.comment').attr("style", "border : 1px solid black");
			$('#pencil').attr("style", "display:none");
			$('#check').attr("style","display:block");
			
			
		});
		
		// comment 수정하기위한 ajax
		$('#check').click(function(){
			
			$.ajax({
				url : "/pickme/comment.pr",
				type : "get",
				data : {
				 comment : $('.comment').val(),
				 uno : $('#getNo').val()
				 
				}, success : function(data){
					if(data != null ){
						$('.comment').val(data);
						window.location.reload()
					}
				},
				error : function(request, status, error){
					console.log("실패 !!!")
					console.log(request);
					console.log(status);
					console.log(error);
				},
				complete : function(){
					console.log("무조건 실행하는 함수");
				}
			});
		});
		
		
	
	</script>

</body>

</html>
