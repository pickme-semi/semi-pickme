<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
	.outer{
		width : 500px;
		height : 300px;
		background : mistyrose;
		padding : 10px;
		margin-left : auto;
		margin-right : auto;
		margin-top : 50px;
	}
	
	.error_next_box{
		color : red;
		font-size : 10px;
	}
	
	#p1{
		
		color: darkgrey;
	}

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class ="outer">
	<br />
	<h2 align ="center">비밀번호 재설정</h2>
	<br>
	<form  id="passReset" action="/pickme/passReset.au" method="post">
	
		<table align = "center">
			<tr>
				<td width="120px"> 새 비밀번호 </td>
				<td><input id="newPass" name = "userPass" type="password" required="required"/></td>
			</tr>
			<tr>
				<td></td>
				<td><span class="error_next_box" id="pswd1Msg" style="display:none" role="alert"></span></td>
			</tr>
			<tr>
				<td> 새 비밀번호 확인 </td>
				<td><input id="newPass2" type="password" required="required"/></td>
			</tr>
			<tr>
				<td></td>
				<td><span class="error_next_box" id="pswd2Msg" style="display:none" role="alert"></span></td>
			</tr>
		</table>
		<br />
		<div class = "btnDiv" align="center">		
		<button type = "button" id= "resetBtn"> 확인 </button>
		</div>
	</form>

</div>

<!-- Modal -->
<div class="modal fade" id="passResetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 재설정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="passResetBtn">확인</button>
      </div>
    </div>
  </div>
</div>

<script>
	function modal(message){
		$(".modal-body").text(message);
		$("#passResetModal").modal();
	}
	var pwFlag = false;
	var pw2Flag = false;
	
	$(document).ready(function(){
		
	    $("#newPass").blur(function() {
	        pwFlag = false;
	        checkPswd1();
	    });
	
	    $("#newPass2").blur(function() {
	        checkPswd2();
	    });
	
	});
	function checkPswd1() {
		var pwd = $("#newPass").val();
		var oMsg = $("#pswd1Msg");
		

		if(pwd==""){
			showErrorMsg(oMsg,"필수 정보 입니다.","red");
			return false;
		}
		
	    // 비밀번호 정규식
	    var isPwd = /^[A-Za-z0-9_-]{6,18}$/;   
	      if(!isPwd.test(pwd)){
	         showErrorMsg(oMsg,"5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.","red")
	         return false;
	      }else{
	    	  hideMsg(oMsg);
	    	  pwFlag=true;
	      }
	  }
// 비밀번호 확인
	function checkPswd2(){
	
		var pwd1 = $("#newPass");
		var pwd2 = $("#newPass2");
		var oMsg = $("#pswd2Msg");
		
		if (pwd2.val() == "") {
	        showErrorMsg(oMsg,"필수 정보입니다.","red");
	        pw2Flag = false;
	        return false;
	    }
	    if (pwd1.val() != pwd2.val()) {
	        showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.","red");
	        pwd2.val("");
	        pw2Flag = false;
	        return false;
	    } else {
	        hideMsg(oMsg);
	        pw2Flag = true;
	        return true;
	    }
	
	    return true;

	}

	function showErrorMsg(obj, msg) {
        obj.attr("style", "display:");
        obj.html(msg);
        obj.show();
    }
	
	function hide(obj){
		obj.attr("style","display:none");
	}

	$("#resetBtn").click(function(){
		if(pwFlag&&pw2Flag){
			
			$("#passReset").submit();
		
		}else{
			modal("비밀번호를 정확하게 입력해주세요.")
		}
	
	});
	
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>