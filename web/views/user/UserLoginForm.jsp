<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인_[Pick Me]</title>
<style>
	.outer{
		width : 300px;
		height : 400px;
		background : mistyrose;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	
	}
	
	#p1{
		color : grey;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class = "outer">
<br>
<h2 align = "center"> 로그인 </h2>

<br />

<form id="loginform" action="/pickme/login.au" method="post">
	<table align="center">
		<tr>
			<td><input name="userId" type="text" placeholder="아이디"></td>
		</tr>
		<tr>
			<td><input name="userPass" type="password" placeholder="비밀번호"></td>
		</tr>
	</table>
	<br>
	<div class="btns" align="center">
	<button type="submit" value="로그인">로그인</button>
	<br><br>
	<p id="p1">아직 계정이 없으신가요? <a href="/pickme/views/user/UserTerms.jsp">회원가입</a></p>

	<br>
	
	<a href="/pickme/views/user/UserIdSearchForm.jsp">아이디 찾기</a>
	/
	<a href="/pickme/views/user/UserPassSearchForm.jsp">비밀번호 찾기</a>
	
	</div>
	
</form>
</div>
<br><br>


<%@ include file="../common/footer.jsp" %>
</body>
</html>