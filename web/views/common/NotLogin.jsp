<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="pm-section col-xs-12 com-md-8">
		<div align="center">
			<h1>403 FORBIDDEN</h1>
			<% String msg = (String)session.getAttribute("msg"); %>
			<br />
			<br />
			<br />
			<h3><a href="/pickme">로그인 하기</a></h3>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>