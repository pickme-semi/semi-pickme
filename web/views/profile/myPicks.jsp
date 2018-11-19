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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<title>My Pick Page</title>

<style>
	.live-swell-img{
	padding : 0px;
	}
	
	.attr {
	
		height : 150px;
		position : relative;
		width : 150px;
			}
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
}

	.card {
	
	margin-left : auto;
	margin-right : auto;
	max-width: 10rem;
	max-height : 10rem;
	
	}
	
	#live-swell-img {
    max-width: 400px;
    overflow: hidden;
	}
	
	img {
	    width: 100%;
	    object-fit: contain;
	} 
	
	.live-swell__pics{
	margin-left : 25px;
	margin-right : 25px;
	padding-left : 0px;
	padding-right : 0px;
	}
	

	li {
		padding-left : 15px;
		padding-right : 15px;
	}
	
	.nav-item:hover {
		
		border-bottom : 5px solid blue;
		
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
	<h2><%= user.getUserId() %> <i id="user" class="fas fa-cogs"></i> </h2>
	<h5>comment<i class="fas fa-pencil-alt"></i></h5>
	
	<div class="card bg-light md-4 text-center user">
  	<div class="card-header">포인트 내역</div>
  	<div class="card-body">
    <h5 class="card-title">포인트</h5>
    <p class="card-text"><%=point %></p>
  	</div>
	</div>
	<br /><br /><br />
	
	<ul class="nav justify-content-center" >
	  <li class="nav-item active">
	    <a href="/pickme/fList.pr">팔로워</a>
	  </li>
	  <li class="nav-item">
	    <a href="/pickme/fiList.pr">팔로잉</a>
	  </li>
	  <li class="nav-item">
	    <a href="/pickme/mPicks.pr?uno=<%= user.getUserNo() %>">나의 픽's</a>
	  </li>
	</ul>
	</div>
	<hr />
	<br />
	<br />
	
	
	
	<section class="col-xs-12 col-md-12">
	 
	 <div class="live-swell xs-12 container">
	 <div class="row">
	 
	 <% if(!myPick.isEmpty()) { %>
	 <% for (int i=0; i<myPick.size(); i++) {%> 
	 
            <div class="live-swell__pics col-sm" style="padding:0px">
              <div id="live-swell-img-a " class="live-swell__pics__pic live-swell__pics__pic--a">
              <img src="/pickme/resources/PickUploadFiles/<%= myPick.get(i).getSelect_1() %>" alt="" />
              </div>
              <div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b">
              <img src="/pickme/resources/PickUploadFiles/<%= myPick.get(i).getSelect_2() %>" alt="" />
              </div>
                <div class="live-swell__pics__or">or</div>
                  </div>
                   <% } %>
     </div>
              </div>
	    
	
		  <% } else{ %>
		  <div align="center"><h5>작성한 게시글이 없습니다.</h5></div>
		  <% } %> 
		
	
	
	</section>
	
	<%@ include file="../common/footer.jsp" %>
	<% } %>
	<script>
	
		$('#user').click(function(){
			 location.href="/pickme/mPage.pr";
		})
	
	</script>

</body>

</html>