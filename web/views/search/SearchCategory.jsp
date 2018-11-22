<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pick.model.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%
ArrayList<PickMe> cList = (ArrayList<PickMe>)session.getAttribute("searchList"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<title>Insert title here</title>
<style>

.img_size {
		width : 200px;
		height : 150px;
	}
	
</style>
</head>
<body>
	<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
	<div class="pm-section col-xs-12 col-md-8" style="margin-left:auto;margin-right:auto">
		
			
			<% if(cList.size() != 0){ %>
			<h1>카테고리 검색 결과 리스트 창</h1>
			
			<br /><br />
		<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col"><i class="fas fa-search"></i></th>
			      <th scope="col">아이디</th>
			      <th scope="col">제목</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			<% for(int i = 0 ; i < cList.size(); i++){ %>
			 <tbody>
			    <tr class="table-primary">
			      <th scope="row"><%= i+1 %></th>
			      <td><!-- 사용자 정보 페이지로 이동시키기 -->
				<% if(user.getUserNo() != cList.get(i).getUserno()) { %>
				<a href="/pickme/uPage.pr?uno=<%= cList.get(i).getUserno()%>"><%= cList.get(i).getUserId()%></a>
				<% } else { %>
				<a href="/pickme/mPicks.pr?uno=<%= user.getUserNo()%>"><%= cList.get(i).getUserId()%></a>
				<% } %></td>
			      <td><a href="/pickme/pickview.pv?Pid=<%=cList.get(i).getId()%>"><%= cList.get(i).getTitle() %></a></td>
			      <td>
			      <img class="rounded img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=cList.get(i).getSelect_1() %>" alt="select1-img" />
			      <img class="rounded img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=cList.get(i).getSelect_2() %>" alt="select2-img" />
			      
			      </td>
			      
			      <td></td>
			    </tr>
			    <% } %>
			</tbody>
			</table>
			
			<% }else { %>
				
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