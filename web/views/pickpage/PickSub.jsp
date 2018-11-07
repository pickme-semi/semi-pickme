<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픽 상세보기 페이지</title>
</head>
   <!-- Bootstrap core CSS -->
    <link href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css" rel="stylesheet">



<style>
#pick1 {
	/*픽 이미지 1 크기 조절 */
	width: 300px;
	height: 300px;
	max-width: 300px;
}

#pick2 {
	/*픽 이미지 2 크기 조절 */
	width: 300px;
	height: 300px;
	max-width: 300px;
}
textarea {
	height : auto;
	overflow : visible;
}

</style>

<body>
	<%@ include file="../common/header.jsp"%>
	
	
	<div class="row" align="center">
		<div class="col-md-12" >
			<h2>pick 제목	</h2>
			<p>
				이러고 저러고 어쩌고 저쩌고 해서 아무튼 이 둘중에 하나 골라주세요.
			</p>			
		<br>
			
		</div>
	</div>
	
	

	<div class="row">
		<div class="col-md-6" align="center">
			<!--픽 이미지 1 -->
			
			<img id="pick1" src="/pickme/resources/images/img_sample1.jpg" 
			onclick="javascript:location.href='PickUpload.jsp';"/>
			<!-- 임시로 아무 링크나 넣어둠. -->
		</div>
		<div class="col-md-6" align="center">
			<!--픽 이미지 2 -->
			<img id="pick2" src="/pickme/resources/images/img_sample2.jpg"
			onclick="javascript:location.href='PickUpload.jsp';" />
			<!-- 임시로 아무 링크나 넣어둠. -->
		</div>

	</div>
	
	<br><br><br>
	
	<div class="progress"> 
				<div class="progress-bar w-50"> 마감까지 OO% </div>
	</div>

	
	
	

	<br><br>
	
	<div class="col-md-12" name="replyarea" >
		<form action="" method="post">
			<table align="center" style="width:100%; height:100%;" >
				<tr>					
					<td><textArea rows="2" cols="100" id="replyContent"
					 name="replyContent" style="width:100%; height:100%;" ></textArea></td>
					<td><button type="submit" id="addReply">댓글 등록</button></td>
				</tr>
				
			<tr class="comment replyList">
				<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="100" rows="2"
					 style="width:100%; height:100%;" readonly="readonly">댓글1</textarea>
					
				</td>
			</tr>			
			</table>
		</form>
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>