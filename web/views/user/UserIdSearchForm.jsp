<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Carousel Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
    
   	<style>
	.outer{
		width : 500px;
		height : 350px;
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
	<form action="/pickme/idSearch.au" method="post">
	<br />
	<h2 align="center"> 아이디 찾기 </h2>
	<br />	
	<table align="center">
		<tr>
			<td>이름</td>
			<td><input type="text" id="userName" name="userName" placeholder="이름"></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td><span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" id="userEmail" name="userEmail" placeholder="이메일"></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td><span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span></td>
		</tr>
	</table>
	<div align="center"><span id = "showId" style="diaplay:none"></span></div>
	<br />
	<div class="btndiv" align="center">
		<button type="button" id="searchId">아이디 찾기</button>
		<br><br>
		<p id="p1">
			비밀번호가 기억나지 않으신가요? <a href="/pickme/views/user/UserPassSearchForm.jsp">비밀번호 찾기</a>
		</p>
		
		
		<a href="/pickme/views/user/UserLoginForm.jsp">로그인</a>
		/
		<a href="/pickme/views/user/UserJoinForm.jsp">가입</a>
	</div>
	
</form>
</div>


<script>

var nameFlag = false;
var emailFlag = false;

$(document).ready(function(){
	
	$("#userName").blur(function() {
        naemFlag = false;
        checkName();
    });
	
    $("#userEmail").blur(function() {
        checkEmail();
    });
	
    
	
});

function checkName(){
	var oMsg = $("#nameMsg");
	var name = $("#userName").val();
	
	
    if (name == "") {
        showMsg(oMsg,"필수 정보입니다.","red");
        nameFlag = false;
    }else{
        hideMsg(oMsg);
        nameFlag = true;	
    }
    
    return true;

}

function checkEmail() {
    var email = $("#userEmail").val();
    var oMsg = $("#emailMsg");

    if (email == "") {
    	showMsg(oMsg,"필수 정보입니다.","red");
        emailFlag = false;
    }else{
    	hideMsg(oMsg);
        emailFlag = true;
    }
    
    return true;
}

$("#searchId").click(function(){
	
	if( emailFlag && nameFlag){
	$.ajax({
		url : "/pickme/idSearch.au",
		type : "post",
		data : {userName : $('#userName').val(),
				userEmail : $('#userEmail').val()},
		success : function(data){
			if(data == "fail"){
				showMsg($("#showId"),"해당하는 아이디가 없습니다.");
			}else{
				showMsg($("#showId"),"해당 정보와 일치하는 아이디는 " + data + "입니다.");
			}
			
		}, error : function(request, status, error){
			alert(request+"\n" 
					  + status+"\n"
					  + error);
				console.log("에러 발생!");
				
			}
	});
	}else{
		alert("값을 정확하게 입력해 주세요.");
	}
	
});

function showMsg(obj, msg) {
    obj.attr("style", "display:");
    obj.html(msg);
    obj.show();
}

function hideMsg(obj){
	obj.attr("style","display:none");
}

</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>