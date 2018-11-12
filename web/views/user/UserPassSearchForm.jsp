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
<form id="passSearch" action="/pickme/passSearch.au" method="post">
	<table align="center">
	<tr>
		<td width="70px"> 아이디 </td>
		<td><input type="text" name="userId" id ="userId" required="required" ></td>
		<td></td>
	</tr>
	<tr>
		<td> 이메일</td>
		<td><input type="text" name="userEmail" id="userEmail" required="required"></td>
		<td><button type="button" id="sendAuCode">발송</button></td>
	</tr>
	<tr>
		<td>인증코드</td>
		<td><input type="text" name="userAuCode" id="sendCode"> </td>
		<td><button type="button" id="checkCode">확인</button></td>
		
	</tr>
	</table>
	<br />
	<div class="btndiv" align="center">
		<button type="button" id="reissuePass">비밀번호 재설정</button>
		<br><br>
		
		<p id="p1">아이디가 기억나지 않으신가요? <a href="/pickme/views/user/UserIdSearchForm.jsp">아이디 찾기</a></p>
		
		
		<a href="/pickme/views/user/UserLoginForm.jsp">로그인</a>
		/
		<a href="/pickme/views/user/UserTerms.jsp">회원가입</a>
	</div>
</form>




</div>
<%@ include file="../common/footer.jsp" %>

<script>
	$("#sendAuCode").click(function(){
		$.ajax({
			url : "/pickme/passSearch.au",
			type : "post",
			data : {userId : $('#userId').val(),
				   userEmail : $('#userEmail').val()},
			success : function(data){
				if(data == "fail"){
					alert("아이디와 이메일이 일치하지 않습니다.");
				} else{
					$.ajax({
						url:"/pickme/sendmail.do",
						type : "post",
						data : {userEmail : $('#userEmail').val()
							
						},
						success : function(data){
							console.log(data);
							if(data=="true"){
								alert("이메일 발송 성공");
							}else{
								alert("실패");
							}
						}, error : function(request, status, error){
							alert(request+"\n" 
									  + status+"\n"
									  + error);
								console.log("에러 발생!");
								
							}
						
					});
				}
			}, error : function(request, status, error){
				alert(request+"\n" 
						  + status+"\n"
						  + error);
					console.log("에러 발생!");
					
				}
			
		});
	});
	//이거 다시 false로 꼭 바꿔주기~~~!
	var issueFlag = true;
	$("#checkCode").click(function(){
			
		$.ajax({
			url : "/pickme/reissue.au",
			type : "post",
			data : {
				userEmail : $('#userEmail').val(),
				code : $('#sendCode').val()
			},
			success : function(data){
				if(data=="true"){
				alert("인증에 성공하였습니다.");
				issueFlag = true;
				}else{
					alert("인증에 실패하였습니다. 인증코드를 다시 확인해 주세요.");
				}
			}
		});
	});
	
	$("#reissuePass").click(function(){
		if(issueFlag){
			location.href="/pickme/repassVeiw.au?id=" + $("#userId").val();
		}else{
			alert("인증을 완료해주세요");
		}
		
		
		
		
	});
</script>

</body>
</html>