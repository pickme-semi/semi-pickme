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
	font-family : 'NANUMBARUNGOTHIC.TTF';
	src : url('/pickme/resources/font/NANUMBARUNGOTHIC.TTF') format("truetype");
}
	
* {
	font-family : 'NANUMBARUNGOTHIC.TTF'
}
 
.pm-section{
	background : ;
	margin-left: auto;
	margin-right: auto;
}
.result-none{
	height : 500px;
	background : pink;
}
header.board{
	background : ;
}

#test a{ text-align: center; 		 
		 font-size: 16px;}
		 
.navbar-brand{
 font-family : 'NANUMSQUAREEB.TTF';
 src : url('/pickme/resources/font/NANUMSQUAREEB.TTF') fomat("truetype");
}
		 




</style>
</head>
<body >
	<div class="pm-bg">
	<header class="board" >
	<nav class="navbar navbar-expand-lg" style="height: 100px;">
	  
	  <div class="container">
	  <%if(user==null) {%>
		  <div class="login" align="center" id="test">
		  	<div class="logo" style="width:33%">
	        	<a class="navbar-brand" href="/pickme" 
	        	style=" font-size:50px; padding-top: 50px">PICK ME</a> 고객센터
	        	
	        </div>
		  </div>
	  <%}else{ %>
	      	<div class="logo" style="width:33%" id="test">
	        	<a class="navbar-brand" href="/pickme/pickmain.pm" 
	        	style="font-size: 50px; padding-top: 50px">PICK ME</a> 고객센터
	        	
	        </div>
			<div class="search" style="width:33%">

	        </div>
	        <div class="logo" style="align:right; padding-top: 80px" id="test">
				<a href="/pickme/list.bo?bType=qna">질문하기</a> &nbsp; | &nbsp; 
				<a href="/pickme/list.bo?bType=report">신고하기</a> &nbsp; | &nbsp; 
				<a href="/pickme/list.bo?bType=admin">관리자 페이지</a>
	        </div>
      <%} %>
      </div>
    </nav>
    <hr />
    <br>
    <br><br>
	</header>
</body>

</html>