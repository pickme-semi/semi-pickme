<%@page import="com.pick.model.vo.PickMe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<PickMe> plist = (ArrayList<PickMe>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 선택 페이지 Main</title>
</head>

<style>
section{
		background : white;
		margin-left: auto;
		margin-right: auto;
	}


* {
  box-sizing: border-box;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
    content: "";
  display: table;
  clear: both;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

#pick1 { 
/*픽 이미지 1 크기 조절 */
 width: 400px; height: 300px;
     
  max-width: 300px;   
}
#pick2 {
 width: 400px; height: 300px;
   
    max-width: 300px;    
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
				
	<section class="col-xs-12 col-md-8">
	
	<div class="container">

<% 
PickMe pData = new PickMe();
%>

  <!-- Full-width images with number text -->
  <div class="mySlides">              
    <div class="numbertext">1 / 6</div>
     <div class="row" align="center">
    	<div class="col-md-6" align="center" > <!-- 픽 이미지 1 -->
			
			<br>
			<img id="pick1" src=""
			 />
		</div>	
		<div class="col-md-6" align="right"> <!--픽 이미지 2 -->
			<img id="pick2" src="" />
			</div>	
    </div>
		<!--  	
      <img src="/pickme/resources/images/img_sample1.jpg" style="width:50%">
      <img src="/pickme/resources/images/img_sample2.jpg" style="width:50%">
      -->
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 6</div>
   
     <div class="row" align="center">
		<div class="col-md-6" align="center" > <!--픽 이미지 1  -->
			<img id="pick1" src="/pickme/resources/images/1.jpg" 
			 />
		</div>	
		<div class="col-md-6" align="center"> <!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/2.jpg" />
		</div>
		</div> 
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 6</div>
     
     <div class="row" align="center">
		<div class="col-md-6" align="center" > <!--픽 이미지 1  -->
			<img id="pick1" src="/pickme/resources/images/img_sample3.jpg" />
		</div>	
		<div class="col-md-6" align="center"> <!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/img_sample4.jpg" />
		</div>
		</div> 
 
  </div>

  <div class="mySlides">
    <div class="numbertext">4 / 6</div>
       <div class="row" align="center">
		<div class="col-md-6" align="center" > <!--픽 이미지 1  -->
			<img id="pick1" src="/pickme/resources/images/img_sample5.gif" />
		</div>	
		<div class="col-md-6" align="center"> <!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/img_sample6.gif" />
		</div>
		</div> 
 
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 6</div>
       <div class="row" align="center">
		<div class="col-md-6" align="center" > <!--픽 이미지 1  -->
			<img id="pick1" src="/pickme/resources/images/img_sample7.gif" />
		</div>	
		<div class="col-md-6" align="center"> <!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/img_sample8.gif" />
		</div>
		</div> 
 
  </div>

  <div class="mySlides">
    <div class="numbertext">6 / 6</div>
  <div class="row" align="center">
		<div class="col-md-6" align="center" > <!--픽 이미지 1  -->
			<img id="pick1" src="/pickme/resources/images/img_sample9.gif" />
		</div>	
		<div class="col-md-6" align="center"> <!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/img_sample9.gif" />
		</div>
		</div> 
 
  </div>

  <!-- Next and previous buttons 이걸 수정해야한다--> 
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>

  <!-- Image text -->
  <div class="caption-container">
    <p id="caption"></p>
    <p>뭐라고써있니</p>
  </div>

  <!-- Thumbnail images -->
  <div class="row">
    <div class="column">
           <div class="row" >
      <img class="demo cursor" src="/pickme/resources/images/img_sample1.jpg" width="50%" height="16.66%" onclick="currentSlide(1)" alt="1번정보">
      <img class="demo cursor" src="/pickme/resources/images/img_sample2.jpg" width="50%" height="16.66%" onclick="currentSlide(1)" alt="1번정보">
           </div>
        </div>
    <div class="column"> 
      <div class="row" >
      <img class="demo cursor" src="/pickme/resources/images/1.jpg" width="50%" height="16.66%" onclick="currentSlide(2)" alt="2번정보">
      <img class="demo cursor" src="/pickme/resources/images/2.jpg" width="50%" height="16.66%" onclick="currentSlide(2)" alt="2번정보">
           </div>     
     
     
    </div>
    <div class="column">
      <div class="row" >
      <img class="demo cursor" src="/pickme/resources/images/img_sample3.jpg" width="50%" height="16.66%" onclick="currentSlide(3)" alt="3번정보">
      <img class="demo cursor" src="/pickme/resources/images/img_sample4.jpg" width="50%" height="16.66%" onclick="currentSlide(3)" alt="3번정보">
           </div>
    </div>
    <div class="column">
      <div class="row" >
      <img class="demo cursor" src="/pickme/resources/images/img_sample5.gif" width="50%" height="16.66%" onclick="currentSlide(4)" alt="4번정보">
      <img class="demo cursor" src="/pickme/resources/images/img_sample6.gif" width="50%" height="16.66%" onclick="currentSlide(4)" alt="4번정보">
           </div>
    </div>
    <div class="column">
      <div class="row" >
      <img class="demo cursor" src="/pickme/resources/images/img_sample7.gif" width="50%" height="16.66%" onclick="currentSlide(5)" alt="5번정보">
      <img class="demo cursor" src="/pickme/resources/images/img_sample8.gif" width="50%" height="16.66%" onclick="currentSlide(5)" alt="5번정보">
           </div>
    </div> 
    <div class="column">

      <div class="row" >
      <img class="demo cursor" src="/pickme/resources/images/img_sample9.gif" width="50%" height="16.66%" onclick="currentSlide(6)" alt="6번정보">
      <img class="demo cursor" src="/pickme/resources/images/img_sample9.gif" width="50%" height="16.66%" onclick="currentSlide(6)" alt="6번정보">
           </div>
            </div>
  </div>
