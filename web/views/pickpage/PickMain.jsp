<%@page import="com.pick.model.vo.PickMe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<PickMe> plist = (ArrayList<PickMe>)request.getAttribute("list");
	User u = (User)session.getAttribute("user");
	int gg = 0; // 픽 ID
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

body {
  font-family: Arial;  /*글꼴 수정 Arial 고딕체 계열 */
  margin: 0;  
}

* {
  box-sizing: border-box;   /* 테두리를 포함한 크기를 지정할 수 있다 */
}

img{
  vertical-align: bottom;   /* 인라인요소의 수직 정렬 */
   width: 100%;
    object-fit: contain;
    
}
/* .클래스명 모든 container의 요소를 선택한다.
   #id명  문서내 주어진 id를 갖는 요소 유일해야한다.
    * 모든 선택자

*/
/* relative 로 해놓으면
   left: 5px; right: 5px;   bottom :5px; 등으로 위치변경가능 하다 
   absolute d
*/
.container {     
  position: relative;
}

/* Hide the images by default */
/* Display 는 속성의 요소를 보여주는것이다. none 보이지않음 */
.mySlides {
  display: none;
}

/* 썸네일 눌렀을때 손가락으로 나오게하는것 */
.cursor {
  cursor: pointer;
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
  width: 8.33%;

}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
  max-width: 100%;
  height: auto !important;
}

.active,
.demo:hover {
  opacity:5;
}

</style>

<link rel="stylesheet" href="/pickme/resources/bootstrap-4.1.3/css/bootstrap.min.css">
<script src="/pickme/resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>


<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else{ %>
	<%@ include file="../common/header.jsp" %>
					
	<section class="col-xs-12 col-md-8">
		
<section class="col-xs-12 col-md-12">
	<% 
	PickMe pData = new PickMe();
	if(plist != null){
	for(int i =0; i<plist.size(); i++){
	    pData = plist.get(i);
	 	gg = pData.getId();
	%>
	<form method="post" action="<%= request.getContextPath() %>/pickview.pv">
	      	<input type="hidden" id="selectUserNo" value="<%= u.getUserNo() %>"/> 
	      	<input type="hidden" id="resultPickId" name="Pid"  class="current" value="<%= gg %>"/> 
	      	<input type="submit" value="픽 상세 <%= gg %>" />	
	</form>
	  <!-- Full-width images with number text -->
	<div class="container " >	 
	   <div class="mySlides" style="background-color : blue">          
	        <div class="row" align="center">
		<div class="col-md-6" align="center" style="background-color : pink" >
			<img id="pick1" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_1() %>" 
			style="height:auto" onclick="plusSlides(<%=i+1%>);checkNumber(<%=gg %>);"  />
		</div>	
		<div class="col-md-6" align="center" style="background-color : green"> 
			<img id="pick2" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_2() %>" 
			style="width:100%"onclick="checkNumber(<%=gg %>);plusSlides(<%=i+1%>);"/>
		</div>
		</div> 
	    </div>
	  </div>
	<% } %>
	 
	 <script>
	 		
	 	var countLeft = 2;
		var hoji = "dddd";
	
	 $("#pick1").click(function(){
		 console.log(countLeft);
		    alert("The paragraph was clicked.");
		});
	 $("#pick1").click(function(){
			$.ajax({
				url : "/pickme/pickresult.pr",
				type : "get",
				data : {
					selectUserNo : $('#selectUserNo').val(),
					resultPickId : $('#resultPickId').val(),
					selectResult : countLeft,
					hoji : hoji
				}, success : function(data){
					console.log("데이터 전달 성공!");
					
					// 게시글 내용도 같이 추가해야 함
					// 예시 : $('.caption-container p').text(data.content);
					
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
	 
	 </script>
	
	
	  <div class="row" >
	   <% for(int i =0; i<plist.size(); i++){
	    pData = plist.get(i);%> 
	    <div class="column">
      <img class="demo cursor" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_1() %>"
       style="width:200%"  onclick="currentSlide(<%=i+1 %>)">
    </div>
    <div class="column">
      <img class="demo cursor" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_2() %>" 
       style="width:200%" onclick="currentSlide(<%=i+1 %>)" >
    </div>
	    <% } %>	    
	   </div>  
	
	
	
	
	  <div class="caption-container" align="center">
	   <% 
	for(int i =0; i<plist.size(); i++){
		if(plist.get(i).getId() == gg){
			pData = plist.get(i);
	%>
		<%-- <img src="/pickme/resources/profileImage/<%= user.getProfile() %>"/> --%>
	    <p id="content<%=i%>"><%= pData.getContent() %></p>
	    <input type="hidden" id="resultPickId" name="pid" class="current" value="<%= gg %>"/> 
	  
	  <% } } %> 	
	  </div>
	 

	
			
	</section>
	
		<br><br><br>
		
		
		<div class="col-xs-12 col-md-8" align="center" >
			<button type="button" onclick="location.href='/pickme/pcate.pm'">픽 업로드</button>			
			
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
	</section>
	
	<% }else { %>
	<span> 현재 업로드 된 pick 데이터가 없습니다.</span>
	<% } %>
	
	
		<script>
		function checkNumber(a)
		{
			var checkN =a;
			console.log('%d는 숫자 %d는 다음숫자', a, checkN);
		}
		// 처음은 1로 시작해놓는다	
		var slideIndex = 1;
		showSlides(slideIndex);
	
		function plusSlides(n) {
		  showSlides(slideIndex = n+1);
		}

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

<% } %>
</body>
</html>