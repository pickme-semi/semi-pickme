<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pick.model.vo.PickMe" %>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<PickMe> pList = (ArrayList<PickMe>)session.getAttribute("searchList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<title>픽 검색결과</title>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
		<div class="pm-section col-xs-12 col-md-8">
		
			<% if(pList.size() != 0){ %>
			<h1>픽 검색 결과 리스트 창</h1>
			<br /><br />
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col"><i class="fas fa-search"></i></th>
			      <th scope="col">픽 제목</th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			<% for(int i = 0 ; i < pList.size(); i++) { %>
				<tbody>
					<tr class="table-primary">
					<th scope="row"><%= i+1 %></th>
					<td><a href="/pickme/pickview.pv?Pid=<%=pList.get(i).getId()%>"><%=pList.get(i).getTitle()%></a></td>
					<td></td>
					<td></td>
					</tr>
				
			<% } %>
			</tbody>
			</table>
			
			<% }else{ %>
				<h1>픽&카테고리 검색 결과 리스트 창</h1>
			<br /><br />
			<table class="table table-hover" >
			  <thead>
			    <tr>
			      <th scope="col"><i class="fas fa-search"></i></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  </table>
			  
			  	<div align="center" style="margin-top: 50px; margin-bottom : 500px;"><h5>검색결과가 없습니다.</h5></div>
			<% } %>
		
		</div>
		
	<%@ include file="../common/footer.jsp" %>
<% } %>
</body>
</html>