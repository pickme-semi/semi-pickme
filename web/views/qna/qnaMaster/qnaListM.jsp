<%@page import="com.qna.user.qnaBoard.model.vo.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% ArrayList<QnaNotice> list = (ArrayList<QnaNotice>)request.getAttribute("qnaList"); %>
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
																		
																		<%for(QnaNotice q : list){%>
																		<tr>
																		
																			<td><%= q.getQcategory() %></td>
																			<td><%= q.getQnno() %></td>
																			<td><%= q.getQtitle() %></td>
																			<td><%= q.getQcount() %></td>
																			<td><%= q.getQwriter() %></td>
																			

																		</tr>
																		<%} %>
																		
																	</table>
																</div>




																<%-- 페이지 --%>
																<div class="tableArea" align="center">
																	<button
																		onclick="location.href='/selectList.bo?currentPage=1'"><<</button>
											
																	<button disabled><</button>

																	<button
																		onclick="location.href='/selectList.bo?currentPage='"><</button>

																	<button disabled></button>

																	<button
																		onclick="location.href='/selectList.bo?currentPage='"></button>


																	<button disabled>></button>

																	<button
																		onclick="location.href='/selectList.bo?currentPage='">></button>

																	<button
																		onclick="location.href='/selectList.bo?currentPage='">>></button>

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
		$('#listArea td').click(function(){
			var qnno = $(this).parent().children().eq(0).text();
			
		})
	})	

	</script>
	
</body>
</html>