</div>
	
	
	


	</section>
	

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



	<script>
	
	
	var slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  
	  // 글쓸곳
	  var captionText = document.getElementById("caption");
	  
	  // 길이 초과시 처음으로 보내기 여기선 다음 페이지 전송 하기 
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	}
	
	// count 만들기  // 각 사진마다 값을 초기화 하는거라서 괜츈 
	var countLeft = 0;
	var leftPercent = 0;
	var countRight = 0;
	var rightPercent = 0;
	var totalCount = countLeft + countRight;
	
	function selectLeft(){
		countLeft +=1;
		leftPercent = 100*(countLeft / totalCount);
		console.log(countLeft);
		console.log(leftPercent);
		
	
	}
	function selectRight(){
		countRight +=1;
		console.log(countRight);
	}
	/* 
	// ajax 통신클릭시 왼쪽 선택
	$("#pick1").click(function(){
			
			$.ajax({
				url : "/com/pick/pickresult.pr",
				type : "get",
				data : {
					resultPickId : $('#resultPickId').val() // 사진Pic값 전송
					selectUserNo : $('#selectUserNo').val()
					selectUserNo : $('#selectResult').val()
					selectDdate : $('#selectDdate').val()
				}, success : function(data){
					console.log("데이터 전달 성공!");
				}, error :  function(request, status, error) {
					console.log("실패!!!");
					console.log(request);
					console.log(status);
					console.log(error);
				}, complete : function(){
					console.log("무조건 실행하는 함수");
				}
			});
		});
	
	// ajax 통신클릭시   오른쪽 선택
		$("#pick2").click(function(){
			
			$.ajax({
				url : "/com/pick/pickresult.pr",
				type : "get",
				data : {
					resultPickId : $('#resultPickId').val() // 사진Pic값 전송
					selectUserNo : $('#selectUserNo').val()
					selectUserNo : $('#selectResult').val()
					selectDdate : $('#selectDdate').val()
				}, success : function(data){
					console.log("데이터 전달 성공!");
				}, error :  function(request, status, error) {
					console.log("실패!!!");
					console.log(request);
					console.log(status);
					console.log(error);
				}, complete : function(){
					console.log("무조건 실행하는 함수");
				}
			});
		}); */
	</script>
	


<%@ include file="../common/footer.jsp" %>
</body>
</html>