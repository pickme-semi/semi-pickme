<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.BoardCategory" %>
<%
	String type = (String)session.getAttribute("bType");
	ArrayList<BoardCategory> categoryList = (ArrayList<BoardCategory>)session.getAttribute("cateList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="common/boardHeader.jsp" %>
	<div class="pm-section col-xs-12 col-md-8">
		<h1>입력폼</h1>
		<div class="row">
			<label for="">카테고리</label>
			<select name="" id="">
				<% if ( categoryList != null){ %>
				<% for (int i = 0 ; i < categoryList.size(); i++){%>
					<option value="<%=categoryList.get(i).getId()%>"> <%=categoryList.get(i).getConetent() %></option>
				<% } %>
				<% }else{ %>
					<option value="">카테고리 없음</option>
				<% } %>
			</select>
		</div>
		<div class="row">
					<input type="text" placeholder="제목" />
		</div>
		<div class="row">
			<textarea name="" id="" cols="30" rows="10"></textarea>
		</div>
		<% if(type.equals("report")){ %>
			<div class="row">
				<input type="text"  value="pickid"/>	
			</div>
		<% } %>
		<button>완료</button>
		<button>취소</button>
	</div>
	<%@ include file="../common/footer.jsp" %>
	<script>
		
	</script>
</body>
</html>