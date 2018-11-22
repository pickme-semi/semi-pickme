<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="com.profile.model.vo.*" %>
<%
	ArrayList<Category> category = (ArrayList<Category>)request.getAttribute("cArr");
 %>
 <%
 	ArrayList<Category> cat = (ArrayList<Category>)request.getAttribute("category");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- select2 소스  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

<title>회원 정보 수정 페이지</title>

<style>
	.outer{
		width : auto;
		height : auto;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	.error_next_box{
		color : red;
		font-size : 10px;
	}
	
	.attr {
		height : 50px;
		position : relative;
		width : 50px;
	}
	
	table tr {
		font-size : 15px;
		
	}
	
	table td{
		padding-bottom: 20px;
	}
	
	.outer2{
		width : 600px;
		height : 350px;
		background : darkgray;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	
	}
	
	.nav>li>a{
	
		font-size: 14px;
	    color: black;
	    text-transform: uppercase;
	    text-decoration: none;
	    margin: 0 15px;
	
	}
	
	.nav>li>a.active {
	
		border-bottom:5px solid #ffb8d8;
		
	}
</style>
</head>
<body>

<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>

<%@ include file="../common/header.jsp" %>
<ul class="nav justify-content-center alert alert-light">
  <li class="nav-item">
    <a class="nav-link1 active alert-link" href="/pickme/mPage.pr">회원정보 수정</a>
  </li>
  <li class="nav-item">
    <a class="nav-link2 alert-link" href="/pickme/mPage2.pr">비밀번호 변경</a>
  </li>
  </ul>
<hr />

<% if( user != null) { %>
<div class = "outer">
<i class="fas fa-reply fa-3x" style="padding-left: 30px;" ></i>
<h2 align = "center" style="font-weight:bold;  ">회원 정보 </h2>
<br />

<form id = "updateform"  method="post" action="<%= request.getContextPath() %>/mPageUpdate.au?uno=<%=user.getUserNo() %>"
encType="multipart/form-data">
	<table align="center" style="font-weight:bold;">
	<tr>
		<td width="120px"> 아이디 </td>
		<td id ="userId" ><%= user.getUserId() %></td>
		<td><!--   <button id="idCheck"> 중복확인</button> --></td>
	</tr>
	
	<tr>
		<td> 이름 </td>
		<td id="userName"><%= user.getUserName() %></td>
		<td></td>
	</tr>
	
	<tr>
		<td> 이메일 <br /></td>
		<td><input type="email" class="form-control" id="userEmail" name="userEmail" onchange="resetEmail();" required="required" value="<%= user.getUserEmail()%>"/></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><span class="error_next_box" id="emailMsg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 프로필 사진 <br /></td>
		<td>
		<% if(user.getProfile() != null) {%>
		  <img id="profileImage" src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr">
		<% } else{ %>
			<img id="profileImage" src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
		<% }%>
		</td>
		<td></td>
				</tr>
	<tr>
		<td> 성별 <br /></td>
	
		<td><input type="radio" name="gender" value="M">&nbsp;남 &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="gender" value="F">&nbsp;여
		</td>
		<td></td>
	</tr>
	<tr>
		<td> 생년월일 <br /></td>
		<td>
		<input type="date" id="userBirth" name="userBirth" value="<%=user.getBirthdate() %>">
		</td>
		<td></td>
	</tr>
	<tr>
		<td> 회원 유형 <br /></td>
		<td>
		<input type="radio" name="userType" value="TYP001" /> 일반&nbsp;&nbsp;
		<input type="radio" name="userType" value="TYP003" /> 기업
		</td>
		<td></td>
	</tr>
	<tr>
		<td> 관심 분야 <br /></td>
		<td>
		<select class="interest-multiple" name="interest" data-placeholder="Select an option" multiple="multiple"
		style="width: 75%" >
		<% for(int i=0; i< category.size(); i++) {%>
  			<option value="<%=category.get(i).getCategoryId()%>"><%=category.get(i).getCategoryName() %></option>
  		<% } %>
		</select>
		</td>
		<td></td>
	</tr>
	</table>
	<!-- 프로필 이미지 업로드를 위한 input:file -->
	<div id="imageUpload">
		<input type="file" name="profile" id="profile" onchange="LoadImg(this)" />
	</div>
</form>
</div>
<br />
	<div align="center">
		<button onclick="uComplete();" class="btn btn-primary" style="background-color: white; color: #505050; border-style: 2px solid; border-color:#8ac5ff;
			font-weight: bold;">수정 완료</button>
		
	</div>

<br />

	
	
<% } else {
		request.setAttribute("msg", "회원만 가능한 서비스 입니다.");
		request.getRequestDispatcher("../views/common/errorPage.jsp").forward(request, response);
	}
	%>
<br><br>
<%@ include file="../common/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>


<script>

	var emailFlag = true;
	
	$(document).ready(function(){

        $("#userEmail").blur(function() {
            checkEmail();
        });
		
        
		
	});
	
	//이메일 체크
	function resetEmail() {
			console.log(emailFlag);
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
	        console.log(emailFlag);
	      //이메일 중복확인
	      	if(email == "<%=user.getUserEmail()%>"){
	      		hideMsg(oMsg);
	      		emailFlag = true;
	      	}else{
	        $.ajax({
				url : "/pickme/emailDup.au",
				type : "post",
				data : { userEmail : $('#userEmail').val() },
				success : function(data){
					console.log(data);
					if(data == 'no'){
						showErrorMsg(oMsg,"이미 사용하고있는 이메일주소 입니다.","red");
						$('#userId').select();
						emailFlag = false; 
					} else {
						showErrorMsg(oMsg,"사용 가능한 이메일 주소 입니다.","green");
						emailFlag=true;
					}
					
					
				}, error : function(request, status, error){
					alert(request+"\n" 
						  + status+"\n"
						  + error);
					console.log("에러 발생!");
					
				}
				
			});
	      	}
	        
	        hideMsg(oMsg);
	        emailFlag = true;
	        
	        
	        return true;
	    }
	
	
	
	/* select2 사용을 위한 메소드 */
	$(function() {
		
    $('.interest-multiple').select2({
    	width: 'resolve'
    });
    
    /* $("select").val(["1","2"]).trigger("change"); */
    

    $("select").val([<%for(int i = 0; i < cat.size(); i++){%>
    "<%= cat.get(i).getCategoryId()%>",
    <%}%> ]).trigger("change");
    
    
    
});
	/* select2 값 가져오기 위한 메소드 */
	
	
	/* 이미지 클릭 시 이미지 삽입 메소드 */
	$(function(){
		 
		$('#imageUpload').hide();
		
		$('img').click(function(){
			
			$('#profile').click();
			
		});
		
	});
	/* 이미지 미리보여주기 메소드 */
	function LoadImg(value){
		
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){
				$('#profileImage').attr('src', e.target.result);
			}
		
		
		reader.readAsDataURL(value.files[0]);
		
		}
	};
	
	$(function(){
		/* 성별 체크 */
		$('input[name=gender]').each(function(){
			if($(this).val() == '<%=user.getGender() %>')
				$(this).prop('checked', true);
			else
				$(this).prop('checked', false);
		});
		/* 생년월일 체크 */
		
		var birthdate = '<%=user.getBirthdate() %>'.split('/');
	
		/* 회원 유형 체크 */

		$('input[name=userType]').each(function(){
			if($(this).val()== '<%=user.getType() %>')
				$(this).prop('checked', true);
			else
				$(this).prop('checked', false);
		
		});
	});
	
	/* 수정완료 시 servlet으로 가는 메소드 */
	function uComplete(){
		
		var oMsg = $("#pwdResult");
			
			if(!emailFlag){
				
				alert("이메일 정보를 다시 확인해주세요.");
			}
			else{
				$('#updateform').submit();	
			}
			
			
	}
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
	
	$('.fa-reply').click(function(){
		
		location.href="/pickme/mPicks.pr?uno=<%=user.getUserNo()%>";
	});
	

</script>
<% } %>
</body>

</html>