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
		width : auto;
		height : auto;
		margin-left:auto;
		margin-right:auto;
		margin-top:100px;
		margin-bottom:100px;
	
	}
	
	.form_input{
		width : 300px;
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
<div class="col-xs-12 col-md-8 pm-section">
<div class = "outer">
<br>
<h2 align = "center"> 로그인 </h2>

<br />

<form id="loginform" action="/pickme/login.au" method="post">
	<div align = "center">
	<div class = "form_field">
		<div class = "form_input">
			<input name="userId"  class="form-control" id="userId" type="text" placeholder="아이디" >
		</div>
		<div>
			<span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>
		</div>
	</div>
	<div class = "form_field">
		<div class="form_input">
			<input name="userPass" class="form-control" id="userPwd" type="password" placeholder="비밀번호" >
		</div>
		<div>
			<span class="error_next_box" id="pwdMsg" style="display:none" role="alert"></span>
		</div>
		
	</div>
	</div>
	
	<div align ="center"><span class="error_next_box" id = loginMsg style="display:none" role="alert"></span></div>
	<br>
	<div class="btns" align="center">
	<button type="button" id="loginBtn" value="로그인" class="btn btn-primary">로그인</button>
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
	// 로그인 된 상태에서 메인에 접근할때
    $(function(){
    	<% if(user != null){%>
    		location.href = "/pickme/pickmain.pm";
    	<% } %>
    });
    
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
		
		if(id !="" && pwd!=""){
		$.ajax({
			url:"/pickme/login.au",
			type : "post",
			data : {userId : $('#userId').val(),
					userPass : $('#userPwd').val()
			},
			success : function(data){
				if(data=="fail"){
					showErrorMsg($("#loginMsg"),"해당하는 아이디가 없거나 비밀번호가 일치하지 않습니다.")
					$("#userPwd").val("");
				}else{
					login();
				}
			}, error : function(request, status, error){
				alert(request+"\n" 
						  + status+"\n"
						  + error);
					console.log("에러 발생!");
					
				}
			
			
		});
		}
		
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

</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>