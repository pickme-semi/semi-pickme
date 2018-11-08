<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.user.model.vo.User"%>
<%
	ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
	int result = (Integer)request.getAttribute("result");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My page</title>

<link rel="stylesheet" href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/pickme/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/pickme/resources/css/style.css">


<link href='https://fonts.googleapis.com/css?family=PT+Serif:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>

<script src="/pickme/resources/js/modernizr.js" type="993585227198c70882fa5f41-text/javascript"></script>


</head>

<body>
<div class="banner" id="home"></div>

<header class="header">
<div class="top-nav"></div>

<div class="row">
<div class="col-md-12 text-center user">
  <img src="/pickme/resources/images/user.jpg" alt="Me" class="img-circle">
<h1>아이디</h1>
<h4>한 줄 소개</h4>
<div class="social-icons">
<a href="#"><i class="fa fa-facebook"></i></a>
<a href="#"><i class="fa fa-twitter"></i></a>
<a href="#"><i class="fa fa-instagram"></i></a>
<a href="#"><i class="fa fa-linkedin"></i></a>
<a href="#"><i class="fa fa-google-plus"></i></a>
</div>
</div>
<!-- main nav -->
<div class="col-md-12">
<div class="main-nav">
<nav class="navbar navbar-default">
<div class="container-fluid">
<!-- main > header nav -->
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</div>
<!-- main > footer nav -->
<div class="collapse navbar-collapse text-center" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="/pickme/fList.pr">Follower</a></li>
<li><a href="/pickme/fiList.pr">Following</a></li>
<li><a href="/pickme/mPicks.pr">My Picks</a></li>
<li><a href="/pickme/mPage.pr">My Page</a></li>
</ul>
</div>
</div>
</nav>
</div>
</div>
</div>

</header>
<section class="works text-center">


<div class="outer">
	<h2 align="center">Follower</h2>
		<h5><%= result %>명</h5>
		<br /><br /><br />
		
		<div class="followerArea">
			<% for (User followerList : list) { %>
			<div class="follower-list" align="center">
				<img data-src="holder.js/75x75" src="<%=followerList.getProfile() %>" class="rounded-circle" width="100px" height="50px" /> &nbsp;
				<%= followerList.getUserId() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button>follow</button>
				
			</div>
			
			
			<% } %>
	</div>

</div>



</section>

	<%@ include file="../common/footer.jsp" %>
	

<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
<script src="/pickme/resources/js/jquery.mixitup.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/smoothscroll.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/bootstrap.min.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/custom.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/rocket-loader.min.js" defer=""></script></body>
</html>

</body>
</html>