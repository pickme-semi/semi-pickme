<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.user.model.vo.*"%>
<%
	User users = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>

<link rel="preload" href="/pickme/resources/css/swell-2472ebd5fc.css" as="style" onload="this.rel='stylesheet'">

</head>
<body>

<%@ include file="../common/header.jsp" %>


<div class="col-md-12 text-center user">
 
<% if(users.getProfile() != null) {%>
  <img src="/pickme/resources/profileImage/<%= users.getProfile() %>" alt="Me" class="rounded-circle attr">
<% } else{ %>
	<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
<% }%>
<h2><%= users.getUserId() %></h2>
<h5>한 줄 소개</h5>
<button id ="fBtn" onclick="followBtn();">follow</button>
<br />
<br />

</div>

<section class="page-section page-section--vote">


  <div class="page-section__content">
    <header class="page-section__header">
      <h2 class="page-section__header__title page-section__header__title--vote">
        What's Your Pick?</h2>
     </header>
       
        
        <div class="live-swell">
          <div class="live-swell__pics">
            <div id="live-swell-img-a" class="live-swell__pics__pic live-swell__pics__pic--a">

            </div>
            <div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b">
              
            </div>
            <div class="live-swell__results">
              <div id="live-swell-result-a" class="live-swell__results__result live-swell__results__result--a option option-a">
              </div>
              <div id="live-swell-result-b" class="live-swell__results__result live-swell__results__result--b option option-b">
                57%</div>
              </div>
              <div class="live-swell__pics__or">
                  or</div>
           </div>
         </div>
   </div>
</section>


<%@ include file="../common/footer.jsp" %>

<script>
	function followBtn(){
	
		location.href='<%= request.getContextPath() %>/fiPage.pr?uno1=<%=users.getUserNo() %>&uno2=<%=user.getUserNo()%>'
	}

</script>
</body>
</html>