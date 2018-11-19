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
	<h3>한 줄 소개</h3>
	
	<a href="/pickme/fList.pr">Follower</a>
	<a href="/pickme/fiList.pr">Following</a>
	<a href="/pickme/mPicks.pr?uno=<%= user.getUserNo() %>">My Picks</a>
	<a href="/pickme/mPage.pr">My Page</a>
	<br />
	<br />
	<div class="card bg-light md-4 text-center user">
  	<div class="card-header">포인트 내역</div>
  	<div class="card-body">
    <h5 class="card-title">포인트</h5>
    <p class="card-text"><%=point %></p>
  	</div>
	</div>
	
	</div>
	
	<hr />
	
	<section class="col-xs-12 col-md-12">
	
	<%-- <% if(!myPick.isEmpty()) { %>
	 <% for (int i=0; i<myPick.size(); i++) {%> --%>
	 
	 <div class="live-swell xs-12">
            <div class="live-swell__pics">
              <div id="live-swell-img-a " class="live-swell__pics__pic live-swell__pics__pic--a">
              		
              
              </div>
              <div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b"></div>
                <div class="live-swell__pics__or">or</div>
                  </div>
                 <%--  <dl>
	    	<dt> <%= myPick.get(i).getTitle() %></dt>
	    	<dd style ="vertical-align : middle;"> <%= myPick.get(i).getContent() %></dd>
	    </dl> --%>
              </div>
	    
	<br />
	<%-- <% } %>
		  <% } else{ %>
		  <div align="center"><h5>작성한 게시글이 없습니다.</h5></div>
		  <% } %> --%>
		
	
	
	</section>
	
	<%@ include file="../common/footer.jsp" %>
<% } %>
</body>

</html>