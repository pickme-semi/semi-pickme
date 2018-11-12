<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

					<%@ include file="qnaHeader.jsp"%>


					<div class="contentBody">


						<div class="contentBody"
							style="width: 770px; padding: 10px 130px 100px;">

							<section class="innerContent faq">
								<div id="gocont" class="content">

									<h1 style="font-size: 30px;">Report</h1>
									<p class="desc_vt">&nbsp;</p>
									<p class="ess mt">
										<span class="bl_ess">필수</span>항목은 <em>필수입력</em> 항목입니다.
									</p>
									<form id="inquiryForm" name="inquiryForm" method="post"
										action="" enctype="multipart/form-data">

										<fieldset>
											<legend class="blind">신고</legend>
											<div class="tbl inplist">
												<table>
													<caption>
														<span>신고하기</span>
													</caption>
													<colgroup>
														<col style="width: 170px">
														<col style="width: 540px">
													</colgroup>
													<tbody id="categoryBody">
														<tr>
															<th scope="row"><label for="categoryArea"
																class="thin_ic"> <span class="bl_ess">필수</span>&nbsp;신고유형<br>
																<br>
															</label></th>
															<br>
															<td>

																<div id="categoryArea" style="overflow: hidden;">
																	<span class="sel" style="width: 198px;"> <select
																		id="upperCategory" name="category">
																			<option value="">신고유형 선택</option>

																			<option value="5730">민감한 콘텐츠</option>

																			<option value="5731">무단 도용</option>

																			<option value="5732">스팸 관련</option>

																			<option value="5733">유저 신고</option>

																			<option value="5734">기타</option>

																	</select>
																	</span> <br>
																</div> <br> <input type="hidden"
																name="inquiry.categoryNo" id="categoryNo" value="">
																<input type="hidden" id="categoryName" value="회원">
															</td>
														</tr>
													</tbody>
													<tbody id="itemBody">
														<tr class="itemArea EMAIL" sort="1" itemno="4"
															requiredyn="Y" inputlength="70">
															<th scope="row"><label for="customerEmail"
																class="thin_ic"> <span class="bl_ess">필수</span>
																	<span class="itemExpression">이메일</span> <br>
																<br>
															</label></th>
															<td>
																<div class="email input" style="display: none;">
																	<span class="emailIput"
																		style="width: 230px; font-weight: bold; font-size: 15px;"></span>
																	<span
																		style="border-color: #bfbfbf; background: #fff; color: #191a1c; width: 58px; height: 28px; border-width: 1px; border-style: solid; display: inline-block; margin: 0 1px 0 0; vertical-align: top;">
																		<button type="button" class="btnEmail input"
																			style="color: #191a1c; font-size: 12px; line-height: 28px; text-align: center; display: block; width: 100%; height: 100%; cursor: pointer; text-decoration: none !important">수정</button>
																	</span>
																</div>
																<div class="email complete" style="display: block;">
																	<input type="text" class="emailId inp"
																		style="width: 133px"> <span class="mid">@</span>

																	<input type="text" class="emailDomain inp"
																		style="width: 133px" title="이메일 계정 입력"> <span
																		class="sel ml" style="width: 100px"> <select
																		class="emailDomainType" title="이메일 계정">
																			<option value="another">직접입력</option>
																			<option>naver.com</option>
																			<option>daum.net</option>
																			<option>nate.com</option>
																			<option>gmail.com</option>
																			<option>hotmail.com</option>
																			<option>outlook.com</option>
																			<option>yahoo.co.kr</option>
																			<option>korea.com</option>
																			<option>dreamwiz.com</option>
																			<option>chol.com</option>
																	</select> <br>
																	<br></span> <span class="spanEmail complete"
																		style="border-color: rgb(191, 191, 191); background: rgb(255, 255, 255); color: rgb(25, 26, 28); width: 58px; height: 28px; border-width: 1px; border-style: solid; display: none; margin: 0px 1px 0px 0px; vertical-align: top;">
																		<button type="button" class="btnEmail complete"
																			style="color: #191a1c; font-size: 12px; line-height: 28px; text-align: center; display: block; width: 100%; height: 100%; cursor: pointer; text-decoration: none !important">확인</button>
																	</span>
																</div> <input type="hidden" id="customerEmail"
																class="contents" value="@"> <input type="hidden"
																class="itemNo" value="4">
															</td>
														</tr>




														<tr class="itemArea TEXT" sort="2" itemno="5"
															requiredyn="Y" inputlength="100" datatype="CHAR">
															<th scope="row"><label for="inquiryTitle"
																class="thin_ic"> <span class="bl_ess">필수</span>
																	<span class="itemExpression">신고제목</span><br>
																<br>
															</label></th>
															<td>
																<div class="pr">
																	<span class="help_txt"></span> <input type="text"
																		id="inquiryTitle" class="contents inp"
																		style="width: 462px" maxlength="100"> <input
																		type="hidden" class="guideContent" value=""> <input
																		type="hidden" class="guideDisplayYN" value="N">
																	<input type="hidden" class="guideInitializeYN"
																		value="Y"> <input type="hidden" class="itemNo"
																		value="5"><br>
																	<br>
																</div>
															</td>
														</tr>

														<tr class="itemArea TEXT" sort="2" itemno="5"
															requiredyn="Y" inputlength="100" datatype="CHAR">
															<th scope="row"><label for="inquiryTitle"
																class="thin_ic"> <span class="bl_ess">필수</span>
																	<span class="itemExpression">신고 주소</span><br>
																<br>
															</label></th>
															<td>
																<div class="pr">
																	<span class="help_txt"></span> <input type="text"
																		id="inquiryTitle" class="contents inp"
																		style="width: 462px" maxlength="100"> <input
																		type="hidden" class="guideContent" value=""> <input
																		type="hidden" class="guideDisplayYN" value="N">
																	<input type="hidden" class="guideInitializeYN"
																		value="Y"> <input type="hidden" class="itemNo"
																		value="5"><br>
																	<br>
																</div>
															</td>
														</tr>


														<tr class="itemArea HTML" sort="3" itemno="13"
															requiredyn="Y">
															<th scope="row"><label for="inquiryContent"
																class="thin_ic"> <span class="bl_ess">필수</span>
																	<span class="itemExpression">신고내용</span><br>
																<br>
															</label></th>
															<td>
																<div class="pr">
																	<textarea id="inquiryContent" class="contents inp"
																		cols="30" rows="4" maxlength="5000"
																		style="width: 482px; height: 300px"></textarea>
																	<p class="rei">
																		<span class="bytes">0 / 5000 </span>
																	</p>
																	<input type="hidden" class="guideContent" value="">
																	<input type="hidden" class="guideDisplayYN" value="N">
																	<input type="hidden" class="guideInitializeYN"
																		value="Y"> <input type="hidden" class="itemNo"
																		value="13"><br>
																</div>
															</td>
														</tr>




														<tr class="itemArea HIDDEN" sort="4" itemno="2"
															requiredyn="N" style="display: none;">
															<td colspan="2"><input type="hidden"
																id="customerMemberID" class="contents" value="">
																<input type="hidden" class="itemNo" value="2"></td>
														</tr>


														<tr class="itemArea PHONE" sort="5" itemno="8"
															requiredyn="N" inputlength="30">
															<th scope="row"><label for="cellphoneNumber"
																class="thin_ic"> <span class="itemExpression"><br>
																	<br>답변알림<br>
																	<br></span>
															</label></th>
															<td><br>
															<br> <span class="chk"><input type="checkbox"
																	id="chkSmsAccept" style="width: 30px; height: 30px">
															</span><label for="chkSmsAccept">알림신청</label> <span
																class="sel ml2" style="width: 79px"> <select
																	title="휴대폰 국번 선택" class="mobileHead">
																		<option value="010">010</option>
																		<option value="011">011</option>
																		<option value="016">016</option>
																		<option value="017">017</option>
																		<option value="018">018</option>
																		<option value="019">019</option>
																</select>
															</span> <span class="mid_desh">-</span> <input type="text"
																class="inp mobileMid" style="width: 98px" maxlength="4">
																<span class="mid_desh">-</span> <input type="text"
																class="inp mobileTail" style="width: 98px" maxlength="4">
																<!-- Don't remove -->
																<div class="phone complete" style="display: none">
																</div> <!-- Don't remove -->



																<p class="caution_tb"
																	style="font-size: 12px; color: gray">

																	<span class="mk_ex"></span> 문의하신 신고 내용의 답변 완료 시 선택하신
																	방법으로 알려드립니다. <br> SMS 발송 : 09시~21시까지 발송하며, 심야 처리건은
																	다음날 09시에 자동 발송됩니다.
																</p> <input type="hidden" id="cellphoneNumber"
																class="contents phone" value=""> <input
																type="hidden" class="itemNo" value="8"></td>
														</tr>
														<tr class="itemArea FILE" sort="6" itemno="37"
															requiredyn="N">
															<th scope="row"><label for="attachFile"
																class="thin_ic"> <span class="itemExpression">파일첨부</span>
															</label></th>
															<td>
																<div class="pr">
																	<div class="inp_file">
																		<br> <input type="text" id="attachFile"
																			class="contents" readonly=""> <span
																			class="bn bn_sm bn_gy"><em>파일선택</em><input
																			type="file" class="file unstaged"></span> <span
																			class="bn bn_sm bn_gy"><button type="button"
																				class="btnAddFile">첨부</button></span>
																	</div>
																	<ul class="fileList" style="display: none;">
																	</ul>

																	<p class="caution_tb"
																		style="font-size: 12px; color: gray">
																		<span class="mk_ex"></span>10M 이내 파일만 3개까지 첨부 가능합니다.<br>실행파일(exe),
																		링크(link), 아이콘(ico)은 첨부되지 않습니다.
																	</p>
																</div>
															</td>
														</tr>
														<tr class="itemArea ACPINFO last" sort="7" itemno="112"
															requiredyn="Y">
															<td colspan="2">
																<div>

																	<p class="caution_tb"
																		style="font-size: 12px; color: gray">
																		<span class="mk_ex" style="font-size: 9px"></span><br>
																		<br>
																		<br>수집된 개인정보는 (아이디, 이메일, 휴대폰번호) 문의내용 처리 및 고객불만의
																		해결을 위해 사용되며,<br>전자상거래법에 따라 3년간 보관 후 삭제됩니다.
																	</p>

																	<p class="caution_tb"
																		style="font-size: 12px; color: gray">
																		<span class="chk"><input type="checkbox"
																			id="acpinfo" class="contents" value="N"></span><label
																			for="acpinfo">위, 개인정보 수집 및 이용에 동의합니다.</label>
																	</p>
																	<input type="hidden" class="itemNo" value="112">
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
												class="qnaBt" id="btnSend">확인</button></span> <span
											class="bn bn_big bn_bk"><button type="reset"
												class="qnaBt" id="btnRe">취소</button></span>
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

	/* 이메일 선택  */
	$('.emailDomainType').click(function() {
		var emailD = "";
		emailD = $('.emailDomainType').val();

		if (emailD == 'another') {
			emailD = "";
		}

		$('.emailDomain.inp').val(emailD);
	});

	/* 파일 선택 */
	$('.btnAddFile').click(function() {
		var fileAdd = String($('.file.unstaged').val());

		if (fileAdd != null) {
			$('#attachFile').val(fileAdd);
		}
	});

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