<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.user.model.vo.User"%>
<%
	User u = (User)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<!-- /pickme/main.ma -->
<h2>로그인 완료</h2>

<form id="main" action=""  method ="post">
	<table align="center">
		<tr>
			<td>아이디 </td>
			<td><%=u.getUserId() %></td>		
		</tr>
		<tr>
			<td>회원번호</td>
			<td><%=u.getUserNo() %></td>
		</tr>
	</table>


</form>




<%@ include file="../common/footer.jsp" %>
	
</body>
</html>