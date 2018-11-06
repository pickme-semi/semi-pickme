<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 업로드 페이지</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/pickupload.css" />
<!-- 제이쿼리 파일 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 업로드 이미지 미리보기 구현. -->
<script type="text/javascript">
		<!-- 첫번째 사진 미리보기 -->
        $(function() {
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
        
        <!-- 두번째 사진 미리보기 -->       
        
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
        }
    </script>
    <<style>
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

<div class="outer" align="center">
	<br>
	<h2 align="center">Pick 올리기</h2>
	<div class="col-md-12">
		<form action="<%=request.getContextPath()%>/bInsert.bo"
			method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text"
						style="width: 100%; height: 100%;" name="title"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="3"><input type="hidden" name="userId" value="" />
					</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3"><input type="file" name="up1" id="up1" /> <img
						id="pick1" src="#" alt="미리보기1" /></td>
				</tr>
				<tr>
					<td>첨부파일2</td>
					<td colspan="3"><input type="file" name="up2" id="up2" /> <img
						id="pick2" src="#" alt="미리보기2" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea name="content"
						style="width: 100%; height: 100%;">
					</textarea></td>
				</tr>
			</table>
			<br>
			<label for="category">카테고리 선택</label>
			<br><br>
			<div id="category" style="display:inline-block; text-align: center;">
				<ul>
					<li class="main"><a href="#">카테고리1</a>
						<ul>
						<li class="sub"><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
					<li class="main"><a href="#">카테고리2</a>
					<ul>
						<li><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
					<li class="main"><a href="#">카테고리3</a>
					<ul>
						<li><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
					<li class="main"><a href="#">카테고리4</a>
					<ul>
						<li><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
						<br><br>
						
					<li class="main"><a href="#">카테고리5</a>
					<ul>
						<li><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
					<li class="main"><a href="#">카테고리6</a>
					<ul>
						<li><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
					<li class="main"><a href="#">카테고리7</a>
					<ul>
						<li><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
					<li class="main"><a href="#">카테고리8</a>
					<ul>
						<li><a href="#">서브카테고리1</a></li>
						<li><a href="#">서브카테고리2</a></li>
						<li><a href="#">서브카테고리3</a></li>
						<li><a href="#">서브카테고리4</a></li>
						<li><a href="#">서브카테고리5</a></li>
						<li><a href="#">서브카테고리6</a></li>
						</ul>
						</li>
					</ul>
				</div>
				
				<br><br>				
				
            <label>마감일 설정 </label><input type="datetime-local">
            <br><br>
            
            <label>보유 포인트</label><input type="text" placeholder="현재포인트"/>
            <br><br>
            <!--  -->
            
            <label>사용할 포인트</label>
            <input type="number" min="10" max="1000" value="10" step="10"/>
            
				
			</form>			
						
			<br><br><br>
			<div align="center">
					<button type="submit"> 작성완료 </button>
                    <button type="reset"> 취소 </button>
			</div>
			
			
		</div>
	</div>
	
	<br><br>


	<%@ include file="../common/footer.jsp"%>
</body>
</html>