<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>
<title>회원가입</title>
<style>
	.outer{
		width : auto;
		height : auto;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	.form_field{
		width : 300px;
	}
	
	.form_label{
		align : ;
	}
	
	.error_next_box{
		color : red;
		font-size : 10px;
	}
	
	#p1{
	 color : grey;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="outer col-xs-12 col-sm-8 col-md-6 col-lg-4 pm-input-form">
<br>
<h2 align = "center"> 회원가입 </h2>
<br />
<form id = "joinform" action="/pickme/userJoin.au" method="post">

	<div class="col-md-12" align="center">
		<div class = "form_field form-group">
			<div class = "form_input" style="width:300px">
				<input placeholder="아이디" type="text" name="userId" id ="userId" class="form-control" required="required" maxlength="20" >
				<span class="error_next_box" id="idMsg" style="display:none" role="alert"></span>
			</div>
		</div>
		<div class = "form_field form-group">
			<div class="form_input" style="width:300px">
				<input placeholder="비밀번호" type="password" class="form-control" id="userPwd" name="userPass" required="required" aria-describedby="pswd1Msg" maxlength="20">
				<span class="error_next_box" id="pswd1Msg" style="display:none" role="alert">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>			
			</div>
		</div>
		<div class = "form_field form-group">
			<div class="form_input" style="width:300px">
				<input placeholder="비밀번호" type="password" class="form-control" id="userPwd2" name="userPass2" required="required" aria-describedby="pswd1Msg" maxlength="20">			
			</div>
			<div>
				<span class="error_next_box" id="pswd2Msg" style="display:none" role="alert"></span>
			</div>
		</div>
		<div class = "form_field form-group">
			<div class="form_input" style="width:300px">
				<input placeholder="이름" type="text" class="form-control" maxlength="5" id="userName" name="userName" required="required" >
				<span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span>			
			</div>
		</div>
		<div class = "form_field form-group">
			<div class="form_input" style="width:300px">
				<input placeholder="이메일" type="email" class="form-control" id="userEmail" name="userEmail" required="required" >
				<span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span>			
			</div>
		</div>
	</div>
	<br />
	<div class="btns" align="center">
	<button type="button" id= "btnJoin" class="btn btn-primary" > 가입하기 </button>
	<div class="row">
		<p class="col text-center">가입하면 Pickme의 <strong><a href="#" data-toggle="modal" data-target="#modal2">약관</a></strong>에 동의하게 됩니다.</p>
	</div>
	<br><br>
	<p id="p1">이미 계정이 있으신가요? <a href="/pickme/views/user/UserLoginForm.jsp">로그인</a></p>

</form>

</div>


<!-- Modal -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="joinConfirmBtn">확인</button>
        <button type="button" class="btn btn-primary" id="reportYesBtn">예</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="joinSuccessModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	회원가입완료
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="joinYesBtn">확인</button>
      </div>
    </div>
  </div>
</div>

<script>
		//회원가입 유효성 검사
		var idFlag = false;
		var pwFlag = false;
		var pw2Flag = false;
		var nameFlag = false;
		var emailFlag = false;
		
		$(document).ready(function(){
			
			$("#userId").blur(function() {
	            idFlag = false;
	            checkId();
	        });
	        $("#userPwd").blur(function() {
	            checkPswd1();
	        });
	        $("#userPwd2").blur(function() {
	            checkPswd2();
	        });
	        $("#userName").blur(function() {
	            checkName();
	        });
			
	        $("#userEmail").blur(function() {
	            checkEmail();
	        });
			
	        
			
		});
		//아이디 체크
		function checkId(){
			
			var id = $("#userId").val();
			var oMsg = $("#idMsg");
			
			if (id == ""){
		       showErrorMsg(oMsg,"필수 정보입니다.","red");
		       return false;  
			}else{
				hideMsg(oMsg);
				idFlag = true;
			}
			
			//아이디 정규식
			var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	        if (!isID.test(id)) {
	            showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.","red");
	            idFlag=false;
	            return false;
	            
	        }
	        
	        //아이디 중복확인
	        $.ajax({
				url : "/pickme/idDup.au",
				type : "post",
				data : { userId : $('#userId').val() },
				success : function(data){
					console.log(data);
					if(data == 'no'){
						showErrorMsg(oMsg,"이미 사용하고있는 아이디 입니다.","red");
						$('#userId').select();
						idFlag = false; 
					} else {
						showErrorMsg(oMsg,"사용 가능한 아이디 입니다.","green");
						idFlag=true;
					}
					
					
				}, error : function(request, status, error){
					modal(request+"\n" 
						  + status+"\n"
						  + error);
					console.log("에러 발생!");
					
				}
				
			});
	        return true;
			
			
		}
		// 비밀번호 체크
		function checkPswd1() {
			var pwd = $("#userPwd").val();
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
			var pwd1 = $("#userPwd");
			var pwd2 = $("#userPwd2");
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
		
		// 이름 체크
		function checkName(){
			var oMsg = $("#nameMsg");
			var nonchar = /[^가-힣a-zA-Z]/gi;
			var name = $("#userName").val();
			
			
	        if (name == "") {
	            showErrorMsg(oMsg,"필수 정보입니다.","red");
	            nameFlag = false;
	            return false;
	        }
	        if (name != "" && nonchar.test(name)) {
	            showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)","red");
	            nameFlag = false;
	            return false;
	        }
	        hideMsg(oMsg);
	        nameFlag = true;
	        return true;
	    
		}
		
		// 이메일 체크
		function checkEmail() {
	        var email = $("#userEmail").val();
	        var oMsg = $("#emailMsg");
	        if (email == "") {
	        	showErrorMsg(oMsg,"필수 정보입니다.","red");
	            emailFlag = false;
	            return true;
	        }
		
	        // 이메일 정규식
	        var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	        var isHan = /[ㄱ-ㅎ가-힣]/g;
	        if (!isEmail.test(email) || isHan.test(email)) {
	            showErrorMsg(oMsg,"이메일 주소를 다시 확인해주세요.","red");
	            emailFlag = false;
	            return false;
	        }
	        
	      //이메일 중복확인
	        $.ajax({
				url : "/pickme/emailDup.au",
				type : "post",
				data : { userEmail : $('#userEmail').val() },
				success : function(data){
					if(data == 'no'){
						showErrorMsg(oMsg,"이미 사용하고있는 이메일주소 입니다.","red");
						$('#userId').select();
						emailFlag = false; 
					} else {
						showErrorMsg(oMsg,"사용 가능한 이메일 주소 입니다.","green");
						emailFlag=true;
					}
					
					
				}, error : function(request, status, error){
					modal(request+"\n" 
						  + status+"\n"
						  + error);
					console.log("에러 발생!");
					
				}
				
			});
	        
	        hideMsg(oMsg);
	        emailFlag = true;
	        
	        
	        return true;
	    }
		
		// 에러메시지 함수 표출
		function showErrorMsg(obj, msg, color) {
			//obj.attr("style","color:"+ color);
	        obj.attr("style", "display:; color :" + color);
	        obj.html(msg);
	        obj.show();
	    }
		
		// 메시지 숨김(맞을때)
		function hideMsg(obj){
			obj.attr("style","display:none");
		}
		
		//가입하기 버튼 클릭시
		$("#btnJoin").click(function(){
			
			if(!idFlag){
				$("#userId").focus();
				modal("아이디를 정확하게 입력해주세요.");
			}
			else if(!pwFlag){
				$("#userPwd").focus();
				modal("비밀번호를 정확하게 입력해주세요.");
			}
			else if(!pw2Flag){
				$("#userPwd2").focus();
				modal("비밀번호와 확인이 일치하지 않습니다.");
			}
			else if(!nameFlag){
				$("#userName").focus();
				modal("이름을 정확하게 입력해주세요.");
			}
			else if(!emailFlag){
				$("#userEmail").focus();
				modal("이메일을 정확하게 입력해주세요.")
			}else{
				insertMember();
			}
			
		});
		
		function insertMember() {
			$("#joinSuccessModal").modal();
		}
		
		function joinSubmit(){
			$("#joinform").submit();
		}
		
		function modal(message){
			$(".modal-body").text(message);
			$("#joinModal").modal();
		}
		
		$("#joinYesBtn").on('click', function(){
			joinSubmit();
		});
	
</script>
</div>
<%@ include file="../common/footer.jsp" %>


</body>
</html>