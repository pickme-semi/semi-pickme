<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
<title>회원가입_[Pick Me]</title>
<style>
	.outer{
		width : 600px;
		height : 300px;
		background : mistyrose;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	.error_next_box{
		color : red;
		font-size : 10px;
	}
	
	#p1{
	 color : grey;
	}
	
	.outer2{
		width : 600px;
		height : 300px;
		background : darkgray;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}

</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div class = "outer">
<br>
<h2 align = "center"> 회원 정보 수정 </h2>
<br />
<form id = "joinform"  method="post">
	<table align="center">
	<tr>
		<td width="120px"> 아이디 </td>
		<td>
		<input type="text" name="userId" id ="userId" class="int" required="required" maxlength="20"></td>
		<td><!--   <button id="idCheck"> 중복확인</button> --></td>
	</tr>
	<tr>
		<td></td>
		<td><span class= "error_next_box" id="idMsg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 비밀번호 </td>
		<td><input type="password" id="userPwd" name="userPass" required="required" aria-describedby="pswd1Msg" maxlength="20"></td>
		<td>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><span class= "error_next_box" id="pswd1Msg" style="display:none" role="alert">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span></td>
	</tr>
	<tr>
		<td> 비밀번호 확인 </td>
		<td><input type="password" id="userPwd2" name="userPass2" ></td>
		<td><label id="pwdResult"></label></td>
	</tr>
	<tr>
		<td></td>
		<td><span class="error_next_box" id="pswd2Msg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 이름 </td>
		<td><input type="text" maxlength="5" id="userName" name="userName" required="required" ></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 이메일 <br /></td>
		<td><input type="email" id="userEmail" name="userEmail" required="required" ></td>
		<td></td>
	</tr>
	</table>
</form>
</div>
<div class = "outer2">
<h2 align = "center"> 추가 정보 입력 </h2>
<br />
<form id = "joinUpForm"  method="post">
	<table align="center">
	<tr>
		<td> 성별 <br /></td>
	
		<td><input type="checkbox" id="usesrGender" name="usesrGender">남
			<input type="checkbox" id="usesrGender" name="usesrGender">여</td>
		<td></td>
	</tr>
	<tr>
		<td> 나이 <br /></td>
		<td><input type="date" id="usesrBirth" name="usesrBirth"></td>
		<td></td>
	</tr>
	<tr>
		<td> 관심 분야 <br /></td>
		<td><span></span></td>
		<td><select class="js-example-basic-multiple" name="states[]" multiple="multiple">
  		<option value="AL">Alabama</option>
  		<option value="WY">Wyoming</option>
		</select></td>
	</tr>
	
	</table>
</form>

</div>

<script>

$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});

</script>

</body>

</html>