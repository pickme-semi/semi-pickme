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
<div class ="outer">
	<h2 align ="center">비밀번호 재설정</h2>
	<form  id="passReset" action="/pickme/passReset.au" method="post">
	
		<table>
			<tr>
				<td>새 비밀번호</td>
				<td><input id="newPass" name = "newPass" type="password" required="required"/></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input id="newPass2" type="password" required="required"/></td>
			</tr>
		</table>
		<br />
		
		<button type = "button" id= "resetBtn"> 확인 </button>
	</form>

</div>

<script>
	$("#resetBtn").click(function(){
		$("#passReset").submit();
	})
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>