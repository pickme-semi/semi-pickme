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
												여기에 내용<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br>
												<br> <input type="hidden" name="domainId" id="domainId"
													value="1"> <input type="hidden" name="domainId"
													id="logId" value="71607fa3-9462-47b0-b816-2cd2cb68180b">
												<div class="faq_wrap">
													<form id="faqSatisfaction1" action="">
														<fieldset>
															<legend>
																<div class="blind">FAQ 만족도 조사</div>
															</legend>

															<dl class="rating">
																<dt>궁금하신 내용이 해결 되셨나요?</dt>
																<dd class="score_area">
																	<ul class="lst_score">

																		<li><input type="radio" name="fbCheck1"
																			id="fbCheck10" value="100"><label
																			for="fbCheck10">매우 도움됨</label></li>

																		<li><input type="radio" name="fbCheck1"
																			id="fbCheck11" value="80"><label
																			for="fbCheck11">도움됨</label></li>

																		<li><input type="radio" name="fbCheck1"
																			id="fbCheck12" value="60"><label
																			for="fbCheck12">보통</label></li>

																		<li><input type="radio" name="fbCheck1"
																			id="fbCheck13" value="40"><label
																			for="fbCheck13">도움 안됨</label></li>

																		<li><input type="radio" name="fbCheck1"
																			id="fbCheck14" value="20"><label
																			for="fbCheck14">전혀 도움 안됨</label></li>

																	</ul>
																</dd>
																<dd class="textarea_wrap">
																	<textarea id="fbContents1" title="고객의견"
																		class="customer_feedback"></textarea>
																	<span id="feedbackLen1" class="count_txt">2자입력 /
																		최대 500자</span>
																</dd>
															</dl>
															<div class="btn_wrap">
																<a
																	href="javascript:faqFeedback('fbCheck1','fbContents1', '26049', '1','1');"
																	class="bn btn_ok">확인</a>
															</div>

															<!--// 만족도 평가 -->
															<script type="text/javascript">
																feedbackLengthCheck(
																		$("#fbContents1"),
																		$("#feedbackLen1"));
															</script>


												
															
															
														</fieldset>
													</form>
												</div>
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
</body>
</html>