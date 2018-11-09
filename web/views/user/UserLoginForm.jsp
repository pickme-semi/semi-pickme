<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
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
	
	.error_next_box{
		color : red;
		font-size : 10px;
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
			<td><input name="userId" id="userId" type="text" placeholder="아이디"></td>
		</tr>
		<tr>
			<td><span class="error_next_box" id="idMsg" style="display:none" role="alert"></span></td>
		</tr>
		<tr>
			<td><input name="userPass" id="userPwd" type="password" placeholder="비밀번호" ></td>
		</tr>
		<tr>
			<td><span class="error_next_box" id="pwdMsg" style="display:none" role="alert"></span></td>
		</tr>
		<tr>
			<td><span class="error_next_box" id="loginfail" style="display:none" role="alert"></span></td>
		</tr>
	</table>
	<br>
	<div class="btns" align="center">
	<button type="button" id="loginBtn" value="로그인">로그인</button>
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
<script>
	$("#userPwd").keypress(function(e){
		if(e.which==13){
			$("#loginBtn").click();
		}
	})
	
	
	
	$("#loginBtn").click(function(){
		var id = $("#userId").val();
		var pwd = $("#userPwd").val();
		var idMsg = $("#idMsg");
		var pwdMsg = $("#pwdMsg");
		var idFlag = false;
		var pwdFlag = false;
		
		if(id == ""){
			idFlag = false;
			showErrorMsg(idMsg,"아이디를 입력해주세요.");
			
		}else{
			idFlag = true;
			hide(idMsg);
		}
		if(pwd ==""){
			pwdFlag = false;
			showErrorMsg(pwdMsg,"비밀번호를 입력해주세요.");
		}else{
			pwdFlag = true;
			hide(pwdMsg);
		}
		
		if(id !="" && pwd !="")
			login();
		
	});
	
	function login(){
		$("#loginform").submit();
	}
	
	function showErrorMsg(obj, msg) {
        obj.attr("style", "display:");
        obj.html(msg);
        obj.show();
    }
	
	function hide(obj){
		obj.attr("style","display:none");
	}
</script>


<%@ include file="../common/footer.jsp" %>
</body>
</html>