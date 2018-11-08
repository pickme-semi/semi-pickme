<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.user.model.vo.*"%>
<%
	User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">
<script src="/pickme/resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>

<style>

</style>
</head>
<body>
	<header>
	<nav class="navbar navbar-expand-lg navbar-white bg-white">
      <div class="container">
      	<div class="logo" style="width:33%">
        	<a class="navbar-brand" href="/pickme">PICK ME</a>
        </div>
		<div class="search" style="width:33%" text-align="center">
	        <div class="collapse navbar-collapse" id="navbarsExample07">
	          <form class="form-inline my-2 my-md-0" style="margin-left:auto;margin-right:auto;">
	            <input class="form-control" type="text" placeholder="Search" aria-label="Search">
	          </form>
	        </div>
        </div>
        <div class="logo" style="width:33%" align="right">
			<img src="/pickme/resources/icons/inbox.svg" alt="" style="width:33px;"/>
			<img src="/pickme/resources/icons/issue-opened.svg" alt="" style="width:33px;"/>
      <button onclick="location.href='views/qna/qnaMain.jsp'">QNA 메인 테스트</button>
        </div>
      </div>
    </nav>
    <hr />
	</header>
</body>

</html>
