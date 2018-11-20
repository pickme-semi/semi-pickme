<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.model.vo.*" %>

<%	
	String type = (String)session.getAttribute("bType");
	ArrayList<BoardCategory> categoryList = (ArrayList<BoardCategory>)session.getAttribute("cateList");
	Board b = (Board)request.getAttribute("board");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>

<style>
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
		<form id="insertForm" action="/pickme/insert.bo">

			<div>
				<table class="table table-bordered" style="text-align: center;">
					<tr>
						<th width="140px">카테고리</th>
						<th>
						<% for(int i = 0; i< categoryList.size(); i++){
						if(categoryList.get(i).getId() == b.getCategoryId()){ %>		
						<%= categoryList.get(i).getConetent() %>		
						<% 	}						
						}%>
						</th>
					</tr>
					
					<tr>
						<th width="140px">제목</th>
						<th><%= b.getTitle() %></th>
					</tr>
					
					<tr>
						<th width="140px">내용</th>
						<th>
						<textarea name="content" placeholder="내용" id="content" cols="30" rows="10" class="form-control" required="required" style="border: none;"><%= b.getContent() %></textarea>
						<p id="errorContent" style="display:none;color:red;">내용을 입력하세요</p></th>
					</tr>
					
					<!-- 신고-->
					<% if(type.equals("report")){ %>
					<tr>
						<th width="140px">신고 pick</th>
						<th style="text-align: left;"><input type="text" value="<%= b.getPickId() %>" name="pickId" style="border: none;"/></th>
					</tr>
					<% } %>
				</table>

			</div>
			
			
			

			
			<br />
			<div class="" align="center">
				<button type="button" class="btnTest" data-toggle="modal" data-target="#successModal" id="succcessBtn">작성</button> &nbsp;&nbsp;&nbsp;
				<button type="button" class="btnTest" data-toggle="modal" data-target="#cancelModal">취소</button>
			</div>
			<input type="hidden" id="bType" name="bType" value="<%=type%>" />
		</form>
	</div><br><br>
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
	      
	      reData.id = '<%=b.getId()%>';
	      reData.content = $('#content').val();
	      reData.pickId = $('#pickId').val();
	      
	      $.ajax({
	         url : "/pickme/bUpdate.bo",
	         rype : "get",
	         data : reData,
	         success : function(data) { location.href="/pickme/selectOne.bo?id=" + "<%=b.getId()%>";},
	         error    : function(data) { console.log("오류"); }
	      });
	   });
</script>
	
<% } %>
</body>
</html>