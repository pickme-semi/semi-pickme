<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>

<link rel="preload" href="/pickme/resources/css/swell.css" as="style" onload="this.rel='stylesheet'">

<title>로그인_[Pick Me]</title>
<style>
	.outer{
		width : auto;
		height : auto;
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
	
	.login-bg{
		background-image: url(/pickme/resources/images/bg/login-bg-img.jpg);
		background-position: center center;
		background-size: cover;
		min-height: 100vh;
		overflow: hidden;
		position: absolute;
		width: 100%;
	}
	
	.login-bg-2{
		background-image: url(/pickme/resources/images/bg/login2.jpeg);
		background-position: center center;
		background-size: cover;
		min-height: 100vh;
		overflow: hidden;
		position: absolute;
		width: 100%;
	}
	
	.login-top-p{
		margin-left:200px;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
	}
	
	
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="outer col-xs-12 col-sm-12 col-md-12 col-lg-12 pm-section">

<div class="row">
	<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12 log.in-bg "  style="height:300px;">
	<div class="hero @@hero">
	<div class="hero__slogan">
	<div>What is the best</div>
	<div>
	<div class="hero__slogan__words">
	<ul class="hero__slogan__words__list">
	<li>photo?</li>
	<li>outfit?</li>
	<li>design?</li>
	<li>food?</li>
	</ul>
	</div>
	</div>
	</div>
	</div>
		<p class="login-top-p"></p>
	</div>
</div>

<div class="row">
	<div class="col pm-input-form col-xs-12 col-sm-6 col-md-6 col-lg-7" style="background: #ff82bb;">
			<div id="infomain" style="margin-top:auto;margin-bottom:auto" align="center">
				
				<section class="page-section page-section--vote">
				<div class="page-section__content">
				<header class="page-section__header">
				<h2 class="page-section__header__title page-section__header__title--vote">Try it!</h2>
				<p class="page-section__header__slogan">
				1. 자신이 관심있는 카테고리를 선택한다. <br />
				2. 두개의 사진 중에 마음에 드는 사진을 고른다.</p>
				</header>
				<div class="live-swell" style="">
				<div class="live-swell__pics">
				<div id="live-swell-img-a" class="live-swell__pics__pic live-swell__pics__pic--a">
				</div>
				<div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b">
				</div>
				<div class="live-swell__results">
				<div id="live-swell-result-a" class="live-swell__results__result live-swell__results__result--a option option-a">
				43%</div>
				<div id="live-swell-result-b" class="live-swell__results__result live-swell__results__result--b option option-b">
				57%</div>
				</div>
				<div class="live-swell__pics__or">
				or</div>
				</div>
				<ul class="live-swell__categories">
				<li class="live-swell__categories__item food" data-category="food" data-option-a-img="/img/live-swells/food-a-604e817829.jpg" data-option-a-votes="43%" data-option-b-img="/img/live-swells/food-b-d1adfeb4ca.jpg" data-option-b-votes="57%">
				<img src="/pickme/resources/images/food.png" alt="Food">
				</li>
				<li class="live-swell__categories__item tech" data-category="tech" data-option-a-img="/img/live-swells/tech-a-44c50d38a2.jpg" data-option-a-votes="34%" data-option-b-img="/img/live-swells/tech-b-33372a730b.jpg" data-option-b-votes="66%">
				<img src="/pickme/resources/images/tech.png" alt="Tech"></li></ul><ul class="live-swell__categories">
				<li class="live-swell__categories__item fashion" data-category="fashion" data-option-a-img="/img/live-swells/fashion-a-6563c65cb4.jpg" data-option-a-votes="48%" data-option-b-img="/img/live-swells/fashion-b-de4475b09f.jpg" data-option-b-votes="52%">
				<img src="/pickme/resources/images/fashion.png" alt="Fashion">
				</li>
				<li class="live-swell__categories__item travel" data-category="travel" data-option-a-img="/img/live-swells/travel-a-595c9f7bd4.jpg" data-option-a-votes="58%" data-option-b-img="/img/live-swells/travel-b-acced80c5b.jpg" data-option-b-votes="42%">
				<img src="/pickme/resources/images/travel.png" alt="Travel">
				</li>
				</ul>
				</div>
				</div>
				</section>
				
			</div>
		
	</div>
	
	<div class="col pm-input-form col-xs-12 col-sm-6 col-md-6 col-lg-5 pm-input-form">
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
	<p id="p1">아직 계정이 없으신가요? <a href="/pickme/views/user/UserJoinForm.jsp">회원가입</a></p>

	<br>
	
	<a href="/pickme/views/user/UserIdSearchForm.jsp">아이디 찾기</a>
	/
	<a href="/pickme/views/user/UserPassSearchForm.jsp">비밀번호 찾기</a>
	
	</div>
	
</form>
</div>
</div>

<div class="row">
	<div id="infodev" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12 login-bg-2" style="height:600px; background-color: beige" >
		
	</div>
</div>

<div class="row">
	<div id="infopickme" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background:green;height:600px" >
		
	</div>
</div>
<br><br>
	<script type="text/javascript">
	var slogan = document.querySelector('.hero__slogan div:nth-child(1)');
	  var sloganList = document.querySelector('.hero__slogan__words__list');
	  window.setInterval(function () {
	    var height = slogan.offsetHeight;
	    var top = sloganList.style.top ? parseInt(sloganList.style.top.replace('px', '')) - height : 0;
	    if (top <= (-4 * height)) {
	      top = 0;
	    }
	    sloganList.style.top = top + 'px';
	  }, 1500);
	</script>
<script>

	// 디자인
	$(function(){
		
		$('#live-swell-img-a').attr("style","background-image: url(/pickme/resources/images/sushi.jpg)");
		$('#live-swell-img-b').attr("style","background-image: url(/pickme/resources/images/chicken.png)");
		
		$('#live-swell-result-a').click(function(){
			
		});
		
		$('#live-swell-result-b').click(function(){
		
		});
	});
	
	$('.food').click(function(){
		
		$('#live-swell-img-a').attr("style","background-image: url(/pickme/resources/images/sushi.jpg)");
		$('#live-swell-img-b').attr("style","background-image: url(/pickme/resources/images/chicken.png)");
		
		$('#live-swell-result-a').click(function(){
			
		});
		
		$('#live-swell-result-b').click(function(){
			
		});
	
	});
	
	
	
	$('.tech').click(function(){
		$('#live-swell-img-a').attr("style","background-image: url(/pickme/resources/images/iphone.jpg)");
		$('#live-swell-img-b').attr("style","background-image: url(/pickme/resources/images/galaxy.jpg)");
		
		$('#live-swell-result-a').click(function(){
		
		});
		
		$('#live-swell-result-b').click(function(){
			
		});
	});
	
	$('.fashion').click(function(){
		$('#live-swell-img-a').attr("style","background-image: url(/pickme/resources/images/1.jpg)");
		$('#live-swell-img-b').attr("style","background-image: url(/pickme/resources/images/2.jpg)");
		
		$('#live-swell-result-a').click(function(){
			
		});
		
		$('#live-swell-result-b').click(function(){
			
		});
		
	});
	
	$('.travel').click(function(){
		$('#live-swell-img-a').attr("style","background-image: url(/pickme/resources/images/11.jpg)");
		$('#live-swell-img-b').attr("style","background-image: url(/pickme/resources/images/22.jpg)");
		
		$('#live-swell-result-a').click(function(){
			
		});
		
		$('#live-swell-result-b').click(function(){
			
		});
	});
	
	
	
	
	
	
	
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