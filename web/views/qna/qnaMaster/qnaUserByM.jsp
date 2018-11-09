<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.qna.user.qnaUserInsert.model.vo.*, java.util.*"%>
	
<% 
	ArrayList<QnaBoard> list = (ArrayList<QnaBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>
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

<!-- 관리자 전용 글 목록 페이지 (신고/질문) 답변은 답변 버튼 만들어 작성자의 메일 주소로 전송 -->
<!-- 헤더의 신고/질문 카테고리 클릭 시 해당 글 목록을 가져올 수 있도록 하기 -->
<!-- 처리되지 않은 문의만 확인하는 버튼 생성하기 -->
	
	
	<div id="wrap">


		<div id="hyrendContentBody" style="height: 1658px;">

			<article id="container" class="mnHelpdesk pgHelpdeskHome">
				<div class="innerContainer" >

					<%@ include file="qnaHeaderM.jsp"%>


					<div class="contentBody" style="padding: 100px 162px 102px;">


						<h1 style="width: 700px;">접수된 문의 리스트</h1>
						


						<div class="tbl_vt faqlist" >
							<table id="list">												
							<tbody style="width: 700px ">

							<tr>
								<td colspan="4" class="answer" id="faq_ans_26049">
												 
								<div class="faq_wrap">
								<form id="faqSatisfaction1" action="">
								<fieldset>
															

									<div class="outer"><br>
											<div class="faqTitle on">
												<table align="center" id="listArea">
													<tr>
													<th width="50px">글번호</th>
													<th width="50px">카테고리</th>
													<th width="200px">글제목</th>
													<th width="50">작성일</th>
													<th width="50">처리여부</th>
													</tr>
																		
													<% for(QnaBoard q : list){ %>						
													<tr>
													<input type="hidden" value="<%= q.getQid() %>">
													<td><%= q.getQno() %></td>
													<td><%= q.getQcategory() %></td>
													<td><%= q.getQtitle() %></td>
													<td><%= q.getQdate() %></td>
													<td><%= q.getQstatus() %></td>
													</tr>
													<%} %>					
													</table>
											</div>




											<%-- 페이지 --%>
											
											<div class="tableArea" align="center">
												<button onclick="location.href='<%= request.getContextPath() %>/qListM.bo?currenPage=1'">처음으로</button>
												
												<% if(currentPage <= 1) {%>
												<button disabled><</button>
												<%}else{ %>
												<button onclick="location.href='/qListM.bo?currentPage='">앞</button>
												<%} %>
												<% for(int p = startPage; p <= endPage; p++){
														if(p == currentPage){	%>
													<button disabled><%= p %></button>
												<% }else{ %>
													<button onclick="location.href='<%= request.getContextPath() %>/qListM.bo?currentPage=<%= p %>'"><%= p %></button>
												<%      } %>
												<% } %>
													
												<%  if(currentPage >= maxPage){  %>
												<button disabled>></button>
												<%  }else{ %>
												<button onclick="location.href='<%= request.getContextPath() %>/qListM.bo?currentPage=<%=currentPage + 1 %>'">뒤</button>
												<%  } %>
												<button onclick="location.href='<%= request.getContextPath() %>/qListM.bo?currentPage=<%= maxPage %>'">끝으로</button>

											</div>
									</div>
															
															
							</fieldset>
							</form>
							</div>
										
							</td>
							</tr>
						</tbody>
						</table>
					</div>
				</div>
				</div>
			</article>
		</div>
	</div>
	
	
		<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"font-color" : "black", "cursor":"pointer"});
			}).click(function(){
				var qno = $(this).parent().find("input").val();
				location.href="<%=request.getContextPath()%>/MselectOne.qno?qno=" + qno;
			});
		});
	</script>
</body>
</html>
