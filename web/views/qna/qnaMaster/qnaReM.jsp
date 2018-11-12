<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.qna.user.qnaUserInsert.model.vo.*, java.util.*"%>
	
<% QnaBoard q = (QnaBoard)request.getAttribute("QnaBoard"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA Report</title>

<link rel="stylesheet" href="../../../resources/css/qna.css">
<script src="../../../resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
<script src="../../../resources/js/qna.js"></script>


</head>
<body>

	<div id="wrap">


		<div id="hyrendContentBody" style="height: 1658px;">

			<article id="container" class="mnHelpdesk pgHelpdeskHome">
				<div class="innerContainer">

					<%@ include file="qnaHeaderM.jsp"%>


					<div class="contentBody">


						<div class="contentBody"
							style="width: 770px; padding: 10px 130px 100px;">

							<section class="innerContent faq">
								<div id="gocont" class="content">

									<h1 style="font-size: 30px;">1:1 문의/신고 답변 작성</h1>
									<p class="desc_vt">&nbsp;</p>
									<p class="ess mt">
										<span class="bl_ess">필수</span>항목은 <em>필수입력</em> 항목입니다.
									</p>
									<form id="inquiryForm" name="inquiryForm" method="post"
										action="" enctype="multipart/form-data">

										<fieldset>
											<legend class="blind">신고/문의 답변</legend>
											<div class="tbl inplist">
												<table>
													<caption>
														<span>신고/문의 답변 작성</span>
													</caption>
													<colgroup>
														<col style="width: 170px">
														<col style="width: 540px">
													</colgroup>


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
														
																	
															</tbody>
														</table>


													<tbody id="itemBody">
														
														<tr class="itemArea TEXT" sort="2" itemno="5"
															requiredyn="Y" inputlength="100" datatype="CHAR">
															<th scope="row"><label for="inquiryTitle"
																class="thin_ic"> <span class="bl_ess">필수</span>
																	<span class="itemExpression" >답변 제목</span><br>
																<br>
															</label></th>
															<td>
																<div class="pr">
																	<span class="help_txt"></span> 
																	<input type="text" id="inquiryTitle" class="contents inp"
																		style="width: 462px" maxlength="100" name="reTitle"> 
																		
																	<input type="hidden" class="guideContent" value=""> 
																	<input type="hidden" class="guideDisplayYN" value="N">
																	<input type="hidden" class="guideInitializeYN" value="Y"> 
																	<input type="hidden" class="itemNo" value="5"><br>
																	<br>
																</div>
															</td>
														</tr>

														<tr class="itemArea HTML" sort="3" itemno="13"
															requiredyn="Y">
															<th scope="row"><label for="inquiryContent"
																class="thin_ic"> <span class="bl_ess">필수</span>
																	<span class="itemExpression" >답변 내용</span><br>
																<br>
															</label></th>
															<td>
																<div class="pr">
																	<textarea id="inquiryContent" class="contents inp"
																		cols="30" rows="4" maxlength="5000"
																		style="width: 482px; height: 300px" name="reContent"></textarea>
																	<p class="rei">
																		<span class="bytes">0 / 5000 </span>
																	</p>


																</div>
															</td>
														</tr>

													</tbody>
												</table>
											</div>
										</fieldset>
									</form>
									<br>
									<div class="bn_wrap v2" style="margin: 0 auto; width: 50%;">
										<span class="bn bn_big bn_rd"><button type="submit"
												class="qnaBt" id="btnSend" onclick="complet();">전송</button></span> <span
											class="bn bn_big bn_bk"><button type="reset"
												class="qnaBt" id="btnRe" onclick="reset();">취소</button></span>
									</div>
								</div>
							</section>



						</div>
					</div>
				</div>
			</article>
		</div>
	</div>

<script>
/* 신고 / 문의 영역 */




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
		$('#btnSend').click(function(){
			if(confirm('전송확인') == true){				
				document.btnSend.submit(); 
				$("inquiryForm").attr("action","<%= request.getContextPath()%>")	
			}	
		});
	});

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