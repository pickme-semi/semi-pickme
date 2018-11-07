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
		<td><input type="password" id="userPwd" name="userPass" required="required" aria-describedby="pswd1Msg" maxlength="20"></td>
		<td><label for="pswd1" class="lbl">
				<span id="pswd1Span" class="step_txt"></span>
			</label>
			 <span class="error_next_box" id="pswd1Msg" style="display:none" role="alert">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>
		</td>
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
	
	</div>

	
</form>


<br>

</div>

<script>
		var idFlag = false;
		var pwFlag = false;
		

		function insertMember() {
			$("#joinform").submit();
		}
		
		$("#joinform").submit(function(event){
			if(/*$("#userPwd").val() == "" ||*/ $("#userId").val() == "") alert("아이디나 비밀번호는 필수 값입니다.");
			else if($("#userPwd").val() != $("#userPwd2").val()) alert("비밀번호 확인 값과 다릅니다.");
			else return;
			event.preventDefault();
		});
		
		$("#userPwd").blur(function(){
			checkPswd1();
		});
		
		
		 function checkPswd1() {
			 if($("#userPwd").val().length < 8)
				 alert("비밀번호는 8자리 이상 입력하여야 합니다.")
			 else if()
		 }
		

		
		
		$('#idCheck').click(function(){
			
			$.ajax({
				url : "/pickme/idDup.au",
				type : "post",
				data : { userId : $('#userId').val() },
				success : function(data){
					console.log(data);
					if(data == 'no'){
						alert("이미 사용중인 아이디 입니다.");
						$('#userId').select();
					} else {
						alert("사용 가능한 아이디 입니다.");
					}
					
					
				}, error : function(request, status, error){
					alert(request+"\n" 
						  + status+"\n"
						  + error);
					console.log("에러 발생!");
					
				}
				
			});
			
		});

</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>