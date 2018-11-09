<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="../../resources/css/qna.css">        
<script src="../../resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="../../resources/js/jquery-3.3.1.min.js"></script>

</head>
<body>

	
	<header>
		
		<button id="mainBt">메인 화면</button>
		<button id="MMainBt">관리자 센터</button>	
		      <nav class="shortcuts">
            <p>고객센터 무엇이든 물어보세요</p>
            
            <ul class="itemList">
          
                <li class="item1">
                    <a class="itemHead"><i class="icon"></i>회원정보</a>
                    <span>
                        <a id="qMember">가입/탈퇴</a><br>
                        <a id="qLogin">로그인</a><br>
                    </span>					
                </li>
                <li class="item2">
                    <a   class="itemHead"><i class="icon"></i>PICK</a>
                    <span>
                        <a id="qPick">PICK 이용</a><br>
                        <a id="qReport">신고제도</a><br>
                    </span>				
                </li>
                <li class="item3">
                    <a class="itemHead"><i class="icon"></i>POINT</a>
                    <span>
                        <a id="qPointE">포인트 적립</a><br>
                        <a id="qPointU">포인트 사용</a><br>
                    </span>			
                </li>
                <li class="item4">
                    <a class="itemReHead"><i class="icon"></i>1:1 문의</a>
                    <span>
                        <a id="qReport">이용자/게시글 신고</a><br>
                        <a id="qQna">1:1 문의</a><br>
                    </span>				
                </li>
            </ul>
        </nav>		<!-- shortcuts -->
        


	<script>

	/* Header */

	$(function(){
		$(".itemHead").click(function(){
			location.href="qnaList.jsp";
		});
		
		$(".itemReHead").click(function() {
			location.href="qnaReport.jsp";
		});
		
		$("#qReport").click(function() {
			location.href="qnaReport.jsp";
		});
		$("#qQna").click(function(){
			location.href="qnaUp.jsp"
		});
	});
	
	$(function(){
		$("#mainBt").click(function() {
			location.href="../main/main.jsp";
		})
		$("#MMainBt").click(function(){
			location.href="qnaMainM.jsp";
		})
	})

</script>
	</header>
	
	
	
</body>

</html>
