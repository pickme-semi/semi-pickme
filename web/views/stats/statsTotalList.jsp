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
	
	td{
		margin-top : auto;
		margin-botton : auto;
		align : center;
	}
	
	span{
		margin-top : 50px;
		margin-botton : 50px;
		align : center;
	}
	
	.tdDiv{
		margin-top : 50px;
		margin-botton : 50px;
		align : center;
	
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
			<%-- <%int count = 5; %> --%>
			<% for(int i = 0 ; i <list.size();i++){ %>
			<tr class="table-primary">
				<th scope="row"><%= i+1 %></th>
				<td width="15%" align="center" >
				<div class="tdDiv"><span class="title"><a onclick="goOneList(<%=list.get(i).getId()%>);" <%-- href="/pickme/statsOneList.st?pickno=<%=list.get(i).getId()%>" --%>> <%= list.get(i).getTitle() %> </a></span></div>
				</td>
				<td align="center"><img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_1() %>" alt="select1-img" onError ="imgError(this)" /><img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_2() %>" alt="select2-img" onError ="imgError(this)"  />
				</td>
				<td><div class="tdDiv"><span class="name"><a href="/pickme/uPage.pr?uno=<%=list.get(i).getUserno()%>"><%=list.get(i).getUserId()%></a></span></div></td> <!-- 이부분 안됨 -->
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
		function goOneList(pickId){
			$.ajax({
				url : "/pickme/sResult.st",
				type : "post",
				data : { id : pickId},
				success : function(data){
					console.log(data);
					if(data == 'no'){
						alert("통계 값이 없습니다.");
					}else{
						location.href = "/pickme/statsOneList.st?pickno="+pickId;
					}
				}
			})
		}
		 /* function test(){
			$.ajax({
				url : "/pickme/getData.st",
				type : "get",
				success :function(data){
					console.log("data: " +data);
					console.log("data[1] "+data.get(1).pickId);
				}, error : function(request, status, error){
					alert(request+"\n" 
							  + status+"\n"
							  + error);
						console.log("에러 발생!");
						
					}
			})
		}  */
		
		<%-- $(window).scroll(function(){
				if($(window).scrollTop() == $(document).height() - $(window).height()){
					// ajax 
					$.ajax({
						url : "/pickme/sTotalList.st",
						type : "post",
						success : function(data){
							console.log(data);
							$(".pm-div").append("<div>" +
									'<tr class="table-primary">'+
										'<th scope="row">'+<%=  %>+'</th>'+
										'<td width="15%" align="center" >'+
										'<div class="tdDiv"><span class="title"><a href="/pickme/statsOneList.st?pickno='+<%=%>+'">'+ <%=  %>+ '</a></span></div>'+
										'</td>'+
										'<td align="center"><img class="img_size" src="'+<%= request.getContextPath() %>+'/resources/PickUploadFiles/'+<%= %>+'" alt="select1-img" onError ="imgError(this)" /><img class="img_size" src="'+<%= request.getContextPath() %>+'/resources/PickUploadFiles/'+<%=%>+'" alt="select2-img" onError ="imgError(this)"  />'+
										'</td>'+
										'<td><div class="tdDiv"><span class="name"><a href="/pickme/uPage.pr?uno='+<%=%>+'">'+<%=%>+'</a></span></div></td>'+
									'</tr>'+
											"</div>" +	
									"<hr />");
						}, error : function(request, status, error){
							alert(request+"\n" 
									  + status+"\n"
									  + error);
								console.log("에러 발생!");
								
							}
					}); 
					/* $(".pm-div").append("<div>" +
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
							"<hr />"); */
				}
		});--%>
		<%-- var index = <%=count%>;
		<%int idx = count;%>
		var max = <%=list.size()%>;
		$(window).scroll(function(){
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				if(index<=max){
				<%for(int i = idx; i<idx+3; i++){%>
				$("tbody").append('<tr class="table-primary">'+
							'<th scope="row">'+<%=i+1%>+'</th>'+
							'<td width="15%" align="center" >'+
							'<div class="tdDiv"><span class="title"><a href="/pickme/statsOneList.st?pickno='+<%=list.get(i).getId()%>+'"> <%= list.get(i).getTitle() %> </a></span></div>'+
							'</td>'+
							'<td align="center"><img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_1() %>" alt="select1-img" onError ="imgError(this)" />'+
							'<img class="img_size" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=list.get(i).getSelect_2() %>" alt="select2-img" onError ="imgError(this)"  />'+
							'</td>'+
							'<td><div class="tdDiv"><span class="name"><a href="/pickme/uPage.pr?uno="></a></span></div></td>'+
						'</tr>');
				
								<%}%>
				<%count++;%>
				}
			}
	}); --%>
		 
		 
	</script>
<% } %>
</body>
</html>