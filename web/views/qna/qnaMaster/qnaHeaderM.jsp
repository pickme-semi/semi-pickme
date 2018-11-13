<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- 관리자 전용 QNA 페이지 헤더 -->


<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="../../../resources/css/qna.css">        
<script src="../../../resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="../../../resources/js/jquery-3.3.1.min.js"></script>


</head>
<body>
	<header>
		      <nav class="shortcuts">
            <p>관리자 전용 QNA 페이지</p>
            
            <ul class="itemList">
          
                <li class="item1">
                    <a class="itemHead"><i class="icon"></i>문의 관리</a>
                    <span>
                        <a id="qQuestion">문의 확인</a><br>
                        <a id="qReport">신고 확인</a><br>
                    </span>					
                </li>
                <li class="item2">
                    <a   class="itemHead"><i class="icon"></i>QNA 관리</a>
                    <span>
                        <a id="qnaUpdate">QNA 작성</a><br>
                        <a id="qnaList">QNA 목록</a><br>
                    </span>				
                </li>
                <li class="item3">
                    <a class="itemHead"><i class="icon"></i>여기는</a>
                    <span>
                        <a id="qPointE">아직</a><br>
                        <a id="qPointU">고민 중</a><br>
                    </span>			
                </li>
                <li class="item4">
                    <a class="itemReHead"><i class="icon"></i>여기도</a>
                    <span>
                        <a id="qReport">아직</a><br>
                        <a id="qQna">고민 중</a><br>
                    </span>				
                </li>
            </ul>
        </nav>		<!-- shortcuts -->
        


	<script>

	/* Header */

	$(function(){
		$("#qQuestion").click(function(){
			location.href="qnaUserByM.jsp";
		});
		
		$("#qReport").click(function() {
			location.href="qnaUserByM.jsp";
		});
		
		$("#qnaUpdate").click(function() {
			location.href="qnaUpM.jsp";
		});
		$("#qnaList").click(function(){
			location.href="/pickme/qnaList.no/";
		});
	});

</script>
	</header>
	
	
	
</body>

</html>
