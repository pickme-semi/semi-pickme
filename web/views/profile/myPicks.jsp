<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.pick.model.vo.*"%>
<%
ArrayList<PickMe> myPick = (ArrayList<PickMe>)request.getAttribute("myPick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Pick Page</title>

<style>
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
</style>
</head>
<body>

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
</div>

<hr />



<section class="col-xs-12 col-md-12">
 <% for (int i=0; i<myPick.size(); i++) {%>
	
	<div class="parent" align=center>
		<img class="child1" src="/pickme/resources/PickUploadFiles/<%=myPick.get(i).getSelect_1() %>" />
		<span class="or">or</span>
		<img class="child2" src="/pickme/resources/PickUploadFiles/<%=myPick.get(i).getSelect_2() %>" />
    <div class="caption-container parent col-sm-5 col-md-4" align=center >
    <dl>
    	<dt> <%= myPick.get(i).getTitle() %></dt>
    	<dd style ="vertical-align : middle;"> <%= myPick.get(i).getContent() %></dd>
    </dl>
 	</div>
  </div>

	
<br />
<% } %>




</section>


<%@ include file="../common/footer.jsp" %>
</body>

</html>