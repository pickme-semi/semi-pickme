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
	font-family : 'NANUMBARUNGOTHIC.TTF';
	color: #6e6e6e;
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
		 font-size: 14px;
		 color: #7d7d7d;
		 }
		 
.navbar-brand{
 font-family : 'NANUMSQUAREEB.TTF';
 src : url('/pickme/resources/font/NANUMSQUAREEB.TTF') fomat("truetype");
}



</style>
</head>
<body >
	<div class="pm-bg">
	<header class="board" >
	<nav class="navbar navbar-expand-lg" style="height: 130px;border-bottom: 2px solid #ffcce3;">
	  
	  <div class="container" >
	  <%if(user==null) {%>
		  <div class="login" align="center" id="test">
		  	<div class="logo" style="width:240px">
	        	<a class="navbar-brand" href="/pickme" 
	        	style="padding-top: 15px;"><img src="/pickme/resources/icons/Logo.png" width="240px" height="105px;"></a><a style="padding-top:105px">고객센터</a></div>
	        	<div style="text-align: left; padding-right: 200px; font-weight: bold; padding-top: 95px; font-size:14pt"><a>&nbsp;고객센터</a></div>
		  </div>
	  <%}else{ %>
	      	<div class="logo" style="width:240px" id="test">
	        	<a class="navbar-brand" href="/pickme/pickmain.pm" 
	        	style="padding-top: 15px; font-weight: bold; font-size:12pt;"><img src="/pickme/resources/icons/Logo.png" width="240px" height="105px;"></a></div>
	        <div style="text-align: left; padding-right: 200px; font-weight: bold; padding-top: 95px; font-size:14pt"><a>&nbsp;고객센터</a></div>
			<div class="search" style="width:33%">

	        </div>
	        <div class="logo" style="align:right; padding-top: 90px; font-size:10pt; font-weight:bold;" id="test">
				<a href="/pickme/list.bo?bType=qna">질문하기</a> &nbsp; | &nbsp; 
				<a href="/pickme/list.bo?bType=report">신고하기</a> &nbsp; 
				<% if(user.getUserId().equals("admin")){ %>
					| &nbsp; 
					<a href="/pickme/list.bo?bType=admin">관리자 페이지</a>
				<% } %>
	        </div>
      <%} %>
      </div>

    </nav>
    
  
    <br>
    <br><br>
	</header>
</body>

</html>