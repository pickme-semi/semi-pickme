<%@page import="com.pick.model.vo.PickMe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<PickMe> plist = (ArrayList<PickMe>)request.getAttribute("list");
User u = (User)session.getAttribute("user");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 선택 페이지 Test</title>
</head>

<style>

.pm-div-1{
	display:inline-block;
	width: 300px;
	height : 300px;
	background : red;
}

.pm-div-2{
	display:inline-block;
	width: 300px;
	height : 300px;
	background : blue;
}

.div-img{
}

.carousel-item{
width : 300px;
height : 300px;
}

</style>

<link rel="stylesheet" href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">
<script src="/pickme/resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 업로드 이미지 미리보기 구현. -->

<body>
<%@ include file="../common/header.jsp" %>

<div class="pm-section col-xs-12 col-md-8" align="center" style="height : 600px">
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" style="height:600px;">
				<div class="div-img cur" style="display:inline-block">
					<div class="sel-div pm-div-1" id="test1"><!-- 
					 --><img src="../../resources/images/1.jpg" width="300px" height="300px" style="border:10 solid black" alt=""/><!-- 
					 <--><input type="hidden" value="pick2_select1" class="current_1"/>
					 </div><!-- 
					 --><div class="sel-div pm-div-2" id="test2"><!-- 
					 --><img  src="../../resources/images/2.jpg" width="300px" height="300px" style="border:10 solid black" alt=""/><!--
					 <--><input type="hidden" value="pick2_select2" class="current_2" /> 
					 </div>			
				</div>
			</div>
			<div class="carousel-item" style="height:600px;">
				<div class="div-img cur" style="display:inline-block">
					<div class="sel-div pm-div-1" id="test1"><!-- 
					 --><img src="../../resources/images/3.jpg" width="300px" height="300px" style="border:10 solid black" alt=""/><!-- 
					 <--><input type="hidden" value="pick2_select1" class="current_1"/>
					 </div><!-- 
					 --><div class="sel-div pm-div-2" id="test2"><!-- 
					 --><img  src="../../resources/images/4.jpg" width="300px" height="300px" style="border:10 solid black" alt=""/><!--
					 <--><input type="hidden" value="pick2_select2" class="current_2" /> 
					 </div>			
				</div>
			</div>
			<div class="carousel-item" style="height:600px;">
				<div class="div-img cur" style="display:inline-block">
					<div class="sel-div pm-div-1" id="test1"><!-- 
					 --><img src="../../resources/images/img_sample1.jpg" width="300px" height="300px" style="border:10 solid black" alt=""/><!-- 
					 <--><input type="hidden" value="pick2_select1" class="current_1"/>
					 </div><!-- 
					 --><div class="sel-div pm-div-2" id="test2"><!-- 
					 --><img  src="../../resources/images/img_sample2.jpg" width="300px" height="300px" style="border:10 solid black" alt=""/><!--
					 <--><input type="hidden" value="pick2_select2" class="current_2" /> 
					 </div>			
				</div>
			</div>
		</div>
	</div>
	
	<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
</div>



<%@ include file="../common/footer.jsp" %>

<script>
	$(".active .pm-div-1").click(function(){
		console.log($(".current_1").val());
	});
	
	$(".active .pm-div-2").click(function(){
		console.log($(".current_2").val());
	});

</script>
</body>
</html>