<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result list</title>

<style>
	span.title{
		margin-left : 0;
		color : red;
	}
	
	span.name{
		margin-right : 0;
	}
	

</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% } else { %>
	<%@ include file="../common/header.jsp" %>
	
	<div class="pm-section col-xs-12 col-md-8">
	<h1>pick list</h1>
	<div class="pm-div">
	<% for(int i = 1 ; i <= 10 ;i++){ %>
		<div>
		<span class="title"><a href="/pickme/statsOneList.st?pickno=<%=i%>">pick <%= i %> title</a></span>
		<img src="" alt="select1-img" />
		<img src="" alt="select2-img" />
		<span class="name"><a href="">작성자 <%= i %></a></span>
		</div>	
		<hr />
	
	<% } %>
	</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	
	
	<script>
		$(window).scroll(function(){
				if($(window).scrollTop() == $(document).height() - $(window).height()){
					$(".pm-div").append("<div>" +
							"<span class='title'><a href='/pickme/statsOneList.st?pickno=''>picktitle</a></span>" +
							"<img src='' alt='select1-img' />" +
							"<img src='' alt='select2-img' />" +
							"<span class='name'><a href=''>작성자 </a></span>" +
							"</div>" +	
							"<hr />" +
							"<div>" +
							"<span class='title'><a href='/pickme/statsOneList.st?pickno=''>picktitle</a></span>" +
							"<img src='' alt='select1-img' />" +
							"<img src='' alt='select2-img' />" +
							"<span class='name'><a href=''>작성자 </a></span>" +
							"</div>" +	
							"<hr />");
				}
		});
	</script>
<% } %>
</body>
</html>