<%@page import="com.qna.user.qnaBoard.model.vo.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% 
	ArrayList<QnaNotice> qlist = (ArrayList<QnaNotice>)request.getAttribute("qlist"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
	
<!DOCTYPE html>
<html>

<!-- 현재 존재하는 QNA 리스트 페이지 -->
<!-- 테이블 안에 카테고리 버튼 추가해서 항목별 확인 가능하게 만들 예정 -->

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/qna.css">
<script src="../../../resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
<script src="../../../resources/js/qna.js"></script>
</head>
<body>


	
	
	<div id="wrap">


		<div id="hyrendContentBody" style="height: 1658px;">

			<article id="container" class="mnHelpdesk pgHelpdeskHome">
				<div class="innerContainer" >

					<%@ include file="qnaHeaderM.jsp"%>


					<div class="contentBody" style="padding: 100px 162px 102px;">


						<h1 style="width: 700px;">QnA 리스트</h1>


						<div class="tbl_vt faqlist" >
							<table id="list">
								
								
								<tbody style="width: 700px ">



									<tr>
										<td colspan="2" class="answer" id="faq_ans_26049">
											
												 <input type="hidden" name="domainId" id="domainId"
													value="1"> <input type="hidden" name="domainId"
													id="logId" value="">
												<div class="faq_wrap">
													<form id="faqSatisfaction1" action="">
														<fieldset>
															
																


															<div class="outer">
																<br>

																<div class="faqTitle on">
																	<table align="center" id="listArea">
																		<tr>
																			<th width="100px">카테고리</th>
																			<th width="100px">글번호</th>
																			<th width="300px">글제목</th>
																			<th width="100px">조회수</th>
																			<th width="100px">작성자</th>

																		</tr>
																		
																		<% for(QnaNotice q : qlist){ %>
																		<tr>
																		
																			<td><%= q.getQcategory() %></td>
																			<td><%= q.getQno() %></td>
																			<td><%= q.getQtitle() %></td>
																			<td><%= q.getQcount() %></td>
																			<td>작성자는후에추가</td>
													
																		</tr>
																		<%} %>
																		
																	</table>
																</div>




																<%-- 페이지 --%>
																<div class="pagingArea" align="center">
						<button onclick="location.href='<%= request.getContextPath() %>/qnaList.no?currentPage=1'"><<</button>
						<%  if(currentPage <= 1){  %>
						<button disabled><</button>
						<%  }else{ %>
						<button onclick="location.href='<%= request.getContextPath() %>/qnaList.no?currentPage=<%=currentPage - 1 %>'"><</button>
						<%  } %>
						
						<% for(int p = startPage; p <= endPage; p++){
								if(p == currentPage){	
						%>
							<button disabled><%= p %></button>
						<%      }else{ %>
							<button onclick="location.href='<%= request.getContextPath() %>/qnaList.no?currentPage=<%= p %>'"><%= p %></button>
						<%      } %>
						<% } %>
							
						<%  if(currentPage >= maxPage){  %>
						<button disabled>></button>
						<%  }else{ %>
						<button onclick="location.href='<%= request.getContextPath() %>/qnaList.no?currentPage=<%=currentPage + 1 %>'">></button>
						<%  } %>
						<button onclick="location.href='<%= request.getContextPath() %>/qnaList.no?currentPage=<%= maxPage %>'">>></button>
						
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

	</script>
	
</body>
</html>
