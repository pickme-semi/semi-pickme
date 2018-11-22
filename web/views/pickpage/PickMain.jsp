<%@page import="com.pick.model.vo.PickMe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
   ArrayList<PickMe> plist = (ArrayList<PickMe>)request.getAttribute("list");
   User u = (User)session.getAttribute("user");
   int gg = 0; // 픽 ID
   int leftResult= 0;
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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

/* 사용자 정보랑 넣기 */
.alphago {
  display: none;
}

/* 썸네일 눌렀을때 손가락으로 나오게하는것 */
.cursor {
  cursor: pointer;
}


/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #ffb8d8;

  color: white;
   border-radius: 10px;
 
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
  display : none;
}

.attr {
    height: 50px;
    position: relative;
    width: 50px;
}
.active,
.demo:hover {
  opacity:5;
}

/* 클릭시 하트보이게 하기 */
/* 이미지 흐리게 하기 우선 이걸로 */


.imgSize{
   width : 500px;
   height : 500px;
   magin-top : auto;
   magin-bottom: auto;
}


.thetagoLeft{
   opacity : 0.6;
   position:relative;
   

}
.hojitextLeft{
position:absolute;
    top:193px;
    left:63px;
   font-size: xx-large;
   display:none;

}
.thetagoRight{
   opacity : 0.6;
   position:relative;

}

.hojitextRight{
position:absolute;
    top:193px;
    left:95px;
   display:none;
 font-size: xx-large;
}

.alphaLeftColor{
   color : #ff82bb;
   font-weight:bold;
   font-size: 200%;
}
.alphaRightColor{
   color :  #ff82bb;
   font-weight:bold;
   font-size: 200%;
}
.capId{
color : white;
font-weight:bold;
font-size: large;
}
.capContent{

font-size: xx-large;
color : #f2f2f2;
}

