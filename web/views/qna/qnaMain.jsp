<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>QNA</title>
        
        <link rel="stylesheet" href="../../resources/css/qna.css">
        <script src="../../resources/bootstrap-4.1.3/js/bootstrap.min.js"></script>
		<script src="../../resources/js/jquery-3.3.1.min.js"></script>


     </head>


     <body>

    
            <div id="wrap">
        
     
                <div id="hyrendContentBody" style="height: 1658px;">
                
        <article id="container" class="mnHelpdesk pgHelpdeskHome">
            <div class="innerContainer">
  
                <%@ include file="qnaHeader.jsp"  %>
    
    
                <div class="contentBody">
                
            <!-- //lnbHelp -->
                    
                    <div class="content" id="helpContentArea">
                        <div class="innerContent">
                            <form name="frm" onsubmit="return false;">
                                <fieldset class="search">
                                    <legend class="blind">자주묻는 질문 검색</legend>
                                    <label for="inp_search">질문 검색하기</label>
                                    <span class="sel">
                                        <select title="검색 카테고리 선택" name="subId" id="category_sel" onchange="bugs.wiselog.area('help_hcontents_01_01');">
                                            <option value="4598" selected=z>전체</option>
                                            <option value="4600">PICK</option>
                                            <option value="4601">회원정보</option>
                                            <option value="4602">포인트</option>
                                            <option value="4603">기타</option>
                                        </select>
                                    </span>
                                    <input type="text" name="searchKeyword" id="searchInput" style="width:289px" onkeydown="searchInputEventHandler(event);">
                                    <span class="btns"><button type="button" onclick="moveSearch();">검색</button></span>
                                    <p id="ex">EX )  비밀번호 변경  |  신고 방법  |  포인트</p>
                                   
                                </fieldset>
                            </form>
                        </div>
                        <!-- //search -->
                        
                        <section class="innerContent faq">
                            <h1>자주 묻는 질문 HOT 10</h1>
                            
                            <table class="list tbList">
                                <caption>자주 묻는 질문 HOT 10 목록</caption>
                                <colgroup><col width="200"><col></colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="category"><span>분류</span></th>
                                        <th scope="col" class="question"><span>질문</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA1">QNA1
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA2">QNA2
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA3">QNA3
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA4">QNA4
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA5">QNA5
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA6">QNA6
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA7">QNA7
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA8">QNA8
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA9">QNA9
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="left">HOT</td>
                                        <th class="left">
                                            <a href="javascript:;" class="title" onclick="" title="QNA10">QNA10
                                            </a>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                       
            </div>
          </div>
         </div>
       </article>
     </div>
   </div>
 </body>
</html>
            
            
    