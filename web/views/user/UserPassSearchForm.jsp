<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기_[Pick Me]</title>
<style>
	.outer{
		width : 500px;
		height : 400px;
		background : mistyrose;
		padding : 10px;
		margin-left : auto;
		margin-right : auto;
		margin-top : 50px;
	}
	
	#p1{
		
		color: darkgrey;
	}

</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div class="outer">
<br />
<h2 align="center"> 비밀번호 찾기 </h2>
<br />
<form action="/pickme/passSearch.au" method="post">
	<table align="center">
	<tr>
		<td width="70px"> 아이디 </td>
		<td><input type="text" name="userId" id ="userId" required="required" ></td>
		<td></td>
	</tr>
	<tr>
		<td> 이메일</td>
		<td><input type="text" name="userEmail"></td>
		<td><button>발송</button></td>
	</tr>
	<tr>
		<td>인증코드</td>
		<td><input type="text" name="userAuCode"> </td>
		<td><button>확인</button></td>
	</tr>
	</table>
	<br />
	<div class="btndiv" align="center">
		<button type="submit" >비밀번호 재발급</button>
		<br><br>
		
		<p id="p1">아이디가 기억나지 않으신가요? <a href="/pickme/views/user/UserIdSearchForm.jsp">아이디 찾기</a></p>
		
		
		<a href="/pickme/views/user/UserLoginForm.jsp">로그인</a>
		/
		<a href="/pickme/views/user/UserTerms.jsp">회원가입</a>
	</div>
</form>




</div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>