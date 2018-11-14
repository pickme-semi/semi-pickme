<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import ="com.user.model.vo.*, java.util.*,
	com.pick.model.vo.*" %>
<%
	User u = (User)session.getAttribute("user");
	ArrayList<PickCategory> category = 
			(ArrayList<PickCategory>)request.getAttribute("pcArr");	
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 업로드 페이지</title>
<!-- select2 소스  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
 <!-- <link rel="stylesheet" type="text/css" href="../../resources/css/pickupload.css" /> 
 사용 안하는 CSS/ 삭제해도 될듯. -->
 
<!--  제이쿼리 파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- <link rel="stylesheet" href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">
<script src="/pickme/resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script> -->

	
<!-- 업로드 이미지 미리보기 구현. -->
<script type="text/javascript">
		<!-- 첫번째 사진 미리보기 -->
      /*   $(function() {
            $("#up1").on('change', function(){
                readURL(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();	
            reader.onload = function (e) {
                    $('#pick1').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }        
        <!-- 두번째 사진 미리보기  -->
        $(function() {
            $("#up2").on('change', function(){
                readURL2(this);
            });
        });
        function readURL2(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#pick2').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        } */
       /*  $(document).ready(function() {            
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
        }); */ 
        
     /*    $('#uploadpick').submit(function(event){
        	
        	if(!fileCheck()) event.preventDefault();
        	
        });
         */
     function fileCheck(obj){
        	// var file = document.uploadpick.pick.value;
        	
        	var file = $(obj).val();
        	var fileExt = file.substring(file.lastIndexOf('.')+1);
        	
        	if(fileExt.toLowerCase() == "jpg" || fileExt.toLowerCase() ==  "png"
        		|| fileExt.toLowerCase()== "jpeg" || fileExt.toLowerCase()== "gif"){
        		return true;
        	}else {
        		alert("jpg,png,jpeg,gif 파일만 등록 가능합니다.");
        		var file = $(obj).val("");
        		return false;
        	}
     }
      
    </script>

<style>
#pick1 {
	/*픽 이미지 1 크기 조절 */
	width: 200px;
	height: 200px;
}

#pick2 {
	/*픽 이미지 2 크기 조절 */
	width: 200px;
	height: 200px;
}
	
</style>


</head>

<body>

	<%@ include file="../common/header.jsp"%>
	
	<% if(session.getAttribute("user") != null) { %>
	<div class="outer" align="center" >
		<br>
		<h2 align="center">Pick 올리기</h2>
		<div class="col-md-8 col-xs-12">
			<form name = "uploadpick" id="uploadpick" action="<%= request.getContextPath() %>/pickup.pm" 
			method="post" encType="multipart/form-data">
			
				<table>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text"
							style="width: 100%; height: 100%;" name="title" required="required"></td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td colspan="3"> 
						<%= u.getUserName() %>
							 <input type="hidden" name="userId"
							value="<%= u.getUserNo() %>" />																					
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="3"><input type="file" name="pick" id="up1" required="required"
						onchange="fileCheck(this);" /> 
						
						<img id="pick1" src="#" alt=""/></td>
					</tr>
					<tr>
						<td>첨부파일2</td>
						<td colspan="3"><input type="file" name="pick" id="up2"
						onchange="fileCheck(this);"  required="required"/> 
						
						<img id="pick2" src="#" alt="" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
						<textarea name="content" style= "width: 100%; height: 100%;" required="required"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<!-- <label for="category">카테고리 선택</label> 
				<br><br> 
				<input type="radio" name="category" value="tour" checked /><span>여행</span>
				<input type="radio" name="category" value="sports" /><span>운동</span>
				<input type="radio" name="category" value="food" /><span>요리</span>

				<br>
				<br>
				<span id="viewTourCategory"> 여행 카테고리: 
				<select	class="form-control tourMainCategory"
				 name="tourtMainCategory" style="width: 200px">
				 		<option value="1">전체</option>
						<option value="2">국내여행</option>
						<option value="3">해외여행</option>
				</select>
				</span>
				<span id="viewSportCategory" style="display: none"> 스포츠 카테고리: 
				<select class="form-control sportsMainCategory"
				 name="sportsMainCategory" style="width: 200px">
						<option value="1">전체</option>
						<option value="2">실내운동</option>
						<option value="3">야외운동</option>
				</select>
				</span> <span id="viewFoodCategory" style="display: none"> 음식 카테고리:
				<select class="form-control foodMainCategory"
				name="foodMainCategory" style="width: 200px">
					<option value="1">전체</option>
					<option value="2">한식</option>
					<option value="3">일식</option>
					<option value="4">중식</option>
				</select>
				</span> -->
				<br>
				<label>마감일 설정 </label>
				<input type="date" name="ddate" value="" required="required">
				<br>
		<br><br>		
		<table>
		<tr>
		<td > 카테고리 <br /></td>
		<td style="width : 75%">		
		<select class="interest-multiple" name="interest" data-placeholder="Select an option" multiple="multiple"
		style= "width: 75%" required="required" > 
		<% for(int i=0; i< category.size(); i++) {%>
  			<option value="<%=category.get(i).getCategoryid()%>"><%=category.get(i).getCategoryName()%></option>
  		<% } %> 
		</select>
		</td>
		<td></td>
				</tr>
			</table>	
			
				<!-- 
				<br> <label>보유 포인트</label><input type="text"
					placeholder="현재포인트" /> <br>
				<br>
				

				<label>사용할 포인트</label> <input type="number" min="10" max="1000"
					value="10" step="10" />
				 
				 포인트 사용구간, 일단 사용하지 않을듯 하여 우선 주석처리해둠.
				 -->				 
					
			<br>
			<br>
			<div align="center">
				<button type="submit">작성완료</button>
				<button type="reset">취소</button>
			</div>

			</form>

			

		</div>
	</div>
	<% } else {
		request.setAttribute("msg", "회원만 열람 가능합니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} %>

	<br>
	<br>
<script>
	/* select2 사용을 위한 메소드 */
	
	/* select2 값 가져오기 위한 메소드 */	
	


</script>	



<%@ include file="../common/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script>
	/* select2 사용을 위한 메소드 */
	
	$(function(){
		$('.interest-multiple').select2({
			width: 'resolve'
		});
		
	});
	/* select2 값 가져오기 위한 메소드 */
	
	
	
	
</script>	 -->
</body>
</html>