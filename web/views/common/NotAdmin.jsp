<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/pickme/resources/css/pm-common.css" />
<style>
*{
	background : ;
}
h1{
	font-size :  80px;
	color : red;
}
h2{
	font-size :  40px;
	color : red;
}
</style>
</head>
<body>
<div class="pm-err-404">
		<div align="center">
			<br><br><br><br><br><br>
			<h1>404</h1>
			<h2>Sorry, this URL does not exist or is no longer available.</h2>
			<div align="center">
			<div style="align:left;">NOT ADMIN<br>
				페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다. <br />
				<br />
				입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다. <br />
				관련 문의사항은  <a href="/pickme/list.bo">고객센터</a>에 알려주시면 친절하게 안내해 드리겠습니다. <br />
				<br />
				감사합니다.
			</div>
			</div>
			<h4><a href="#" onclick="goback();">뒤로가기</a></h4>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	</div>
	
	<script>
		function goback(){
			history.go(-1);
		}
		
	</script>
</body>
</html>