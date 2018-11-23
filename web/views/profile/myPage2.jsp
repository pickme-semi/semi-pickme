<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경 페이지</title>
<style>

	.nav>li>a{
	
		font-size: 12px;
	    color: black;
	    text-transform: uppercase;
	    text-decoration: none;
	    margin: 0 15px;
	
	}
	.outer {
		margin-top : 50px;
		margin-left : 250px;
		margin-right : 250px;
	}
	.content {
		display: table;
  		margin-left: auto;
  		margin-right: auto;
		color : red;
		margin : auto auto;
		font-size : 12px;
	}
	#pwdResult {
		font-size : 10px;
	}
	.nav>li>a.active {
	
		border-bottom:5px solid pink;
		
	}
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
		<ul class="nav justify-content-center alert alert-light">
	  <li class="nav-item">
	    <a class="nav-link1 alert-link" href="/pickme/mPage.pr">회원정보 수정</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link2 active alert-link" href="/pickme/mPage2.pr">비밀번호 변경</a>
	  </li>
	  </ul>
	<hr />
	<% if( user != null) { %>
<div class = "outer pm-section">
<h2 align = "center"> 비밀번호 변경  </h2>
<br />
<ul class="content">
<li>다른 아이디/사이트에서 사용한 적 없는 비밀번호</li>	
<li>이전에 사용한 적 없는 비밀번호가 안전합니다.</li>	
</ul>		
<br />

<form id = "updateform"  method="post" action="<%= request.getContextPath() %>/mPageUpdate2.au?uno=<%=user.getUserNo() %>">
	<table align="center">
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="password" class="form-control" id="userPwd" name="userPass" placeholder="새 비밀번호"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="password" class="form-control" id="userPwd2" name="userPass2" placeholder="새 비밀번호 확인"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><label id="pwdResult"></label></td>
		<td></td>
	</tr>
	</table>
	</form>
	</div>
	<br />
		<div align="center">
			<button onclick="uComplete();" class="btn btn-primary">수정 완료</button>
			<button onclick="uDelete();" class="btn btn-danger">회원 탈퇴</button>
		</div>
	<br />

	
	
<% } else {
		request.setAttribute("msg", "회원만 가능한 서비스 입니다.");
		request.getRequestDispatcher("../views/common/errorPage.jsp").forward(request, response);
	}
	%>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
	
	var pwFlag = true;
	var pw2Flag = true;
	
	
	$(document).ready(function(){
		
        $("#userPwd").blur(function() {
            checkPswd1();
        });

        $("#userPwd2").blur(function() {
            checkPswd2();
        });

    });
		
	function checkPswd1() {
		var pwd = $("#userPwd").val();
		var oMsg = $("#pwdResult");
		console.log(pwFlag);
		
        // 비밀번호 정규식
        var isPwd = /^[A-Za-z0-9_-]{6,18}$/;   
          if(!isPwd.test(pwd)){
             showErrorMsg(oMsg,"5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.","red")
             pwFlag=false;
          }else{
        	  hideMsg(oMsg);
        	  pwFlag=true;
          }
          
          
          
       }
	// 비밀번호 확인
	function checkPswd2(){
		var pwd1 = $("#userPwd");
		var pwd2 = $("#userPwd2");
		var oMsg = $("#pwdResult");
		
		console.log(pw2Flag);
		
        if (pwd1.val() != pwd2.val()) {
            showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.","red");
            pwd2.val("");
            pw2Flag = false;
        } else {
            hideMsg(oMsg);
            pw2Flag = true;
        }
		
	}
	
	/* 수정완료 시 servlet으로 가는 메소드 */
	function uComplete(){
		
		var pwd1 = $("#userPwd");
		var pwd2 = $("#userPwd2");
		var oMsg = $("#pwdResult");
			
			if(pwd1.val() =="" && pwd2.val() ==""){
				 showErrorMsg(oMsg,"비밀번호를 입력해주세요.","red");
		         pw2Flag = false;
			}
			else if(pwd1.val()!="" && pwd2.val()!="")
				{
				if(!pwFlag){
				alert("비밀번호를 형식에 맞게 입력해주세요.");
				}else if(!pw2Flag){
				alert("비밀번호와 확인 값이 일치하지 않습니다.")
				}else{
					$('#updateform').submit();
				}
			}
			else{
				$('#updateform').submit();	
			}
			
			
	}
	
	/* 회원 탈퇴 시 servlet으로 가는 메소드 */
	function uDelete(){
		var pwd1 = $("#userPwd");
		var pwd2 = $("#userPwd2");
		var oMsg = $("#pwdResult");
		
        if (pwd1.val() == "" && pwd2.val() == "") {
            showErrorMsg(oMsg,"비밀번호를 입력해주세요.","red");
            pwd2.val("");
            pw2Flag = false;
        } else {
            hideMsg(oMsg);
            pw2Flag = true;
            location.href = "/pickme/uDelete.pr?uno=<%=user.getUserNo() %>";
        }
	}
	
	function showErrorMsg(obj, msg, color) {
		//obj.attr("style","color:"+ color);
        obj.attr("style", "display:; color :" + color);
        obj.html(msg);
        obj.show();
    }
	
	
	
	
	
	</script>
</body>
</html>