<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 선택 페이지 Main</title>
</head>

    <!-- Bootstrap core CSS -->
    <link href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">

<style>
#pick1 { 
/*픽 이미지 1 크기 조절 */
    width: 300px; height: 300px;
    max-width: 300px;    
}
#pick2 {
/*픽 이미지 2 크기 조절 */
     width: 300px; height: 300px;
    max-width: 300px;     
}

</style>

<body>
<%@ include file="../common/header.jsp" %>

<div class="main" >
	<div class="title" align="center">
		
			<div class="row">
				<div class="col-md-12" align="center">					
					<h3>
						Pick 제목 <!--픽 게시물 제목 -->
					</h3>
					 <button type="button" align="right">게시물 신고</button>					
				</div>				
			</div>
		
	</div>
	<br><br><br><br>	
	
	<div class="row">
		<div class="col-md-6" align="center"> <!--픽 이미지 1 -->
			<img id="pick1" src="/pickme/resources/images/img_sample1.jpg"
			 />
		</div>	
		<div class="col-md-6" align="center"> <!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/img_sample2.jpg" />
		</div>
		
	</div>	
	
	<br><br><br>
	
	<div class="col-md-12" align="center" >
		<button type="button" onclick="javascript:location.href='PickSub.jsp';">
		상세보기
		</button>
	</div>
	
	
	<br><br><br>
	
	<div class="list" align="center">
		<div class="col-md-12" align="center">
			<nav align="center">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">last</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>