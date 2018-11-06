<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입_[Pick Me]</title>
<style>
	.outer{
		width : 450px;
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
<h2 align = "center"> 회원가입 </h2>
<br />
<form id = "joinform" action="/pickme/userJoin.au" method="post">
	<table align="center">
	<tr>
		<td width="120px"> 아이디 </td>
		<td><input type="text" name="userId" id ="userId" required="required" ></td>
		<td> <button id="idCheck"> 중복확인</button></td>
	</tr>
	<tr>
		<td> 비밀번호 </td>
		<td><input type="password" id="userPwd" name="userPass" required="required" ></td>
		<td></td>
	</tr>
	<tr>
		<td> 비밀번호 확인 </td>
		<td><input type="password" id="userPwd2" name="userPass2" ></td>
		<td><label id="pwdResult"></label></td>
	</tr>
	<tr>
		<td> 이름 </td>
		<td><input type="text" maxlength="5" name="userName" required="required" ></td>
		<td></td>
	</tr>
	<tr>
		<td> 이메일 <br /></td>
		<td><input type="email" name="userEmail" required="required" ></td>
		<td></td>
	</tr>
	
	</table>
	<br />
	<div class="btns" align="center">
	<button type="submit" > 가입하기 </button>
	<br><br>
	<p id="p1">이미 계정이 있으신가요? <a href="/pickme/views/user/UserLoginForm.jsp">로그인</a></p>

	<br>
	<!--
	<a href="/pickme/views/user/UserIdSearchForm.jsp">아이디 찾기</a>
	/
	<a href="/pickme/views/user/UserPassSearchForm.jsp">비밀번호 찾기</a>
	-->
	</div>

	
</form>


<br>

</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>