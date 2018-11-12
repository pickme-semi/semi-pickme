<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.qna.user.qnaUserInsert.model.vo.*, java.util.*"%>
	
<% QnaBoard q = (QnaBoard)request.getAttribute("QnaBoard"); %>
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


	<div id="wrap">


		<div id="hyrendContentBody" style="height: 1658px;">

			<article id="container" class="mnHelpdesk pgHelpdeskHome">
				<div class="innerContainer" >

					<%@ include file="qnaHeaderM.jsp"%>


					<div class="contentBody" style="padding: 100px 162px 102px;">


						<h1 style="width: 700px;">문의/신고 확인</h1>


						<div class="tbl_vt faqlist" style="width: 700px;">
							<table>
								<caption>
									<span>문의/신고 확인</span>
								</caption>

									<tr>
										<td>문의 유형</td>
										<td><span><%= q.getQtype() %></span></td>
										
										<td>카테고리</td>
										<td><span><%= q.getQcategory() %></span></td>
										
										<td>문의 제목</td>
										<td><span><%= q.getQtitle() %></span></td>
										
										<td>처리 여부</td>
										<td><span><%= q.getQstatus() %></span>
									</tr>
					
									
									<tr>
										<td>작성자</td>
										<td><span><%= q.getQno() %></span>
										
										<td>작성일</td>
										<td><span><%= q.getQdate() %></span>
									</tr>
																
									
									<tr>
										<td colspan="2" class="answer" id="faq_ans_26049">
											<div class="inner">
												
												<p id="content"><%= q.getQcontent() %>

												<br> <input type="hidden" name="domainId" id="domainId"
													value="1"> <input type="hidden" name="domainId"
													id="logId" value="">

											</div>
										</td>
									</tr>
								
									
										<div name ="">
										<button onclick="location.href='<%= request.getContextPath() %>/qListM.bo'">목록</button>
										<button onclick="location.href='<%= request.getContextPath() %>/qUserRe.bo'">답변하기</button>
	
										</div>
										
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>
</body>
</html>
