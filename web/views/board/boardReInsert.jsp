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
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( (session.getAttribute("user") == null)){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else{ %>

	<%@ include file="common/boardHeader.jsp" %>
	<div class="pm-section col-xs-12 col-md-8" align="center">
		<form id="insertForm" style="width : 50%" enctype="multipart/form-data">
			
			
			<h1>입력폼</h1>
			
			<table>
			<tr>
					<td>  카테고리 :</td>
					<td><span><%= b.getCategoryId() %>&nbsp;&nbsp;</span></td>
					<td>  제목 : </td>
					<td><span><%= b.getTitle() %>&nbsp;&nbsp;</span></td>
					<td>  작성일 :</td>
					<td><span><%= b.getEnrollDate() %>&nbsp;&nbsp;</span>
			</tr>							
			<tr> 
					<td colspan="2" class="answer" >
					<div class="inner"><br><br>
												
					<p><%= b.getContent() %></p>
					
					</div>
				</td>
			</tr>
			</table>		

			<div class="row">
				
			</div>


			<br />
			<div class="row">
				<textarea name="content" placeholder="내용" id="content" cols="30" rows="10" class="form-control" required="required"></textarea>
				<p id="errorContent" style="display:none;color:red;">내용을 입력하세요</p>
			</div>
			
			
			<div class="" align="center">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#successModal" id="succcessBtn">작성</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cancelModal">취소</button>
			</div>
		
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

	$("#btnSuccess").click(function(){
		var reData = new Object();
		
		reData.bid = '<%=b.getId()%>';
		reData.conent = $('#content').val();
		
		$.ajax({
			url : "/pickme/reInsert.bo",
			rype : "get",
			data : reData,
			success : function(data) { location.href = "/pickme/reInsert.bo" },
			error 	: function(data) { console.log("오류"); }
		});
	});
		
	

	
	$("#btnCancle").click(function(){
		cancelBoard();
		location.href = "/pickme/list.bo";
	});

	function insertBoard(){
		if($("#title").val() == ""){
			$("#successModal").modal('toggle');
			$("#errorTitle").attr("style", "display:;color:red;");
			$("#title").focus();
			$("#title").blur();
			return false;
		}
		
		if($("#content").val() == ""){
			$("#successModal").modal('toggle');
			$("#errorContent").attr("style", "display:;color:red;");
			$("#content").focus();
			$("#content").blur();
			return false;
		}
		
		$("#insertForm").submit();
	}
		
	function cancelBoard(){
		$("input").val("");
		$("textarea").val("");
	}
</script>
	
<% } %>
</body>
</html>