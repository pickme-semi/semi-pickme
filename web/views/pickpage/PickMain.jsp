<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 선택 페이지 Main</title>
</head>

<style>
section{
		background : red;
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

<!--  
<script type="text/javascript">

$(document).ready(function() {            
    //라디오 버튼 변경시 이벤트
    $("input[name='category']:radio").change(function () {
            //라디오 버튼 값을 가져온다.
            var category = this.value;
                             
            if(category == "sports"){//스포츠인 경우
                //스포츠 일때 여행/음식 카테고리 hide
                $( "#viewTourCategory" ).hide();
  			    $( "#viewFoodCategory" ).hide();
                //스포츠 일때 스포츠 카테고리 show
                $( "#viewSportCategory" ).show();
               
            }else if(category == "tour"){
			    $( "#viewSportCategory" ).hide();
			    $( "#viewFoodCategory" ).hide();
			    // 여행 카테고리일때 스포츠/음식 카테고리 hide
                $( "#viewTourCategory" ).show();
               // 여행 카테고리 show
                                    
            }else if(category == "food"){
			    $( "#viewSportCategory" ).hide();
			    $( "#viewTourCategory" ).hide();
			    // 음식 카테고리일때 스포츠/여행 카테고리 hide
                $( "#viewFoodCategory" ).show();
               // 음식 카테고리 show
            }                                     
        });
});

</script>

-->
<body>
<%@ include file="../common/header.jsp" %>
<!-- 
<div class="main" >
	<div class="title" align="center">
		
			<div class="row">
				<div class="col-md-12" align="center">					
					<h3>
						Pick 제목 
					</h3>
					 <button type="button" align="right">게시물 신고</button>					
				</div>	
											
			</div>
			
			<br><br>
			<label for="category">카테고리 이동</label> 
			<br>
				<input type="radio" name="category" value="tour" checked /><span>여행</span>
				<input type="radio" name="category" value="sports" /><span>운동</span>
				<input type="radio" name="category" value="food" /><span>요리</span>

				<br>
				<br>
				<span id="viewTourCategory"> 여행 카테고리: 
				<select	class="form-control tourMainCategory"
				 name="tourtMainCategory" style="width: 200px">
						<option value="1">국내여행</option>
						<option value="2">해외여행</option>
				</select>
				</span>
				<span id="viewSportCategory" style="display: none"> 스포츠 카테고리: 
				<select class="form-control sportsMainCategory"
				 name="sportsMainCategory" style="width: 200px">
						<option value="1">실내운동</option>
						<option value="2">야외운동</option>
				</select>
				</span> <span id="viewFoodCategory" style="display: none"> 음식 카테고리:
				<select class="form-control foodMainCategory"
				name="foodMainCategory" style="width: 200px">
					<option value="1">한식</option>
					<option value="2">일식</option>
					<option value="3">중식</option>
				</select>
				</span>
	
		
	</div>
	<br><br><br><br>	
	 -->
				
	<section class="col-xs-12 col-md-8">
	
	<div class="container">

  <!-- Full-width images with number text -->
  <div class="mySlides">
    <div class="numbertext">1 / 6</div>
    	<div class="col-md-6" align="center" > <!--픽 이미지 1 -->
			<img id="pick1" src="/pickme/resources/images/img_sample1.jpg"
			 />
		</div>	
		<div class="col-md-6" align="right"> <!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/img_sample2.jpg" />
			</div>	
		<!--  	
      <img src="/pickme/resources/images/img_sample1.jpg" style="width:50%">
      <img src="/pickme/resources/images/img_sample2.jpg" style="width:50%">
      -->
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 6</div>
      <img src="/pickme/resources/images/img_sample1.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 6</div>
      <img src="/pickme/resources/images/img_sample1.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">4 / 6</div>
      <img src="/pickme/resources/images/img_sample1.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 6</div>
      <img src="/pickme/resources/images/img_sample1.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">6 / 6</div>
      <img src="/pickme/resources/images/img_sample1.jpg" style="width:100%">
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>

  <!-- Image text -->
  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <!-- Thumbnail images -->
  <div class="row">
    <div class="column">
      <img class="demo cursor" src="/pickme/resources/images/img_sample1.jpg" style="width:100%" onclick="currentSlide(1)" alt="1번정보">
    </div>
    <div class="column"> 
      <img class="demo cursor" src="/pickme/resources/images/img_sample1.jpg" style="width:100%" onclick="currentSlide(2)" alt="2번정보 ">
    </div>
    <div class="column">
      <img class="demo cursor" src="/pickme/resources/images/img_sample1.jpg" style="width:100%" onclick="currentSlide(3)" alt="3번정보">
    </div>
    <div class="column">
      <img class="demo cursor" src="/pickme/resources/images/img_sample1.jpg" style="width:100%" onclick="currentSlide(4)" alt="4번정보">
    </div>
    <div class="column">
      <img class="demo cursor" src="/pickme/resources/images/img_sample1.jpg" style="width:100%" onclick="currentSlide(5)" alt="5번정보">
    </div> 
    <div class="column">
      <img class="demo cursor" src="/pickme/resources/images/img_sample1.jpg" style="width:100%" onclick="currentSlide(6)" alt="6번정보">
    </div>
  </div>
</div>
	
	
	
	<!-- 
	<div class="row" align="left">
		<div class="col-md-6" align="center" > <!--픽 이미지 1 
			<img id="pick1" src="/pickme/resources/images/img_sample1.jpg"
			 />
		</div>	
		<div class="col-md-6" align="right"> <!--픽 이미지 2 
			<img id="pick2" src="/pickme/resources/images/img_sample2.jpg" />
		</div>
		</div> -->
	</section>
	
<!-- 	<div class="row" align="center">
		
		<div class="col-md-4" align="center"> <!--픽 이미지 1
			<img id="pick1" src="/pickme/resources/images/img_sample1.jpg"
			 />
		</div>	
		<div class="col-md-4" align="center"> <!--픽 이미지 2
			<img id="pick2" src="/pickme/resources/images/img_sample2.jpg" />
		</div>
		
	</div>	
	 -->
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
	  var captionText = document.getElementById("caption");
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
	
	</script>
	


<%@ include file="../common/footer.jsp" %>
</body>
</html>