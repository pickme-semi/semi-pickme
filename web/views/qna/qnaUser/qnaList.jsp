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


	<div id="wrap">


		<div id="hyrendContentBody" style="height: 1658px;">

			<article id="container" class="mnHelpdesk pgHelpdeskHome">
				<div class="innerContainer" >

					<%@ include file="qnaHeader.jsp"%>


					<div class="contentBody" style="padding: 100px 162px 102px;">


						<h1 style="width: 700px;">자주 묻는 질문</h1>


						<div class="tbl_vt faqlist" >
							<table id="list">
								
								
								<tbody style="width: 700px ">



									<tr>
										<td colspan="2" class="answer" id="faq_ans_26049">
											
												 <input type="hidden" name="domainId" id="domainId"
													value="1"> <input type="hidden" name="domainId"
													id="logId" value="71607fa3-9462-47b0-b816-2cd2cb68180b">
												<div class="faq_wrap">
													<form id="faqSatisfaction1" action="">
														<fieldset>
															
																


															<div class="outer">
																<br>

																<div class="faqTitle on">
																	<table align="center" id="listArea">
																		<tr>
																			<th width="100px">글번호</th>
																			<th width="300px">글제목</th>
																			<th width="100px">조회수</th>

																		</tr>
																		
																		
																		<tr>
																			<input type="hidden" value="">
																			<td>1</td>
																			<td>2</td>
																			<td>3</td>
																			

																		</tr>
																		
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
</body>
</html>
