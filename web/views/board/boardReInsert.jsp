<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.*" %>

<%
	
	String type = (String)session.getAttribute("bType");
	Board b = (Board)request.getAttribute("board");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>

<style>
#name{background-color: #F0F0F0; font-weight:bold;}
#textBox{padding: 10px;}
.btnTest{ background-color: white; border: 1px solid #DEE2E6; border-radius:0px;
			width: 80px; height: 40px; font-size: 14px; font-weight:bold; }
</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( (session.getAttribute("user") == null)){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else{ %>

	<%@ include file="common/boardHeader.jsp" %>
	
	
	
<div class="pm-section col-xs-12 col-md-8" align="center">
    <form id="insertForm" enctype="multipart/form-data">
        
    
        
        <table class="table table-bordered" style="text-align: center; font-weight:bold;">
         <thead class="thead-light">
        <tr>
             <td id="name" style="width: 120px">카테고리 </td>
             <td style="width: 160px"><span><%= b.getCategoryId() %></span></td>
             <td id="name" style="width: 120px">글쓴이</td>
             <td style="width: 160px"><span><%= b.getUserNo() %></span></td>  
             <td id="name" style="width: 120px">작성일</td>
             <td><span><%= b.getEnrollDate() %></span>
        </tr>
        
        <tr>
        
             <td id="name" >제목 </td>
             <td colspan="5"> <span><%= b.getTitle() %></span></td>

        </tr>							
        <tr> 
             <td colspan="6" class="answer" style="text-align: left;" >
             <div class="inner" >            
             <p id="textBox"><%= b.getContent() %></p>
             </div>
           	 </td>
        </tr>
        </thead>
        </table>	

			<br />
		
        
			
		<div align="center">
		<table class="table table-bordered">
         <thead class="thead-light">		
			<textarea name="content" placeholder="내용" id="content" cols="30" rows="10" class="form-control" required="required"></textarea>
				<p id="errorContent" style="display:none;color:red;">내용을 입력하세요</p>
		</thead>
		</table>	
			
		</div>
			
		<br>	
		<div class="" align="center">
			<button type="button" class=" btnTest" data-toggle="modal" data-target="#successModal" id="succcessBtn">작성</button>&nbsp;&nbsp;
			<button type="button" class="btnTest" data-toggle="modal" data-target="#cancelModal">취소</button>
		</div>
		<br><br>
		
		
		
		</form>
	</div>
	<%@ include file="../common/footer.jsp" %>



<!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">작성 완료</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	게시글 작성을 완료하시겠습니까?
      </div>
      <div class="modal-footer">
	      <button type="button" class="btn btn-primary" id="btnSuccess">예</button>
    	  <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
      </div>
    </div>
  </div>
</div>

<!-- Cancel Modal -->
<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">작성 취소</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         게시글 작성을 취소 하시겠습니까?
      </div>
      <div class="modal-footer">
	      <button type="button" class="btn btn-primary" id="btnCancle">예</button>
    	  <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
      </div>
    </div>
  </div>
</div>

<script>
	$("#title").keypress(function(){
		$("#errorTitle").attr("style", "display:none;color:red;");
	});
	
	$("#content").keypress(function(){
		$("#errorContent").attr("style", "display:none;color:red;");
	});


	
	$("#btnCancle").click(function(){
		cancelBoard();
		location.href = "/pickme/list.bo";
	});

		
	function cancelBoard(){
		$("input").val("");
		$("textarea").val("");
	}
	
	
	 $("#btnSuccess").click(function(){
	      var reData = new Object();
	      
	      reData.bid = '<%=b.getId()%>';
	      reData.content = $('#content').val();
	      
	      $.ajax({
	         url : "/pickme/reInsert.bo",
	         rype : "get",
	         data : reData,
	         success : function(data) { location.href="list.bo?bType=admin";},
	         error    : function(data) { console.log("오류"); }
	      });
	   });
	      
	
</script>
	
<% } %>
</body>
</html>