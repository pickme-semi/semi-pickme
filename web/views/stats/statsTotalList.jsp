<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" import="com.pick.model.vo.PickMe"%>
<% ArrayList<PickMe> list = (ArrayList<PickMe>)session.getAttribute("list"); %>
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
	
	.img_size{
		width : 200px;
		height : 150px;
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
	
		
		<table class="table">
			<thead>
			    <tr>
			      <th scope="col"><i class="fas fa-search"></i></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			<tbody>
			<% for(int i = 0 ; i < list.size() ;i++){ %>
			<tr class="table-primary">
				<th scope="row"><%= i+1 %></th>
				<td><span class="title"><a href="/pickme/statsOneList.st?pickno=<%=list.get(i).getId()%>"> <%= list.get(i).getTitle() %> </a></span></td>
				<td><img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_1() %>" alt="select1-img" onError ="imgError(this)" /><img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_2() %>" alt="select2-img" onError ="imgError(this)"  />
				</td>
				<td><span class="name"><a href="">작성자</a></span></td>
			</tr>
			<% } %>
			</tbody>
		</table>
		
		<%-- <div>
		<span class="title"><a href="/pickme/statsOneList.st?pickno=<%=list.get(i).getId()%>"> <%= list.get(i).getTitle() %> </a></span>
		<img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_1() %>" alt="select1-img" onError ="imgError(this)" />
		<img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_2() %>" alt="select2-img" onError ="imgError(this)"  />
		<span class="name"><a href="">작성자</a></span>
		</div>	
		<hr /> --%>
	
	
	</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	
	
	<script>
		$(window).scroll(function(){
				if($(window).scrollTop() == $(document).height() - $(window).height()){
					// ajax 
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