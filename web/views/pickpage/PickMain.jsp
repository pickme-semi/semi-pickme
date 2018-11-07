<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 선택 페이지 Main</title>
</head>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 업로드 이미지 미리보기 구현. -->
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