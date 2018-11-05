<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/bootstrap-4.1.3/css/bootstrap.min.css">
<script src="resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<style>
	section{
		border : 3px solid black;
		background : red;
	}
</style>
</head>
<body>
	<%@ include file="views/header.jsp"  %>
	<section>
		<h1>first commit</h1>
		<form action="test.do">
			<input type="text" name="test-input" />
			<button type="submit">테스트 전송</button>
		</form>
	</section>
	<%@ include file="views/footer.jsp"  %>
</body>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
	//		alert("body open");
	});
</script>
</html>