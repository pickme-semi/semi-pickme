<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


<!-- 관리자 전용 QNA 메인페이지 -->
<!-- 최근 올라온 문의/신고 TOP 10 형태로 출력 가능하게 설정 예정 / 관리자 전용 공지사항 상단에 띄우기 -->

    <head>
        <meta charset="utf-8">
        <title>QNA</title>
        
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
  
                <%@ include file="qnaHeaderM.jsp"  %>
    
    
                <div class="contentBody">
                
            <!-- //lnbHelp -->
                    
                    <div class="content" id="helpContentArea">

                        <!-- //search -->
                        
                        <section class="innerContent faq">
                            <h1>신규 문의 내역</h1>
                            
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
            
            
    