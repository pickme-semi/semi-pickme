<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기_[Pick Me]</title>
<style>
	.outer{
		width : auto;
		height : auto ;
		background : ;
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

<div class="outer col-xs-12 col-md-6 col-sm-8 col-lg-4 pm-input-form" align="center">
<br />
<h2 align="center"> 비밀번호 찾기 </h2>
<br />
<form id="passSearch" action="/pickme/passSearch.au" method="post">
	<table align="center">
	<tr>
		<td><input placeholder="아이디" class="form-control"  type="text" name="userId" id ="userId" required="required" ></td>
		<td></td>
	</tr>
	
	<tr>
		<td><input placeholder="이메일" class="form-control" type="text" name="userEmail" id="userEmail" required="required"></td>
		<td><button type="button" id="sendAuCode" class="btn btn-primary">발송</button></td>
	</tr>
	<tr>
		<td><input placeholder="인증코드" class="form-control"  type="text" name="userAuCode" id="sendCode"> </td>
		<td><button type="button" id="checkCode" class="btn btn-primary">확인</button></td>
		
	</tr>
	</table>
	<br />
	<div class="btndiv" align="center">
		<button type="button" id="reissuePass" class="btn btn-primary">비밀번호 재설정</button>
		<br><br>
		
		<p id="p1">아이디가 기억나지 않으신가요? <a href="/pickme/views/user/UserIdSearchForm.jsp">아이디 찾기</a></p>
		
		
		<a href="/pickme/views/user/UserLoginForm.jsp">로그인</a>
		/
		<a href="/pickme/views/user/UserTerms.jsp">회원가입</a>
	</div>
</form>




</div>
<%@ include file="../common/footer.jsp" %>


<!-- Modal -->
<div class="modal fade" id="passSearchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="passSearchBtn">확인</button>
      </div>
    </div>
  </div>
</div>

<script>
	function modal(message){
		$(".modal-body").text(message);
		$("#passSearchModal").modal();
	}
	$("#sendAuCode").click(function(){
		$.ajax({
			url : "/pickme/passSearch.au",
			type : "post",
			data : {userId : $('#userId').val(),
				   userEmail : $('#userEmail').val()},
			success : function(data){
				if(data == "fail"){
					modal("아이디와 이메일이 일치하지 않습니다.");
				} else{
					$.ajax({
						url:"/pickme/sendmail.do",
						type : "post",
						data : {userEmail : $('#userEmail').val()
							
						},
						success : function(data){
							console.log(data);
							if(data=="true"){
								modal("이메일 발송 성공");
							}else{
								modal("실패");
							}
						}, error : function(request, status, error){
							modal(request+"\n" 
									  + status+"\n"
									  + error);
								console.log("에러 발생!");
								
							}
						
					});
				}
			}, error : function(request, status, error){
				modal(request+"\n" 
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
				modal("인증에 성공하였습니다.");
				issueFlag = true;
				}else{
					modal("인증에 실패하였습니다. 인증코드를 다시 확인해 주세요.");
				}
			}
		});
	});
	
	$("#reissuePass").click(function(){
		if(issueFlag){
			location.href="/pickme/repassVeiw.au?id=" + $("#userId").val();
		}else{
			modal("인증을 완료해주세요");
		}
		
	});
</script>

</body>
</html>