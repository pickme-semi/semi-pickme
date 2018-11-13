<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="com.profile.model.vo.*" %>
<%
	ArrayList<Category> category = (ArrayList<Category>)request.getAttribute("cArr");
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
		width : 600px;
		height : 400px;
		background : mistyrose;
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
	
	.outer2{
		width : 600px;
		height : 350px;
		background : darkgray;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	
	}

</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<% if( user != null) { %>
<div class = "outer">
<h2 align = "center"> 회원 정보  </h2>
<br />

<form id = "updateform"  method="post" action="<%= request.getContextPath() %>/mPageUpdate.au"
encType="multipart/form-data">
	<table align="center">
	<tr>
		<td width="120px"> 아이디 </td>
		<td id ="userId" ><%= user.getUserId() %></td>
		<td><!--   <button id="idCheck"> 중복확인</button> --></td>
	</tr>
	<tr>
		<td></td>
		<td><span class= "error_next_box" id="idMsg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 비밀번호 </td>
		<td><input type="password" id="userPwd" name="userPass" required="required" aria-describedby="pswd1Msg" maxlength="20"></td>
		<td>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><span class= "error_next_box" id="pswd1Msg" style="display:none" role="alert">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span></td>
	</tr>
	<tr>
		<td> 비밀번호 확인 </td>
		<td><input type="password" id="userPwd2" name="userPass2" ></td>
		<td><label id="pwdResult"></label></td>
	</tr>
	<tr>
		<td></td>
		<td><span class="error_next_box" id="pswd2Msg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 이름 </td>
		<td id="userName"><%= user.getUserName() %></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td><span class="error_next_box" id="nameMsg" style="display:none" role="alert"></span></td>
	</tr>
	<tr>
		<td> 이메일 <br /></td>
		<td><input type="email" id="userEmail" name="userEmail" required="required" value="<%= user.getUserEmail()%>"/></td>
		<td></td>
	</tr>
	<tr>
		<td> 프로필 사진 <br /></td>
		<td>
		<% if(user.getProfile() != null) {%>
		  <img src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr">
		<% } else{ %>
			<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
		<% }%>
		</td>
		<td></td>
	</tr>
	<tr>
		<td> 성별 <br /></td>
	
		<td><input type="radio" name="gender" value="M">남
			<input type="radio" name="gender" value="F">여
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
		<input type="radio" name="userType" value="TYP001" /> 일반
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
		<button align="center" onclick="uComplete();">수정 완료</button>
		<button onclick="uDelete();">회원 탈퇴</button>
	</div>

	<br />

	
	
<% } else {
		request.setAttribute("msg", "회원만 가능한 서비스 입니다.");
		request.getRequestDispatcher("../views/common/errorPage.jsp").forward(request, response);
	}
	%>

<%@ include file="../common/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>


<script>
	/* select2 사용을 위한 메소드 */
	$(function() {
		
    $('.interest-multiple').select2({
    	width: 'resolve'
    });
    
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
		$('#updateform').submit();
	}
	/* 회원 탈퇴 시 servlet으로 가는 메소드 */
	function uDelete(){
		location.href = "/pickme/uDelete.pr?uno=<%=user.getUserNo() %>";
	}

</script>
</body>

</html>