<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.user.model.vo.*"%>
<%
	User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/pickme/resources/css/pm-common.css" />
<script src="/pickme/resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>

<style>
	
 a{
 	color : black;
 }
 
	@font-face {
		font-family : 'GODOM.TTF';
		src : url('/pickme/resources/font/GODOM.TTF') format("truetype");
	}
	
	* {
		font-family : 'GODOM.TTF'
	}
 
.pm-section{
	margin-left: auto;
	margin-right: auto;
}
.result-none{
	height : 500px;
	background : pink;
}
.pm-input-form{
	background : #D8D8D8;
}
</style>
</head>
<body>
	<div class="pm-bg">
	<header>
	<nav class="navbar navbar-expand-lg">
	  <div class="container">
	  <%if(user==null) {%>
		  	<div class="logo" style="width:33%">
	        	<a class="navbar-brand" href="/pickme">PICK ME</a>
	        </div>
	        <div class="logo" style="width:33%" align="right">
			<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    		<span class="navbar-toggler-icon"><i class="fa fa-bars fa-1x">메뉴</i></span>
	  		</button>
	  		 <div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="nav justify-content-end">
				  <li class="nav-item">
				    <a class="nav-link active" href="#infomain">픽미란?</a>
				  </li>
				  <li class="nav-item">$("#" + id + '"')
				    <a class="nav-link" href="#infodev">비즈니스</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#infodev">개발자</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#">인재채용</a>
				  </li>
				</ul>
				</div>
	        </div>
	  <%}else{ %>
	      	<div class="logo" style="width:33%">
	        	<a class="navbar-brand" href="/pickme/pickmain.pm">PICK ME</a>
	        </div>
			<div class="search" style="width:33%" text-align="center">
		        <div class="navbar-collapse" id="navbarsExample07">
		          <form class="form-inline my-2 my-md-0" style="margin-left:auto;margin-right:auto;" action="/pickme/search.se" method="get">
		            <input class="form-control" type="text" name="userSearch" placeholder="@user #category" aria-label="Search">
		          </form>
		        </div>
	        </div>
	        <div class="logo" style="width:33%" align="right">
			<div class="dropdown show" align="right" style="diplay:block;float:right">
			  <a class="dropdown-toggle" href="#" role="" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <%= user.getUserName() %>
			  </a>
			
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" align="right" style="width:100%;margin-left:-100px">
				<a class="dropdown-item" href="/pickme/mPicks.pr?uno=<%= user.getUserNo() %>">내정보</a>
				<a class="dropdown-item" href="/pickme/pickmain.pm">픽</a>
				<a class="dropdown-item" href="/pickme/sTotalList.st">통계</a> 
				<a class="dropdown-item" href="/pickme/list.bo">고객센터</a>
				<hr />
				<a class="dropdown-item" href="/pickme/logout.au">로그아웃</a>
			  </div>
			</div>
	        </div>
      <%} %>
      </div>
    </nav>
    <hr />
	</header>