.capButton{
   color :  #ff82bb;
   background-color: white; 
   border-color: #ff82bb;
    font-weight:bold;
      border-radius: 10px;
}
.capButton:hover {
   color :  white;
   background-color: #ff82bb; 
   border-color: #ff82bb;
    font-weight:bold;
      border-radius: 10px;
}
.leftMainImg{
   border-color: red;
   
    border-left: 1px solid #ff82bb;
}
.rightMainImg{
   border-color: red;
   
    border-right: 1px solid #ff82bb;
}
.thumgnailStyle{
 border-color: red;
      border-radius: 10px;
    border: 1px solid #ff82bb;
}
.uploadButton{
   color :  #ff82bb;
   background-color: white; 
   border-color: #ff82bb;
    font-weight:bold;
      border-radius: 10px;
      font-size: -webkit-xxx-large;
      
}
.uploadButton:hover {
   color :  white;
   background-color: #ff82bb; 
   border-color: #ff82bb;
    font-weight:bold;
      border-radius: 10px;
         font-size: -webkit-xxx-large;
}
.vsP{
position:absolute;
    top:193px;
    left:60px;
    font-size: -webkit-xxx-large;
    font-weight:bold;
    color : #ff82bb;
    
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
      System.out.println("plist.size()==="+plist.size());
   %>
           <div class="caption-container" align="center">
   
        <div class="alphago">
        
        <% //유저 사진 %>   
        <div class="new">
      <img src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr"/>
      <% //PM_PICK_TB을 수정해서 UserId도 가져와야 여기다 넣을수 있을것같다. %>
       <p class="capId"id="contentId<%=i%>"><%= pData.getUserId() %></p>
       </div>
       <% //내용만 우선넣기 %>
       <p class="capContent" id="content<%=i%>"><%= pData.getContent() %></p>
        <input type="hidden" id="resultPickId" name="pid" class="current" value="<%= gg %>"/> 
        
           <form method="post" action="<%= request.getContextPath() %>/pickview.pv?Pid=<%=gg %>">
            <input type="hidden" id="selectUserNo" value="<%= u.getUserNo() %>"/> 
            <input type="hidden" id="resultPickId" name="Pid"  class="current" value="<%= gg %>"/> 
            <input class="capButton" type="submit" value="Pick Detail page" />   
            <br><br>
   </form>
        </div>
       
     </div>
            <input type="hidden" id="selectUserNo" value="<%= u.getUserNo() %>"/> 
            <input type="hidden" id="resultPickId" name="Pid"  class="current" value="<%= gg %>"/> 
   
     <!-- Full-width images with number text -->
   <div class="container " >    
      <div class="mySlides" style="background-color : white">          
           <div class="row" align="center">
      <div class="leftMainImg col-md-5" align="center" >
         <img class="aaLeft imgSize" id="leftPick<%=i+1%>" onerror="imgError(this);" 
         src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_1() %>" 
         style="width:100%" onclick="checkNumber(<%=gg%>, <%= i %>);hojiTestLeft(<%=i%>);
     "/>

         <div class="hojitextLeft" >
         <p class ="alphaLeftColor" id="leftP<%=i%>"></p></div>
      </div>   
        <div class="col-md-2" align="center"><p class="vsP">VS</p></div>
      <div class="rightMainImg col-md-5" align="center" style="background-color : white"> 
         <img class="aaRight imgSize" id="rightPick<%=i+1 %>" 
         src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_2() %>" 
         style="width:100%"onclick="checkNumber(<%=gg%>, <%= i %>);hojiTestRight(<%=i%>);"/>
           <div class="hojitextRight" >
         <p class ="alphaRightColor" id="rightP<%=i%>"></p></div>
      </div> 
      </div>
      </div> 
       </div>
   <% } %>
    
    <script>
    var checkN;
    var index;
    function checkNumber(a, i)
      {
        index = i;
         checkN =a;
         console.log('%d는 숫자 %d는 다음숫자', a, checkN);
      }   
       var countLeft = 1;
       var countRight =2;
      // img의 id에 pick 있으면 선택하기 
   /* $('img[id^="leftPick"]').click(function(){
       console.log("수정값"+checkN);
          alert("왼쪽클릭");
      });*/
    $('img[id^="leftPick"]').click(function(){
         $.ajax({
            url : "/pickme/pickresult.pr",
            type : "get",
            data : {
               selectUserNo : $('#selectUserNo').val(),
               resultPickId : checkN,
               selectResult : countLeft
               
            }, success : function(data){
               // 선택한후 몇%의 값인지 우선 전달완료
               console.log("데이터 전달 성공!"+data);
               leftResult = "♥ "+data+"%";
               console.log("leftResult값이 나오는지 봐보자 ="+leftResult);
               $('#leftP'+index).text(leftResult);
               
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
   
      /*$('img[id^="rightPick"]').click(function(){
       console.log("수정값"+checkN);
          alert("오른쪽클릭");
      });*/
    $('img[id^="rightPick"]').click(function(){
         $.ajax({
            url : "/pickme/pickresult.pr",
            type : "get",
            data : {
               selectUserNo : $('#selectUserNo').val(),
               resultPickId : checkN,
               selectResult : countRight
               
            }, success : function(data){
                console.log("데이터 전달 성공!"+data);
                 rightResult = "♥ "+data+"%";
                 console.log("right값이 나오는지 봐보자 ="+rightResult);
                 $('#rightP'+index).text(rightResult);
                 
               
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
     <div class="thumgnailStyle">
      <% for(int i =0; i<plist.size(); i++){   pData = plist.get(i); %> 
       <div class="column">
      <img class="demo cursor" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_1() %>"
       style="width:200%" onerror="imgError(this);"  onclick="currentSlide(<%=i+1 %>)">
    </div>
    <div class="column">
      <img class="demo cursor" src="<%= request.getContextPath() %>/resources/PickUploadFiles/<%=pData.getSelect_2() %>" 
       style="width:200%" onerror="imgError(this);" onclick="currentSlide(<%=i+1 %>)" >
    </div>
       <% } %>   
       </div>    
      </div>  
   
   
   
   
    
    
    <div  align="center">
          <br><br>
         <button class="uploadButton" type="button" onclick="location.href='/pickme/pcate.pm'">Pick Upload</button>            
            <br><br>
      </div>

   
         
   </section>
   
      <br><br><br>
      
      
      
      
      
      <br><br><br>
      
   
   </section>
   
   <% }else { %>
   <span> 현재 업로드 된 pick 데이터가 없습니다.</span>
   <% } %>
   
   
      <script>
      
      // 처음은 1로 시작해놓는다   
      var slideIndex = 1;
      var checkNum = 0;
           
           function hojiTestLeft(n){
              var ganziLeft = n;
              var aaLeft = document.getElementsByClassName("aaLeft");
              var hojitextLeft = document.getElementsByClassName("hojitextLeft");
              hojitextLeft[n].style.display = "block";
              aaLeft[n].className += " thetagoLeft";
              setTimeout(function(){
                 plusSlides(ganziLeft+1);
               }, 500);


           }
           function hojiTestRight(n){
              var ganziRight = n;
              var aaRight = document.getElementsByClassName("aaRight");
              var hojitextRight = document.getElementsByClassName("hojitextRight");
              hojitextRight[n].style.display = "block";
              aaRight[n].className += " thetagoRight";
              setTimeout(function(){
                 plusSlides(ganziRight+1);
               }, 500);


           }
           
      showSlides(slideIndex);
   
      function plusSlides(n) {
        showSlides(slideIndex = n+1);
      }

      function currentSlide(n) {
        showSlides(slideIndex = n);
      }

      function showSlides(n) {
         var i;
           // 슬라이드
           var slides = document.getElementsByClassName("mySlides");
           // 썸네일
           var dots = document.getElementsByClassName("demo");
           // 사용자정보 내가할것
           var alphago = document.getElementsByClassName("alphago");
         
           
           // 우선 하드코딩해놓긴했지만 알고리즘으로 작성해보겠습니다.. 조만간.   
           var checkLength = dots.length;
           
         //  console.log("n의 올림 값 = "+Math.floor(n/6));
         //  console.log("n의 기본 값 = "+n);
           checkNum = (Math.ceil(n/6)-1)*12;
              //console.log("checkNum 의 값 0 = "+ checkNum)
           if( checkNum !=0)
           {
              console.log("checkNum 의 값 1 = "+ checkNum)
              for (i =checkNum-12; i < checkNum; i++) {
                  dots[i].style.display = "none";
               }
           }
           // 12개만 보이게 하기
           for (i =checkNum; i < checkNum+12; i++) {
                if( i>= checkLength)
                   {
                      break;
                   }
              //console.log("checkNum 의 값 3333333 = "+ i)
              dots[i].style.display = "block";
           }
        
           
           // 무한이 아니니깐 아직 6이나온다.
          // console.log('slides길이 = '+slides.length);
           
           // 캡션의 길이도 우선 6이다.
          // console.log('captionText길이 = '+alphago.length);
           
           // 우선 12개 나온다 이거 수정해야한다
         
          // console.log('dots길이 = '+dots.length);
           
           // 우선 썸네일의 12개 길이먼저 뽑아보자
         //  console.log('betago길이 = '+betago.length)
           
           // 슬라이드 끝에가면 다시 처음으로 보내기 
           if (n > slides.length) {slideIndex = 1}
           
           // 이런경우도 없음
           if (n < 1) {slideIndex = slides.length}
           
           // 슬라이드지정된거 이외 안보이게하기
           for (i = 0; i < slides.length; i++) {
               slides[i].style.display = "none";
           }
           // 캡선도지정된거 이외는 안보이게
           for (i = 0; i < alphago.length; i++) {
              alphago[i].style.display = "none";
           }
         
           
           // 이거 사진 모두 비 활성화
           for (i = 0; i < dots.length; i++) {
               dots[i].className = dots[i].className.replace(" active", "");
              // dots[i].style.display = "block";
               
           }
           
           // 슬라이드  보이게하기
           slides[slideIndex-1].style.display = "block";
          
           // 캡션 보이게하기
           alphago[slideIndex-1].style.display = "block";
           
           //섬네일 두개다 활성화시키기
           dots[(slideIndex-1)*2].className += " active";
           dots[(slideIndex*2)-1].className += " active";
      }
      
      </script>
      
      
   
   
   <%@ include file="../common/footer.jsp" %>

<% } %>
</body>
</html>