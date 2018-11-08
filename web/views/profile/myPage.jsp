<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- select2 소스  -->

<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<title>회원 정보 수정 페이지</title>
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
		<td id ="userId" ><%= user.getUserId() %></td>
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
		<td id="userName"><%= user.getUserName() %></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 이메일 <br /></td>
		<td><input type="email" id="userEmail" name="userEmail" required="required" value="<%= user.getUserEmail()%>"/></td>
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
	
		<td><input type="checkbox" name="gender" id="male" value="male">남
			<input type="checkbox" name="gender" id="female" value="Female">여</td>
		<td></td>
	</tr>
	<tr>
		<td> 나이 <br /></td>
		<td><input type="date" id="usesrBirth" name="usesrBirth"></td>
		<td></td>
	</tr>
	<tr>
		<td> 관심 분야 <br /></td>
		<td>
		<select class="interest-multiple" name="interests[]" data-placeholder="Select an option" multiple="multiple">
  		<optgroup label="travel">
  			<option value="japan">Japan</option>
  			<option value="korea">Korea</option>
  			<option value="US">US</option>
  		</optgroup>
  		<optgroup label="workout">Work Out
  			<option value="Running">Running</option>
  			<option value="yoga">Yoga</option>
  			<option value="hiking">hiking</option>
  		</optgroup>
		</select>
		</td>
		<td></td>
	</tr>
	
	</table>
</form>

</div>


<script>

	$(document).ready(function() {
		
    $('.interest-multiple').select2();
    
});

</script>



</body>

</html>