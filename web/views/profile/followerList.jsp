<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.user.model.vo.User"%>
<%
	ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
	int followerCount = (Integer)request.getAttribute("followerCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Pick Page</title>


<link rel="preload" href="/pickme/resources/css/swell-2472ebd5fc.css" as="style" onload="this.rel='stylesheet'">

<style>
		.attr {
		height : 50px;
		position : relative;
		width : 50px;
			}
</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>


<div class="col-md-12 text-center user">
  <img src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr">
<h2><%= user.getUserId() %></h2>
<h5>한 줄 소개</h5>

<a href="/pickme/fList.pr">Follower</a>
<a href="/pickme/fiList.pr">Following</a>
<a href="/pickme/mPicks.pr">My Picks</a>
<a href="/pickme/mPage.pr">My Page</a>

</div>

<section class="works text-center">


<div class="outer">
	<h2 align="center">Follower</h2>
		<h5><%= followerCount %>명</h5>
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