<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="../../../resources/css/qna.css">
 <script src="../../../resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
 <script src="../../../resources/js/jquery-3.3.1.min.js"></script>
 <script src="../../../resources/js/qna.js"></script>


</head>
<body>


<!-- 관리자 전용 QNA 페이지  -->
<!-- QNA 업데이트 전용 페이지 -->



                     <div id="wrap">
        
     
                <div id="hyrendContentBody" style="height: 1658px;">
                
        <article id="container" class="mnHelpdesk pgHelpdeskHome">
            <div class="innerContainer">
  
                <%@ include file="qnaHeaderM.jsp"  %>
    
    
                <div class="contentBody">
                
                
        <div class="contentBody" style="width:770px; padding:10px 130px 100px;">       
                    
                    <section class="innerContent faq">
                           <div id="gocont" class="content">

            <h1 style="font-size:30px;">QnA 작성 페이지</h1>               
            <p class="desc_vt">&nbsp;</p>
            <p class="ess mt"><span class="bl_ess">필수</span>항목은 <em>필수입력</em> 항목입니다.</p>
            <form id="inquiryForm" name="inquiryForm" method="post" action="<%= request.getContextPath() %>/qUpdate.no" enctype="multipart/form-data">

                
                <fieldset>
                    <legend class="blind">QnA 작성 폼</legend>
                    <div class="tbl inplist">
                        <table>
                            <caption><span>qna 작성</span></caption>
                            <colgroup><col style="width:170px"><col style="width:540px"></colgroup>
                            <tbody id="categoryBody">
                                <tr>
                                    <th scope="row">
                                        <label for="categoryArea" class="thin_ic">
                                            <span class="bl_ess">필수</span>
                                            문의유형<br><br>
                                        </label>
                                    </th><br>
                                    <td>
                                        
                                        <div id="categoryArea" style="overflow: hidden;">
                                            <span class="sel" style="width: 198px;">
                                                <select id="upperCategory" name="category">
                                                    <option value="BOT001">QNA 유형</option>
                                                
                                                    <option value="BOT001">가입/탈퇴</option>
                                                
                                                    <option value="BOT001">로그인</option>
                                                
                                                    <option value="BOT002">PICK이용</option>
                                                
                                                    <option value="BOT002">신고제도</option>
                                                
                                                    <option value="BOT003">포인트 적립</option>
                                                    
                                                    <option value="BOT003">포인트 사용</option>
                                                    
                                                    <option value="BOT001">기타</option>
                                                
                                                </select>
                                            </span> <br>
                                        </div> <br>
                                        
                                        
                                    </td>
                                </tr>
                            </tbody>
                            <tbody id="itemBody">
                            <tr class="itemArea EMAIL" sort="1" itemno="4" requiredyn="Y" inputlength="70">
       
        	<td>
   
 			<tr class="itemArea TEXT" sort="2" itemno="5" requiredyn="Y" inputlength="100" datatype="CHAR"> 
        <th scope="row">
            <label for="inquiryTitle" class="thin_ic">
                <span class="bl_ess">필수</span>
                <span class="itemExpression">QNA 제목</span><br><br>
            </label>
        </th>
        <td>
            <div class="pr">
                <span class="help_txt"></span>
                <input type="text" id="inquiryTitle" class="contents inp" style="width:462px" maxlength="100" name="title">
            </div>
        </td>
    </tr><tr class="itemArea HTML" sort="3" itemno="13" requiredyn="Y">
        <th scope="row">
            <label for="inquiryContent" class="thin_ic">
                <span class="bl_ess">필수</span>
                <span class="itemExpression">QNA 내용</span><br><br>
            </label>
        </th>
        <td>
            <div class="pr">
                <textarea id="inquiryContent" 
                class="contents inp" cols="30" rows="4" maxlength="5000" style="width:482px; height: 300px"></textarea>
                <p class="rei"><span class="bytes">0/5000글자</span></p>
                <input type="hidden" class="guideContent" value="">
                <input type="hidden" class="guideDisplayYN" value="N">
                <input type="hidden" class="guideInitializeYN" value="Y">
                <input type="hidden" class="itemNo" value="13"><br>
            </div>
        </td>
    </tr><tr class="itemArea HIDDEN" sort="4" itemno="2" requiredyn="N" style="display: none;">
        <td colspan="2">
            <input type="hidden" id="customerMemberID" class="contents" value="">
            <input type="hidden" class="itemNo" value="2">
        </td>
    </tr><tr class="itemArea PHONE" sort="5" itemno="8" requiredyn="N" inputlength="30">
        <th scope="row">
           
        </th>
        <td>
            
                        
            	 <div class="bn_wrap v2" style="margin:0 auto; width:50%; ">
                <span class="bn bn_big bn_rd"><button type="button" class="qnaBt" id="btnSend" >확인</button></span>
                
                <span class="bn bn_big bn_bk"><button type="reset" class="qnaBt">취소</button></span>
            </div>
             
            
            
           
            

							</tbody>
                        </table>
                    </div>
                </fieldset>
            </form>
            
            <br>

        </div>
                    </section>
                   


    </div>
    </div>
    </div>
    </article>
    </div>
    </div>
    
    <script>
    
    


		
		$('#btnSend').click(function(){
			 var QnaData = new Object();
			
			
			QnaData.title = $('#inquiryTitle').val();
			QnaData.content = $('#inquiryContent').val(); 
			QnaData.category = $('#upperCategory').val();
			
			$.ajax({
				url : "/pickme/qUpdate.no",
				type : "get",
				data : QnaData,
				success : function(data) {console.log("성공");},
				error : function(request, status, error) {console.log("실패");},
				complete : function(){ console.log("무조건 실행하는 함수"); }
			});
			
		});
		

			

	
			
		
	
		



	/* 글자수 세기 */
	$(function() {
		$('#inquiryContent').keyup(function() {
			bytesHandler(this);
		});
	});

	function getTextLength(str) {
		var len = 0;

		for (var i = 0; i < str.length; i++) {
			if (escape(str.charAt(i)).length == 6) {
				len++;
			}
			len++
		}
		return len + ' / 5000';
	}

	function bytesHandler(obj) {
		var text = $(obj).val();

		$('.bytes').text(getTextLength(text));
	}
	
	

	$(function(){
		$('#btnRe').click(function(){
			if(confirm('취소확인') == true){
				location.href="qnaMain.jsp";
				}
		});
	});

</script>
    
 </body>
</html>